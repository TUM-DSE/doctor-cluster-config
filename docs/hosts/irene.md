# irene

```
System:
  Host: irene Kernel: 6.6.75 arch: x86_64 bits: 64 compiler: gcc v: 13.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\f510zmqgq15dln50y73pvhxx6nd113wi-initrd-linux-6.6.75-initrd.efi
    init=/nix/store/q3hlh7wg4mkpg0x1zrd2cijshz0idi26-nixos-system-irene-24.11.20250209.392aa11/init
    amd_iommu=on console=ttyS0,115200 console=tty0 hugepagesz=1GB hugepages=0 hugepagesz=2MB
    hugepages=1000 console=ttyS1,115200n8 console=tty1 nohibernate loglevel=4
  Console: N/A Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Kvm System: Supermicro product: AS -2015CS-TNR v: 0123456789 serial: E508280X4300377
    Chassis: type: 1 v: 0123456789 serial: CLA26FM43BD0327
  Mobo: Supermicro model: H13SSW v: 1.01A serial: WM236S605732 part-nu: 091715D9
    uuid: 34417400-15b6-11ee-8000-3cecefe3e11d UEFI: American Megatrends LLC. v: 1.6a
    date: 01/24/2024
Memory:
  System RAM: total: 768 GiB available: 752.21 GiB used: 38.36 GiB (5.1%)
  Array-1: capacity: 6 TiB note: check slots: 12 modules: 12 EC: Multi-bit ECC
    max-module-size: 512 GiB note: est.
  Device-1: DIMMA1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E9321
  Device-2: DIMMB1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93CF
  Device-3: DIMMC1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E9300
  Device-4: DIMMD1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93EB
  Device-5: DIMME1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93E9
  Device-6: DIMMF1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E938C
  Device-7: DIMMG1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93E0
  Device-8: DIMMH1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93D8
  Device-9: DIMMI1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93A8
  Device-10: DIMMJ1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E9306
  Device-11: DIMMK1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93FB
  Device-12: DIMML1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93CB
PCI Slots:
  Slot: 1 type: PCIe gen: 3 status: available info: M.2 length: long volts: 3.3 bus-ID: ff:1f.7
  Slot: 2 type: PCIe gen: 3 status: available info: M.2 length: long volts: 3.3 bus-ID: ff:1f.7
  Slot: 3 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: ff:1f.7
  Slot: 3 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: ff:1f.7
  Slot: 1 type: PCIe gen: 5 status: in use length: long volts: 3.3 bus-ID: 81:00.0
  Slot: 2 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: ff:1f.7
CPU:
  Info: model: AMD EPYC 9654P socket: SP5 bits: 64 type: MT MCP arch: Zen 4 gen: 5 level: v4
    note: check built: 2022+ process: TSMC n5 (5nm) family: 0x19 (25) model-id: 0x11 (17) stepping: 1
    microcode: 0xA101148
  Topology: cpus: 1x cores: 96 tpc: 2 threads: 192 smt: enabled cache: L1: 6 MiB desc: d-96x32
    KiB; i-96x32 KiB L2: 96 MiB desc: 96x1024 KiB L3: 384 MiB desc: 12x32 MiB
  Speed (MHz): avg: 2400 min/max: 1500/3708 boost: disabled base/boost: 2400/3700 scaling:
    driver: acpi-cpufreq governor: performance volts: 0.9 V ext-clock: 100 MHz cores: 1: 2400 2: 2400
    3: 2400 4: 2400 5: 2400 6: 2400 7: 2400 8: 2400 9: 2400 10: 2400 11: 2400 12: 2400 13: 2400
    14: 2400 15: 2400 16: 2400 17: 2400 18: 2400 19: 2400 20: 2400 21: 2400 22: 2400 23: 2400
    24: 2400 25: 2400 26: 2400 27: 2400 28: 2400 29: 2400 30: 2400 31: 2400 32: 2400 33: 2400
    34: 2400 35: 2400 36: 2400 37: 2400 38: 2400 39: 2400 40: 2400 41: 2400 42: 2400 43: 2400
    44: 2400 45: 2400 46: 2400 47: 2400 48: 2400 49: 2400 50: 2400 51: 2400 52: 2400 53: 2400
    54: 2400 55: 2400 56: 2400 57: 2400 58: 2400 59: 2400 60: 2400 61: 2400 62: 2400 63: 2400
    64: 2400 65: 2400 66: 2400 67: 2400 68: 2400 69: 2400 70: 2400 71: 2400 72: 2400 73: 2400
    74: 2400 75: 2400 76: 2400 77: 2400 78: 2400 79: 2400 80: 2400 81: 2400 82: 2400 83: 2400
    84: 2400 85: 2400 86: 2400 87: 2400 88: 2400 89: 2400 90: 2400 91: 2400 92: 2400 93: 2400
    94: 2400 95: 2400 96: 2400 97: 2400 98: 2400 99: 2400 100: 2400 101: 2400 102: 2400 103: 2400
    104: 2400 105: 2400 106: 2400 107: 2400 108: 2400 109: 2400 110: 2400 111: 2400 112: 2400
    113: 2400 114: 2400 115: 2400 116: 2400 117: 2400 118: 2400 119: 2400 120: 2400 121: 2400
    122: 2400 123: 2400 124: 2400 125: 2400 126: 2400 127: 2400 128: 2400 129: 2400 130: 2400
    131: 2400 132: 2400 133: 2400 134: 2400 135: 2400 136: 2400 137: 2400 138: 2400 139: 2400
    140: 2400 141: 2400 142: 2400 143: 2400 144: 2400 145: 2400 146: 2400 147: 2400 148: 2400
    149: 2400 150: 2400 151: 2400 152: 2400 153: 2400 154: 2400 155: 2400 156: 2400 157: 2400
    158: 2400 159: 2400 160: 2400 161: 2400 162: 2400 163: 2400 164: 2400 165: 2400 166: 2400
    167: 2400 168: 2400 169: 2400 170: 2400 171: 2400 172: 2400 173: 2400 174: 2400 175: 2400
    176: 2400 177: 2400 178: 2400 179: 2400 180: 2400 181: 2400 182: 2400 183: 2400 184: 2400
    185: 2400 186: 2400 187: 2400 188: 2400 189: 2400 190: 2400 191: 2400 192: 2400
    bogomips: 921538
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow mitigation: Safe RET
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Enhanced / Automatic IBRS; IBPB: conditional; STIBP: always-on;
    RSB filling; PBRSB-eIBRS: Not affected; BHI: Not affected
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: Virtual-1 bus-ID: cb:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: unspecified server: N/A driver: gpu: ast tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
Network:
  Device-1: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 81:00.0 chip-ID: 8086:15ff class-ID: 0200
  IF: enp129s0f0 state: down mac: 7c:c2:55:25:d0:c4
  Device-2: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 81:00.1 chip-ID: 8086:15ff class-ID: 0200
  IF: enp129s0f1 state: down mac: 7c:c2:55:25:d0:c5
  Device-3: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 81:00.2 chip-ID: 8086:104e class-ID: 0200
  IF: enp129s0f2 state: up speed: 10000 Mbps duplex: full mac: 7c:c2:55:25:d0:c6
  IP v4: 131.159.102.28/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::28/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::7ec2:55ff:fe25:d0c6/64 virtual: proto kernel_ll scope: link
  Device-4: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 81:00.3 chip-ID: 8086:104e class-ID: 0200
  IF: enp129s0f3 state: down mac: 7c:c2:55:25:d0:c7
  IF-ID-1: docker0 state: down mac: 02:42:9c:42:61:ba
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-2: eth0 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:b965:c30d:8b13:bcc7:59e8/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.28
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 3-1.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 2.95 TiB
    allocated: 550 GiB zfs-fs: size: 3.38 TiB free: 2.84 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:5 size: 3.49 TiB
Drives:
  Local Storage: total: raw: 6.99 TiB usable: 6.87 TiB used: 474.23 GiB (6.7%)
  ID-1: /dev/nvme0n1 maj-min: 259:3 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNE0T804198 fw-rev: GDC5A02Q temp: 31.9 C scheme: GPT
  SMART: yes health: PASSED on: 322d 12h cycles: 35 read-units: 13,827,436 [7.07 TB]
    written-units: 41,704,818 [21.3 TB]
  ID-2: /dev/nvme2n1 maj-min: 259:2 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNT0X115370 fw-rev: GDC5A02Q temp: 34.9 C
  SMART: yes health: PASSED on: 92d 23h cycles: 11 read-units: 2,487,983 [1.27 TB]
    written-units: 2,492,317 [1.27 TB]
Partition:
  ID-1: / raw-size: N/A size: 3.3 TiB used: 474.14 GiB (14.0%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 28.7 MiB (2.8%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:4
  ID-3: /home raw-size: N/A size: 2.72 TiB used: 1.86 TiB (68.7%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 2.84 TiB used: 67.1 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: 52 C mobo: 25 C
  Fan Speeds (rpm): cpu: 5180 fan-3: 5180 fan-5: 5320
  Power: 12v: 12.083 5v: N/A 3.3v: N/A vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 52.5 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 2402 Power: uptime: 1d 2h 42m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 300.88 GiB Init: systemd v: 256 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 597 libs: 132 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](irene.lstopo.svg)
