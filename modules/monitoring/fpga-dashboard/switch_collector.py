#!/usr/bin/env python3
"""
Adric N8550-32C switch metrics collector.
Connects via serial, pulls port status, writes Prometheus textfile metrics.
"""

import pexpect
import re
import sys
import time

SERIAL_DEV = "/dev/ttyUSB0"
BAUD = 115200
USERNAME = "admin"
PASSWORD = "faetae1Dahn5"
PROMPT = r"N8550-32C[#>]"
OUTPUT_FILE = "/var/lib/node_exporter/textfile_collector/switch_status.prom"

# Port labels from the port map
PORT_LABELS = {
    "100ge1/0/7":  "Amy E810",
    "100ge1/0/8":  "Clara E810",
    "100ge1/0/9":  "Rose U280 FPGA",
    "100ge1/0/11": "Clara FPGA",
    "100ge1/0/12": "Amy FPGA",
    "100ge1/0/15": "Rose V80 FPGA",
    "100ge1/0/16": "Rose E810",
    "10ge1/0/33":  "Amy Broadcom",
    "10ge1/0/34":  "Clara Broadcom",
}


def connect_to_switch():
    """Connect to the switch via picocom, login, return pexpect child."""
    child = pexpect.spawn(f"picocom -b {BAUD} {SERIAL_DEV}", encoding="utf-8", timeout=10)
    child.expect("Terminal ready")
    time.sleep(0.5)

    child.sendline("")
    time.sleep(1)

    idx = child.expect(["Username:", PROMPT, pexpect.TIMEOUT], timeout=5)

    if idx == 0:
        child.sendline(USERNAME)
        child.expect("Password:")
        child.sendline(PASSWORD)
        child.expect(PROMPT, timeout=10)
    elif idx == 2:
        child.sendline("")
        idx2 = child.expect(["Username:", PROMPT], timeout=5)
        if idx2 == 0:
            child.sendline(USERNAME)
            child.expect("Password:")
            child.sendline(PASSWORD)
            child.expect(PROMPT, timeout=10)

    # Ensure enable mode and disable pager
    child.sendline("end")
    child.expect(PROMPT, timeout=5)
    child.sendline("terminal length 0")
    child.expect(PROMPT, timeout=5)

    return child


def disconnect(child):
    """Cleanly exit picocom."""
    child.sendcontrol("a")
    child.sendcontrol("x")
    try:
        child.expect(pexpect.EOF, timeout=5)
    except Exception:
        pass
    child.close()


def run_command(child, cmd):
    """Run a command and return the output."""
    child.sendline(cmd)
    child.expect(PROMPT, timeout=15)
    return child.before


def parse_interface_summary(output):
    """Parse 'show interface' output into list of port dicts."""
    ports = []
    for line in output.strip().splitlines():
        line = line.strip()
        # Match lines like: 100ge1/0/1        up/down     bridge    -
        m = re.match(r"(\S+)\s+(up|down)/(up|down)\s+(\S+)\s+(.*)", line)
        if m:
            iface = m.group(1)
            admin = m.group(2)
            oper = m.group(3)
            mode = m.group(4)
            descr = m.group(5).strip()

            # Determine port type and number
            if iface.startswith("100ge"):
                port_type = "100ge"
                port_num = re.search(r"1/0/(\d+)", iface)
            elif iface.startswith("10ge"):
                port_type = "10ge"
                port_num = re.search(r"1/0/(\d+)", iface)
            elif iface.startswith("mgt"):
                port_type = "mgmt"
                port_num = None
            else:
                continue

            port = {
                "interface": iface,
                "type": port_type,
                "number": int(port_num.group(1)) if port_num else 0,
                "admin": admin,
                "oper": oper,
                "mode": mode,
                "label": PORT_LABELS.get(iface, ""),
            }
            ports.append(port)
    return ports


