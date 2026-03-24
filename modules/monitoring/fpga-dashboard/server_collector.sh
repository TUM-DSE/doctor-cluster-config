#!/run/current-system/sw/bin/bash
export PATH="/run/current-system/sw/bin:/run/wrappers/bin:$PATH"
# Server resource collector for node_exporter textfile collector
# Outputs Prometheus metrics about:
#   1. Per-user heavy processes (vivado, make, gcc, dpdk apps)
#   2. FPGA driver/device status
#   3. 100G NIC status (driver binding, link state)

OUTPUT_DIR="/var/lib/node_exporter/textfile_collector"
OUTPUT_FILE="${OUTPUT_DIR}/server_status.prom"
TMP_FILE="${OUTPUT_FILE}.tmp"

mkdir -p "$OUTPUT_DIR"

cat /dev/null > "$TMP_FILE"

# --- 1. Per-user process tracking ---
echo "# HELP server_process_cpu_percent CPU usage percent of tracked process" >> "$TMP_FILE"
echo "# TYPE server_process_cpu_percent gauge" >> "$TMP_FILE"
echo "# HELP server_process_mem_bytes RSS memory in bytes of tracked process" >> "$TMP_FILE"
echo "# TYPE server_process_mem_bytes gauge" >> "$TMP_FILE"
echo "# HELP server_process_running Whether a tracked process is running (1=yes)" >> "$TMP_FILE"
echo "# TYPE server_process_running gauge" >> "$TMP_FILE"
echo "# HELP server_process_elapsed_seconds Elapsed wall-clock time since process start" >> "$TMP_FILE"
echo "# TYPE server_process_elapsed_seconds gauge" >> "$TMP_FILE"

