# eliza

```
System:
  Host: eliza Kernel: 6.12.66 arch: aarch64 bits: 64 compiler: gcc v: 14.3.0
    clocksource: arch_sys_counter
    parameters: BOOT_IMAGE=(hd1,gpt1)//kernels/5p8m94sc5xamq99py9fxg83rmlihvdby-linux-6.12.66-Image
    init=/nix/store/1lhnn48by9sqy24ks8j35dn2bw8b6xcg-nixos-system-eliza-25.11.20260123.ac3d985/init
    console=ttyS1,115200n8 console=tty1 console=ttyS0,115200 console=ttyAMA0,115200 console=tty0
    nohibernate root=fstab loglevel=4 lsm=landlock,yama,bpf
  Console: N/A Distro: NixOS 25.11 (Xantusia)
Machine:
  Type: Other-vm? System: Supermicro product: ARS-211M-NR v: 0123456789 serial: A506477X5305740
    Chassis: type: 1 v: 0123456789 serial: CLB26MM19A10301
  Mobo: Supermicro model: R13SPD v: 1.02 serial: HM24BS009242
    uuid: 0ab89400-c975-11ef-8000-7cc2558e5672 UEFI: American Megatrends LLC. v: 1.1 date: 11/13/2024
Memory:
  System RAM: total: 512 GiB available: 502.24 GiB used: 348.32 GiB (69.4%)
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
  Topology: cpus: 1x clusters: 24 cores: 192 smt: <unsupported> cache: L1: 15 MiB desc: d-192x64
    KiB; i-192x16 KiB L2: 384 MiB desc: 192x2 MiB
  Speed (MHz): avg: 3200 min/max: 1000/3200 boost: disabled base/boost: 3200/3200 scaling:
    driver: cppc_cpufreq governor: schedutil volts: 0.8 V ext-clock: 1000 MHz cores: 1: 3200 2: 3200
    3: 3200 4: 3200 5: 3200 6: 3200 7: 3200 8: 3200 9: 3200 10: 3200 11: 3200 12: 3200 13: 3200
    14: 3200 15: 3200 16: 3200 17: 3200 18: 3200 19: 3200 20: 3200 21: 3200 22: 3200 23: 3200
    24: 3200 25: 3200 26: 3200 27: 3200 28: 3200 29: 3200 30: 3200 31: 3200 32: 3200 33: 3200
    34: 3200 35: 3200 36: 3200 37: 3200 38: 3200 39: 3200 40: 3200 41: 3200 42: 3200 43: 3200
    44: 3200 45: 3200 46: 3200 47: 3200 48: 3200 49: 3200 50: 3200 51: 3200 52: 3200 53: 3200
    54: 3200 55: 3200 56: 3200 57: 3200 58: 3200 59: 3200 60: 3200 61: 3200 62: 3200 63: 3200
    64: 3200 65: 3200 66: 3200 67: 3200 68: 3200 69: 3200 70: 3200 71: 3200 72: 3200 73: 3200
    74: 3200 75: 3200 76: 3200 77: 3200 78: 3200 79: 3200 80: 3200 81: 3200 82: 3200 83: 3200
    84: 3200 85: 3200 86: 3200 87: 3200 88: 3200 89: 3200 90: 3200 91: 3200 92: 3200 93: 3200
    94: 3200 95: 3200 96: 3200 97: 3200 98: 3200 99: 3200 100: 3200 101: 3200 102: 3200 103: 3200
    104: 3200 105: 3200 106: 3200 107: 3200 108: 3200 109: 3200 110: 3200 111: 3200 112: 3200
    113: 3200 114: 3200 115: 3200 116: 3200 117: 3200 118: 3200 119: 3200 120: 3200 121: 3200
    122: 3200 123: 3200 124: 3200 125: 3200 126: 3200 127: 3200 128: 3200 129: 3200 130: 3200
    131: 3200 132: 3200 133: 3200 134: 3200 135: 3200 136: 3200 137: 3200 138: 3200 139: 3200
    140: 3200 141: 3200 142: 3200 143: 3200 144: 3200 145: 3200 146: 3200 147: 3200 148: 3200
    149: 3200 150: 3200 151: 3200 152: 3200 153: 3200 154: 3200 155: 3200 156: 3200 157: 3200
    158: 3200 159: 3200 160: 3200 161: 3200 162: 3200 163: 3200 164: 3200 165: 3200 166: 3200
    167: 3200 168: 3200 169: 3200 170: 3200 171: 3200 172: 3200 173: 3200 174: 3200 175: 3200
    176: 3200 177: 3200 178: 3200 179: 3200 180: 3200 181: 3200 182: 3200 183: 3200 184: 3200
    185: 3200 186: 3200 187: 3200 188: 3200 189: 3200 190: 3200 191: 3200 192: 3200
    bogomips: 384000
  Features: Use -f option to see features
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: indirect_target_selection status: Not affected
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
  Type: tsa status: Not affected
  Type: tsx_async_abort status: Not affected
  Type: vmscape status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: none bus-ID: 0003:04:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: unspecified server: N/A driver: gpu: ast tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
  Info: Tools: api: eglinfo,glxinfo x11: xdpyinfo, xprop, xrandr
Audio:
  Message: No device data found.
  API: ALSA v: k6.12.66 status: kernel-api tools: N/A
Network:
  Device-1: Broadcom BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet vendor: Super Micro
    driver: bnxt_en v: kernel port: N/A bus-ID: 0003:02:00.0 chip-ID: 14e4:16d7 class-ID: 0200
  IF: eno1np0 state: down mac: 7c:c2:55:8e:56:72
  Device-2: Broadcom BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet vendor: Super Micro
    driver: bnxt_en v: kernel port: N/A bus-ID: 0003:02:00.1 chip-ID: 14e4:16d7 class-ID: 0200
  IF: eno1np0 state: down mac: 7c:c2:55:8e:56:72
  IF-ID-1: br-dba150ad8df7 state: down mac: 06:79:cb:9b:b6:3d
  IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255
  IF-ID-2: docker0 state: down mac: 86:a8:72:81:c0:8e
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-3: eno2np1 state: up speed: 10000 Mbps duplex: full mac: 7c:c2:55:8e:56:73
  IP v4: 131.159.102.34/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::34/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::7ec2:55ff:fe8e:5673/64 virtual: proto kernel_ll scope: link
  IF-ID-4: enP3s1u3u4u1c2 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-5: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:f789:833d:c869:548f:1c4c/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.34
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 1-3.4.1:5 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 1.9 TiB
    allocated: 1.59 TiB zfs-fs: size: 3.38 TiB free: 1.79 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:2 size: 3.49 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.38 TiB used: 768.52 GiB (22.2%)
  ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNN0XA20382 fw-rev: GDC5A02Q temp: 33.9 C scheme: GPT
  SMART: yes health: PASSED on: 324d 16h cycles: 59 read-units: 83,808,697 [42.9 TB]
    written-units: 79,033,226 [40.4 TB]
Partition:
  ID-1: / raw-size: N/A size: 2.54 TiB used: 767.61 GiB (29.5%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 93.8 MiB (9.2%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:1
  ID-3: /home raw-size: N/A size: 3.47 TiB used: 2.54 TiB (73.3%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 1.79 TiB used: 837 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: N/A mobo: 26 C
  Fan Speeds (rpm): cpu: 9577 fan-2: 9577 fan-3: 9577 fan-6: 9577
  Power: 12v: 12.155 5v: N/A 3.3v: N/A vbat: 3.219 dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 55.0 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 3045 Power: uptime: 29d 10h 22m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 200.87 GiB Init: systemd v: 258 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 607 libs: 132 pm: nix-usr pkgs: 0
    Compilers: gcc: 14.3.0 Client: Sudo v: 1.9.17p2 inxi: 3.3.39
```
![hardware topology](eliza.lstopo.svg)
