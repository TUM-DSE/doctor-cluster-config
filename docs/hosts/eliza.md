# eliza

```
System:
  Host: eliza Kernel: 6.12.22 arch: aarch64 bits: 64 compiler: gcc v: 13.3.0
    clocksource: arch_sys_counter
    parameters: BOOT_IMAGE=(hd1,gpt1)//kernels/b005qzzafzm7293hfhrrj5v56vygcjbs-linux-6.12.22-Image
    init=/nix/store/6l2bvfxhw1r4ilm5s5l9rh9igp2jwkkl-nixos-system-eliza-24.11.20250410.a055e82/init
    console=ttyS1,115200n8 console=tty1 console=ttyS0,115200 console=ttyAMA0,115200 console=tty0
    nohibernate root=fstab loglevel=4
  Console: pty pts/1 Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Other-vm? System: Supermicro product: ARS-211M-NR v: 0123456789 serial: A506477X5305740
    Chassis: type: 1 v: 0123456789 serial: CLB26MM19A10301
  Mobo: Supermicro model: R13SPD v: 1.02 serial: HM24BS009242
    uuid: 0ab89400-c975-11ef-8000-7cc2558e5672 UEFI: American Megatrends LLC. v: 1.1 date: 11/13/2024
Memory:
  System RAM: total: 512 GiB available: 502.26 GiB used: 9.73 GiB (1.9%)
  Array-1: capacity: 8 TiB note: check slots: 16 modules: 8 EC: Multi-bit ECC
    max-module-size: 512 GiB note: est.
  Device-1: DIMMA1 type: DDR5 detail: registered (buffered) size: 64 GiB speed: spec: 5600 MT/s
    actual: 5200 MT/s volts: curr: 1.1 min: 1.067 max: 1.166 width (bits): data: 64 total: 80
    manufacturer: Micron Technology part-no: MTC40F2046S1RC56BD serial: 802C0F24314A3B402C
  Device-2: DIMMA2 type: no module installed
  Device-3: DIMMB1 type: DDR5 detail: registered (buffered) size: 64 GiB speed: spec: 5600 MT/s
    actual: 5200 MT/s volts: curr: 1.1 min: 1.067 max: 1.166 width (bits): data: 64 total: 80
    manufacturer: Micron Technology part-no: MTC40F2046S1RC56BD serial: 802C0F24314A3B4E55
  Device-4: DIMMB2 type: no module installed
  Device-5: DIMMC1 type: DDR5 detail: registered (buffered) size: 64 GiB speed: spec: 5600 MT/s
    actual: 5200 MT/s volts: curr: 1.1 min: 1.067 max: 1.166 width (bits): data: 64 total: 80
    manufacturer: Micron Technology part-no: MTC40F2046S1RC56BD serial: 802C0F24314A3B4B25
  Device-6: DIMMC2 type: no module installed
  Device-7: DIMMD1 type: DDR5 detail: registered (buffered) size: 64 GiB speed: spec: 5600 MT/s
    actual: 5200 MT/s volts: curr: 1.1 min: 1.067 max: 1.166 width (bits): data: 64 total: 80
    manufacturer: Micron Technology part-no: MTC40F2046S1RC56BD serial: 802C0F24314A3B4BA0
  Device-8: DIMMD2 type: no module installed
  Device-9: DIMME1 type: DDR5 detail: registered (buffered) size: 64 GiB speed: spec: 5600 MT/s
    actual: 5200 MT/s volts: curr: 1.1 min: 1.067 max: 1.166 width (bits): data: 64 total: 80
    manufacturer: Micron Technology part-no: MTC40F2046S1RC56BD serial: 802C0F24354AA81875
  Device-10: DIMME2 type: no module installed
  Device-11: DIMMF1 type: DDR5 detail: registered (buffered) size: 64 GiB speed: spec: 5600 MT/s
    actual: 5200 MT/s volts: curr: 1.1 min: 1.067 max: 1.166 width (bits): data: 64 total: 80
    manufacturer: Micron Technology part-no: MTC40F2046S1RC56BD serial: 802C0F24314A3B4C01
  Device-12: DIMMF2 type: no module installed
  Device-13: DIMMG1 type: DDR5 detail: registered (buffered) size: 64 GiB speed: spec: 5600 MT/s
    actual: 5200 MT/s volts: curr: 1.1 min: 1.067 max: 1.166 width (bits): data: 64 total: 80
    manufacturer: Micron Technology part-no: MTC40F2046S1RC56BD serial: 802C0F24354AA81ACC
  Device-14: DIMMG2 type: no module installed
  Device-15: DIMMH1 type: DDR5 detail: registered (buffered) size: 64 GiB speed: spec: 5600 MT/s
    actual: 5200 MT/s volts: curr: 1.1 min: 1.067 max: 1.166 width (bits): data: 64 total: 80
    manufacturer: Micron Technology part-no: MTC40F2046S1RC56BD serial: 802C0F24314A3B4DEE
  Device-16: DIMMH2 type: no module installed
PCI Slots:
  Slot: 1 type: PCIe gen: 5 status: available length: short volts: 3.3 bus-ID: 0006:01:00.0
  Slot: 5 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: 01:00.0
  Slot: 6 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: 0004:01:00.0
  Slot: 9 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: 0005:01:00.0
  Slot: N/A type: PCIe gen: 5 status: available info: M.2 length: short volts: 3.3
    bus-ID: 0003:05:00.0
  Slot: 3 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: 0007:01:00.0
  Slot: 1 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: 0001:01:00.0
CPU:
  Info: model: N/A bits: 64 type: MCP arch: ARMv8 family: 8 model-id: 0 stepping: 0
  Topology: cpus: 1x cores: 192 smt: <unsupported> cache: L1: 15 MiB desc: d-192x64 KiB;
    i-192x16 KiB L2: 384 MiB desc: 192x2 MiB
  Speed (MHz): avg: 1011 high: 3133 min/max: 1000/3200 boost: disabled base/boost: 3200/3200
    scaling: driver: cppc_cpufreq governor: schedutil volts: 0.8 V ext-clock: 1000 MHz cores: 1: 999
    2: 1000 3: 1000 4: 1000 5: 1000 6: 1000 7: 1000 8: 1000 9: 1000 10: 1000 11: 1000 12: 1000
    13: 1000 14: 1000 15: 1000 16: 1000 17: 1000 18: 1000 19: 1000 20: 1000 21: 1000 22: 1000
    23: 1000 24: 1000 25: 1000 26: 1000 27: 1000 28: 1000 29: 1000 30: 1000 31: 1000 32: 1000
    33: 1000 34: 1000 35: 1000 36: 1000 37: 1000 38: 1000 39: 1000 40: 1000 41: 1000 42: 1000
    43: 1000 44: 1000 45: 1000 46: 1000 47: 1000 48: 1000 49: 1000 50: 1000 51: 1000 52: 3133
    53: 1000 54: 1000 55: 1000 56: 1000 57: 1000 58: 1000 59: 1000 60: 1000 61: 1000 62: 1000
    63: 1000 64: 1000 65: 1000 66: 1000 67: 1000 68: 1000 69: 1000 70: 1000 71: 1000 72: 1000
    73: 1000 74: 1000 75: 1000 76: 1000 77: 1000 78: 1000 79: 1000 80: 1000 81: 1000 82: 1000
    83: 1000 84: 1000 85: 1000 86: 1000 87: 1000 88: 1000 89: 1000 90: 1000 91: 1000 92: 1000
    93: 1000 94: 1000 95: 1000 96: 1000 97: 1053 98: 1000 99: 1000 100: 1000 101: 1000 102: 999
    103: 1000 104: 1000 105: 1000 106: 1000 107: 1000 108: 1000 109: 1000 110: 1000 111: 1000
    112: 1000 113: 1000 114: 1000 115: 1000 116: 1000 117: 1000 118: 1000 119: 1000 120: 1000
    121: 1000 122: 1000 123: 1000 124: 1000 125: 1000 126: 1000 127: 1000 128: 999 129: 1000
    130: 1000 131: 1000 132: 1000 133: 1000 134: 1000 135: 1000 136: 1000 137: 1000 138: 1000
    139: 1000 140: 1000 141: 1000 142: 1000 143: 1000 144: 1000 145: 1000 146: 1000 147: 1000
    148: 1000 149: 1000 150: 1000 151: 1000 152: 1000 153: 1000 154: 1000 155: 1000 156: 1000
    157: 1000 158: 1000 159: 1000 160: 1000 161: 1000 162: 1000 163: 1000 164: 1000 165: 1000
    166: 1000 167: 1000 168: 1000 169: 1000 170: 1000 171: 1000 172: 1000 173: 1000 174: 1000
    175: 1000 176: 1000 177: 1000 178: 1000 179: 1000 180: 1000 181: 1000 182: 1000 183: 1000
    184: 1000 185: 1000 186: 1000 187: 1000 188: 1000 189: 1000 190: 1000 191: 1000 192: 1000
    bogomips: 384000
  Features: Use -f option to see features
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow status: Not affected
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: __user pointer sanitization
  Type: spectre_v2 status: Not affected
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: none bus-ID: 0003:04:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: unspecified server: N/A driver: gpu: ast tty: 80x40
  Monitor-1: VGA-1 model: Fujitsu Siemens B27T-7 Pro serial: YVAV021770 built: 2017
    res: 1920x1080 dpi: 82 gamma: 1.2 size: 598x336mm (23.54x13.23") diag: 686mm (27") ratio: 16:9
    modes: max: 1920x1080 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
  API: ALSA v: k6.12.22 status: kernel-api tools: N/A
Network:
  Device-1: Broadcom BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet vendor: Super Micro
    driver: bnxt_en v: kernel port: N/A bus-ID: 0003:02:00.0 chip-ID: 14e4:16d7 class-ID: 0200
  IF: eno1np0 state: down mac: 7c:c2:55:8e:56:72
  Device-2: Broadcom BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet vendor: Super Micro
    driver: bnxt_en v: kernel port: N/A bus-ID: 0003:02:00.1 chip-ID: 14e4:16d7 class-ID: 0200
  IF: eno1np0 state: down mac: 7c:c2:55:8e:56:72
  Device-3: Microsoft RTL8153B GigE [Surface Ethernet Adapter] driver: r8152 type: USB rev: 3.0
    speed: 5 Gb/s lanes: 1 mode: 3.2 gen-1x1 bus-ID: 2-1:2 chip-ID: 045e:0927 class-ID: 0000
    serial: 001008D77
  IF: enP3p1s0u1 state: up speed: 1000 Mbps duplex: full mac: 70:bc:10:8a:42:15
  IP v4: 131.159.39.71/23 type: dynamic scope: global
  IP v6: 2a09:80c0:38::1071/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::72bc:10ff:fe8a:4215/64 virtual: proto kernel_ll scope: link
  IF-ID-1: docker0 state: down mac: 02:42:f8:04:5d:35
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-2: eno2np1 state: down mac: 7c:c2:55:8e:56:73
  IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:f789:833d:c869:548f:1c4c/16 scope: global
  IF-ID-4: usb0 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.39.71
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 1-3.4.1:5 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 3.48 TiB
    allocated: 3.44 GiB zfs-fs: size: 3.38 TiB free: 3.37 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:2 size: 3.49 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.38 TiB used: 3.5 GiB (0.1%)
  ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNN0XA20382 fw-rev: GDC5A02Q temp: 36.9 C scheme: GPT
  SMART: yes health: PASSED on: 5d 22h cycles: 44 read-units: 10,676,073 [5.46 TB]
    written-units: 10,672,245 [5.46 TB]
Partition:
  ID-1: / raw-size: N/A size: 3.38 TiB used: 3.41 GiB (0.1%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 95.2 MiB (9.3%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:1
  ID-3: /tmp raw-size: N/A size: 3.37 TiB used: 256 KiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: N/A mobo: 19 C
  Fan Speeds (rpm): cpu: 5809 fan-2: 5809 fan-3: 5809 fan-6: 5809
  Power: 12v: 12.155 5v: N/A 3.3v: N/A vbat: 3.194 dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 55.0 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 2800 Power: uptime: 2h 4m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 200.88 GiB Init: systemd v: 256 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 556 libs: 125 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](eliza.lstopo.svg)