# Parse elapsed time (formats: MM:SS, HH:MM:SS, D-HH:MM:SS) to seconds
parse_etime() {
    local etime="$1"
    local days=0 hours=0 mins=0 secs=0
    if [[ "$etime" == *-* ]]; then
        days="${etime%%-*}"
        etime="${etime#*-}"
    fi
    IFS=: read -ra parts <<< "$etime"
    if [ ${#parts[@]} -eq 3 ]; then
        hours="${parts[0]}"
        mins="${parts[1]}"
        secs="${parts[2]}"
    elif [ ${#parts[@]} -eq 2 ]; then
        mins="${parts[0]}"
        secs="${parts[1]}"
    fi
    echo $(( 10#$days*86400 + 10#$hours*3600 + 10#$mins*60 + 10#$secs ))
}

# Track these process patterns
PATTERNS="vivado|Vivado|make|gcc|g\+\+|cc1|cc1plus|ld\.gold|ninja|dpdk|client|server|iperf"

# Collect processes, deduplicate per (user, type) — keep the heaviest (highest CPU, then RSS)
declare -A proc_cpu proc_rss proc_pid proc_comm proc_elapsed

while read -r user pid cpu mem rss etime comm args; do
    # Skip system users
    [[ "$user" == "root" || "$user" == "nobody" || "$user" == "systemd"* ]] && continue

    # Determine process type
    ptype="unknown"
    case "$comm" in
        vivado|Vivado)
            if [[ "$args" == *"bitgen.tcl"* ]]; then
                ptype="bitgen"
            elif [[ "$args" == *"auto_fpga.tcl"* || "$args" == *"program"* ]]; then
                ptype="fpga-program"
            else
                ptype="vivado"
            fi
            ;;
        make|ninja)
            if [[ "$args" == *"bitgen"* ]]; then
                ptype="bitgen"
            else
                ptype="build"
            fi
            ;;
        gcc|g++|cc1|cc1plus|ld|ld.gold) ptype="compiler" ;;
        client|server) ptype="dpdk-app" ;;
        iperf*)        ptype="iperf" ;;
    esac
    [[ "$ptype" == "unknown" ]] && continue

    # Skip idle make/build processes (waiting parents with 0% CPU and <10MB RSS)
    if [[ "$ptype" == "build" && "$cpu" == "0.0" && "$rss" -lt 10240 ]]; then
        continue
    fi

    key="${user}::${ptype}"
    rss_bytes=$((rss * 1024))
    elapsed=$(parse_etime "$etime")

    # Keep the process with highest CPU (then highest RSS as tiebreaker)
    if [ -z "${proc_cpu[$key]}" ]; then
        proc_cpu[$key]="$cpu"
        proc_rss[$key]="$rss_bytes"
        proc_pid[$key]="$pid"
        proc_comm[$key]="$comm"
        proc_elapsed[$key]="$elapsed"
    else
        better=$(awk "BEGIN { print (($cpu > ${proc_cpu[$key]}) || ($cpu == ${proc_cpu[$key]} && $rss_bytes > ${proc_rss[$key]})) }")
        if [ "$better" = "1" ]; then
            proc_cpu[$key]="$cpu"
            proc_rss[$key]="$rss_bytes"
            proc_pid[$key]="$pid"
            proc_comm[$key]="$comm"
            proc_elapsed[$key]="$elapsed"
        fi
    fi
done < <(ps -eo user:32,pid,%cpu,%mem,rss,etime,comm,args --no-headers | \
    grep -E "$PATTERNS" | \
    grep -vE "grep|process-exporter|node_exporter|server_collector|prometheus|grafana")

# Emit deduplicated processes
for key in "${!proc_pid[@]}"; do
    user="${key%%::*}"
    ptype="${key##*::}"
    pid="${proc_pid[$key]}"
    comm="${proc_comm[$key]}"
    cpu="${proc_cpu[$key]}"
    rss_bytes="${proc_rss[$key]}"
    elapsed="${proc_elapsed[$key]}"

    echo "server_process_running{user=\"$user\",pid=\"$pid\",type=\"$ptype\",command=\"$comm\"} 1" >> "$TMP_FILE"
    echo "server_process_cpu_percent{user=\"$user\",pid=\"$pid\",type=\"$ptype\",command=\"$comm\"} $cpu" >> "$TMP_FILE"
    echo "server_process_mem_bytes{user=\"$user\",pid=\"$pid\",type=\"$ptype\",command=\"$comm\"} $rss_bytes" >> "$TMP_FILE"
    echo "server_process_elapsed_seconds{user=\"$user\",pid=\"$pid\",type=\"$ptype\",command=\"$comm\"} $elapsed" >> "$TMP_FILE"
done

# --- 2. FPGA status (supports multiple FPGAs per server) ---
# Driver status: 0=not bound, 1=bound, 2=crashed
echo "# HELP server_fpga_driver_status FPGA driver status (0=not bound, 1=bound, 2=crashed)" >> "$TMP_FILE"
echo "# TYPE server_fpga_driver_status gauge" >> "$TMP_FILE"

# Map PCI device IDs to FPGA names
fpga_name_for_devid() {
    local devid="$1"
    case "$devid" in
        903f|500c|500d) echo "U280" ;;
        9038) echo "U250" ;;
        5004|5005) echo "U250" ;;
        50b4) echo "V80" ;;
        *) echo "FPGA" ;;
    esac
}

# Check for recent driver crash in dmesg (last 60 seconds)
driver_crashed() {
    local pci="$1"
    dmesg --time-format iso 2>/dev/null | tail -200 | \
        grep -qi "${pci}.*\(error\|crash\|fault\|oops\|panic\|timeout.*dma\)" && return 0
    return 1
}

# Find all Xilinx FPGAs on PCIe
fpga_found=0
while IFS= read -r line; do
    [ -z "$line" ] && continue
    pci_addr=$(echo "$line" | awk '{print $1}')
    # Skip secondary PCI functions (e.g. c1:00.1) to avoid duplicate FPGA entries
    [[ "$pci_addr" == *.1 ]] && continue
    fpga_found=1
    # Get device ID from lspci -n
    devid=$(lspci -n -s "$pci_addr" 2>/dev/null | awk '{print $3}' | cut -d: -f2)
    fpga_name=$(fpga_name_for_devid "$devid")

    # Check driver binding
    fpga_driver=$(basename "$(readlink -f /sys/bus/pci/devices/0000:${pci_addr}/driver 2>/dev/null)" 2>/dev/null)

    if driver_crashed "$pci_addr"; then
        echo "server_fpga_driver_status{fpga=\"$fpga_name\",pci=\"$pci_addr\"} 2" >> "$TMP_FILE"
    elif [ -n "$fpga_driver" ] && [ "$fpga_driver" != "driver" ]; then
        echo "server_fpga_driver_status{fpga=\"$fpga_name\",pci=\"$pci_addr\"} 1" >> "$TMP_FILE"
    else
        echo "server_fpga_driver_status{fpga=\"$fpga_name\",pci=\"$pci_addr\"} 0" >> "$TMP_FILE"
    fi