def parse_interface_detail(output):
    """Parse detailed 'show interface 100gigaethernet 1/0/X' output."""
    info = {}

    m = re.search(r"PVID\s*:\s*(\d+)", output)
    if m:
        info["vlan"] = m.group(1)

    m = re.search(r"Speed\s*:\s*(\d+)", output)
    if m:
        info["speed_mbps"] = m.group(1)

    m = re.search(r"Last 300 seconds input rate:\s*(\d+)\s*Bps", output)
    if m:
        info["input_rate_bps"] = str(int(m.group(1)) * 8)

    m = re.search(r"Last 300 seconds output rate:\s*(\d+)\s*Bps", output)
    if m:
        info["output_rate_bps"] = str(int(m.group(1)) * 8)

    # Input/Output packet counts (format: total/overflow e.g. "13/2890672186")
    m = re.search(r"Input:\s+(\d+)/(\d+)\s+packets,\s+(\d+)/(\d+)\s+bytes", output)
    if m:
        info["input_packets"] = m.group(1)
        info["input_bytes"] = m.group(3)

    m = re.search(r"Output:\s+(\d+)/(\d+)\s+packets,\s+(\d+)/(\d+)\s+bytes", output)
    if m:
        info["output_packets"] = m.group(1)
        info["output_bytes"] = m.group(3)

    return info


def write_metrics(ports, port_details):
    """Write Prometheus metrics to textfile."""
    lines = []
    lines.append("# HELP switch_port_up Whether the switch port link is up (1=up, 0=down)")
    lines.append("# TYPE switch_port_up gauge")
    lines.append("# HELP switch_port_admin Whether the switch port is admin enabled (1=up, 0=down)")
    lines.append("# TYPE switch_port_admin gauge")
    lines.append("# HELP switch_port_speed_mbps Port speed in Mbps")
    lines.append("# TYPE switch_port_speed_mbps gauge")
    lines.append("# HELP switch_port_vlan Port PVID VLAN")
    lines.append("# TYPE switch_port_vlan gauge")
    lines.append("# HELP switch_port_input_rate_bps Port input rate in bits per second")
    lines.append("# TYPE switch_port_input_rate_bps gauge")
    lines.append("# HELP switch_port_output_rate_bps Port output rate in bits per second")
    lines.append("# TYPE switch_port_output_rate_bps gauge")

    for port in ports:
        iface = port["interface"]
        ptype = port["type"]
        pnum = port["number"]
        label = port["label"]

        labels = f'port="{iface}",type="{ptype}",number="{pnum}",label="{label}"'
        oper_val = 1 if port["oper"] == "up" else 0
        admin_val = 1 if port["admin"] == "up" else 0

        lines.append(f"switch_port_up{{{labels}}} {oper_val}")
        lines.append(f"switch_port_admin{{{labels}}} {admin_val}")

        # Add detailed metrics if available
        detail = port_details.get(iface, {})
        if "speed_mbps" in detail:
            lines.append(f"switch_port_speed_mbps{{{labels}}} {detail['speed_mbps']}")
        if "vlan" in detail:
            lines.append(f"switch_port_vlan{{{labels}}} {detail['vlan']}")
        if "input_rate_bps" in detail:
            lines.append(f"switch_port_input_rate_bps{{{labels}}} {detail['input_rate_bps']}")
        if "output_rate_bps" in detail:
            lines.append(f"switch_port_output_rate_bps{{{labels}}} {detail['output_rate_bps']}")

    content = "\n".join(lines) + "\n"

    tmp_file = OUTPUT_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.write(content)

    import os
    os.rename(tmp_file, OUTPUT_FILE)


def main():
    try:
        child = connect_to_switch()
    except Exception as e:
        print(f"Failed to connect: {e}", file=sys.stderr)
        sys.exit(1)

    try:
        # Get summary of all ports
        summary_output = run_command(child, "show interface")
        ports = parse_interface_summary(summary_output)
        print(f"Found {len(ports)} ports", file=sys.stderr)

        # Get detailed info for active ports only (to minimize serial time)
        port_details = {}
        for port in ports:
            if port["oper"] == "up" and port["type"] in ("100ge", "10ge"):
                iface = port["interface"]
                if port["type"] == "100ge":
                    cmd = f"show interface 100gigaethernet 1/0/{port['number']}"
                else:
                    cmd = f"show interface 10gigaethernet 1/0/{port['number']}"
                detail_output = run_command(child, cmd)
                port_details[iface] = parse_interface_detail(detail_output)

        # Write metrics
        write_metrics(ports, port_details)
        print(f"Wrote metrics for {len(ports)} ports ({len(port_details)} with details)", file=sys.stderr)

    finally:
        disconnect(child)


if __name__ == "__main__":
    main()