done < <(lspci 2>/dev/null | grep -i "xilinx\|903f\|5004\|5005\|50b4\|500c\|500d")

# --- 2b. FPGA active user detection ---
# Check who is actively using each FPGA by looking at:
#   a) Processes with open handles to /dev/coyote_fpga_* device files
#   b) Users running program_fpga.sh or vivado in programming mode
#   c) Users running FPGA user-space apps that opened the device
echo "# HELP server_fpga_active_user Whether an FPGA is actively in use (1=in use, 0=not used)" >> "$TMP_FILE"
echo "# TYPE server_fpga_active_user gauge" >> "$TMP_FILE"

# Build a map of FPGA index -> name from detected FPGAs
# Coyote device files are /dev/coyote_fpga_N_* where N is the FPGA index
declare -A fpga_index_to_name
fpga_idx=0
while IFS= read -r line; do
    [ -z "$line" ] && continue
    pa=$(echo "$line" | awk '{print $1}')
    [[ "$pa" == *.1 ]] && continue
    did=$(lspci -n -s "$pa" 2>/dev/null | awk '{print $3}' | cut -d: -f2)
    fpga_index_to_name[$fpga_idx]=$(fpga_name_for_devid "$did")
    fpga_idx=$((fpga_idx + 1))
done < <(lspci 2>/dev/null | grep -i "xilinx\|903f\|5004\|5005\|50b4\|500c\|500d")

# Track which FPGAs have been reported
declare -A fpga_user_reported

# Method 1: Check /dev/coyote_fpga_* for open file handles
for devfile in /dev/coyote_fpga_*; do
    [ -e "$devfile" ] || continue
    # Skip reconfig device files — only check vFPGA files (coyote_fpga_N_vM)
    [[ "$devfile" == *"reconfig"* ]] && continue
    # Extract FPGA index from device name (e.g., /dev/coyote_fpga_0_v0 -> 0)
    fidx=$(echo "$devfile" | sed -n 's|/dev/coyote_fpga_\([0-9]*\)_.*|\1|p')
    fname="${fpga_index_to_name[$fidx]:-FPGA}"

    # Find who has this device open using fuser
    fuser_out=$(fuser "$devfile" 2>/dev/null)
    if [ -n "$fuser_out" ]; then
        # Get the first PID that has it open
        fpid=$(echo "$fuser_out" | awk '{print $1}')
        fuser_name=$(ps -o user= -p "$fpid" 2>/dev/null)
        if [ -n "$fuser_name" ] && [[ "$fuser_name" != "root" ]]; then
            echo "server_fpga_active_user{fpga=\"$fname\",user=\"$fuser_name\"} 1" >> "$TMP_FILE"
            fpga_user_reported[$fname]=1
        fi
    fi
done

# Method 2: Check for vivado programming or program_fpga.sh processes
while read -r prog_user prog_pid prog_args; do
    [ -z "$prog_user" ] && continue
    [[ "$prog_user" == "root" ]] && continue
    # Determine which FPGA — default to first FPGA if can't tell
    for fn in "${fpga_index_to_name[@]}"; do
        if [ -z "${fpga_user_reported[$fn]}" ]; then
            echo "server_fpga_active_user{fpga=\"$fn\",user=\"$prog_user\"} 1" >> "$TMP_FILE"
            fpga_user_reported[$fn]=1
            break
        fi
    done
done < <(ps -eo user:32,pid,args --no-headers 2>/dev/null | grep -E "program_fpga|auto_fpga\.tcl|sgutil program" | grep -v grep)

# Method 3: Check breadcrumb file from program_fpga.sh
# program_fpga.sh writes the username to /tmp/fpga_programmed_by after programming
if [ -f /tmp/fpga_programmed_by ]; then
    # Check if coyote_driver is loaded
    driver_loaded=$(lsmod 2>/dev/null | grep -c coyote_driver)
    # Check breadcrumb age (seconds since last modification)
    breadcrumb_age=$(( $(date +%s) - $(stat -c %Y /tmp/fpga_programmed_by 2>/dev/null || echo 0) ))

    if [ "$driver_loaded" -eq 0 ]; then
        # Driver not loaded — user is done, clear breadcrumb
        rm -f /tmp/fpga_programmed_by
    elif [ "$breadcrumb_age" -gt 3600 ]; then
        # Breadcrumb older than 1 hour — user likely walked away, clear it
        rm -f /tmp/fpga_programmed_by
    else
        # Driver loaded and breadcrumb is fresh — show the user
        breadcrumb_user=$(cat /tmp/fpga_programmed_by 2>/dev/null | tr -d '[:space:]')
        if [ -n "$breadcrumb_user" ]; then
            for fn in "${fpga_index_to_name[@]}"; do
                if [ -z "${fpga_user_reported[$fn]}" ]; then
                    echo "server_fpga_active_user{fpga=\"$fn\",user=\"$breadcrumb_user\"} 1" >> "$TMP_FILE"
                    fpga_user_reported[$fn]=1
                fi
            done
        fi
    fi
fi

# Emit 0 for FPGAs not in use
for fn in "${fpga_index_to_name[@]}"; do
    if [ -z "${fpga_user_reported[$fn]}" ]; then
        echo "server_fpga_active_user{fpga=\"$fn\",user=\"NOT USED\"} 0" >> "$TMP_FILE"
    fi
done

# --- 3. 100G NIC status ---
echo "# HELP server_nic100g_link_up Whether the 100G NIC has link (1=up)" >> "$TMP_FILE"
echo "# TYPE server_nic100g_link_up gauge" >> "$TMP_FILE"
echo "# HELP server_nic100g_driver_bound Driver currently bound to the 100G NIC" >> "$TMP_FILE"
echo "# TYPE server_nic100g_driver_bound gauge" >> "$TMP_FILE"

echo "# HELP server_nic100g_status E810 NIC status (0=not found, 1=kernel/ice, 2=dpdk, 3=unbound)" >> "$TMP_FILE"
echo "# TYPE server_nic100g_status gauge" >> "$TMP_FILE"

nic_status_reported=0

# Find E810 100G NIC PCI addresses
for pci_addr in $(lspci 2>/dev/null | grep -i "E810" | awk '{print $1}'); do
    # Check what driver is bound
    nic_driver=$(basename "$(readlink -f /sys/bus/pci/devices/0000:${pci_addr}/driver 2>/dev/null)" 2>/dev/null)
    if [ -z "$nic_driver" ] || [ "$nic_driver" = "driver" ]; then
        nic_driver="none"
    fi

    # Determine binding mode: kernel (ice), dpdk (igb_uio/vfio-pci), or unbound
    mode="unbound"
    case "$nic_driver" in
        ice)        mode="kernel" ;;
        igb_uio)    mode="dpdk" ;;
        vfio-pci)   mode="dpdk" ;;
    esac

    echo "server_nic100g_driver_bound{pci=\"$pci_addr\",driver=\"$nic_driver\",mode=\"$mode\"} 1" >> "$TMP_FILE"

    # Emit summary status for first port only
    if [ "$nic_status_reported" -eq 0 ]; then
        case "$mode" in
            kernel)  echo "server_nic100g_status 1" >> "$TMP_FILE" ;;
            dpdk)    echo "server_nic100g_status 2" >> "$TMP_FILE" ;;
            unbound) echo "server_nic100g_status 3" >> "$TMP_FILE" ;;
        esac
        nic_status_reported=1
    fi

    # Check link status (only possible if kernel driver is bound)
    iface=$(ls /sys/bus/pci/devices/0000:${pci_addr}/net/ 2>/dev/null | head -1)
    if [ -n "$iface" ]; then
        operstate=$(cat /sys/class/net/${iface}/operstate 2>/dev/null)
        if [ "$operstate" = "up" ]; then
            echo "server_nic100g_link_up{pci=\"$pci_addr\",iface=\"$iface\"} 1" >> "$TMP_FILE"
        else
            echo "server_nic100g_link_up{pci=\"$pci_addr\",iface=\"$iface\"} 0" >> "$TMP_FILE"
        fi
    else
        # No kernel interface — NIC is bound to DPDK or unbound
        echo "server_nic100g_link_up{pci=\"$pci_addr\",iface=\"dpdk\"} 1" >> "$TMP_FILE"
    fi
done

# If no E810 found, emit status 0
if [ "$nic_status_reported" -eq 0 ]; then
    echo "server_nic100g_status 0" >> "$TMP_FILE"
fi

# Atomic move
mv "$TMP_FILE" "$OUTPUT_FILE"
