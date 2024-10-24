# irene

```
System:
  Host: irene Kernel: 6.6.54 arch: x86_64 bits: 64 compiler: gcc v: 13.2.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\mi6njr6371pcz57gbvagcx5rsrr5bnm4-initrd-linux-6.6.54-initrd.efi
    init=/nix/store/7jivbxpppvvls8chpix3n5drzvwnv215-nixos-system-irene-24.05.20241007.1ebb458/init
    console=ttyS0,115200 console=tty0 amd_iommu=on hugepagesz=1GB hugepages=0 hugepagesz=2MB
    hugepages=1000 console=ttyS1,115200n8 console=tty1 nohibernate loglevel=4
  Console: N/A Distro: NixOS 24.05 (Uakari)
Machine:
  Type: Kvm System: Supermicro product: AS -2015CS-TNR v: 0123456789 serial: E508280X4300377
    Chassis: type: 1 v: 0123456789 serial: CLA26FM43BD0327
  Mobo: Supermicro model: H13SSW v: 1.01A serial: WM236S605732 part-nu: 091715D9
    uuid: 34417400-15b6-11ee-8000-3cecefe3e11d UEFI: American Megatrends LLC. v: 1.6a
    date: 01/24/2024
Memory:
  System RAM: total: 768 GiB available: 752.25 GiB used: 87.96 GiB (11.7%)
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
  Info: model: AMD EPYC 9654P socket: SP5 bits: 64 type: MCP arch: Zen 4 gen: 5 level: v4
    note: check built: 2022+ process: TSMC n5 (5nm) family: 0x19 (25) model-id: 0x11 (17) stepping: 1
    microcode: 0xA101148
  Topology: cpus: 1x cores: 96 smt: <unsupported> cache: L1: 6 MiB desc: d-96x32 KiB; i-96x32 KiB
    L2: 96 MiB desc: 96x1024 KiB L3: 384 MiB desc: 12x32 MiB
  Speed (MHz): avg: 1546 high: 2400 min/max: 1500/3708 boost: disabled base/boost: 2400/3700
    scaling: driver: acpi-cpufreq governor: schedutil volts: 0.9 V ext-clock: 100 MHz cores: 1: 1500
    2: 1500 3: 1500 4: 1500 5: 1500 6: 1500 7: 1500 8: 1500 9: 1500 10: 1500 11: 1500 12: 1500
    13: 1500 14: 1500 15: 1500 16: 1500 17: 1500 18: 1500 19: 1500 20: 1500 21: 1500 22: 1500
    23: 1500 24: 1500 25: 1500 26: 1500 27: 1500 28: 1500 29: 1500 30: 1500 31: 2400 32: 1500
    33: 1500 34: 1500 35: 1500 36: 1500 37: 1500 38: 1500 39: 1500 40: 1500 41: 1500 42: 1500
    43: 1500 44: 1500 45: 1500 46: 1500 47: 1500 48: 2400 49: 1500 50: 1500 51: 1500 52: 1500
    53: 1500 54: 1500 55: 1500 56: 1500 57: 2400 58: 2400 59: 1500 60: 1500 61: 1500 62: 1500
    63: 1500 64: 1500 65: 1500 66: 1500 67: 1500 68: 1500 69: 1500 70: 1500 71: 1500 72: 1500
    73: 1500 74: 1500 75: 1500 76: 1500 77: 1500 78: 1500 79: 1500 80: 1500 81: 1500 82: 1500
    83: 1500 84: 1500 85: 1500 86: 1500 87: 2400 88: 1500 89: 1500 90: 1500 91: 1500 92: 1500
    93: 1500 94: 1500 95: 1500 96: 1500 bogomips: 460779
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
  Type: spectre_v2 mitigation: Enhanced / Automatic IBRS; IBPB: conditional; STIBP: disabled;
    RSB filling; PBRSB-eIBRS: Not affected; BHI: Not affected
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: Virtual-1 bus-ID: cb:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: server: No display server data found. Headless machine? tty: 80x40
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
  IF-ID-1: docker0 state: down mac: 02:42:6c:65:4e:f8
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-2: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:b965:c30d:8b13:bcc7:59e8/16 scope: global
  IF-ID-3: usb0 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.28
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 3-1.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 2.99 TiB
    allocated: 504 GiB zfs-fs: size: 3.38 TiB free: 2.88 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:4 size: 3.49 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.38 TiB used: 567.51 GiB (16.4%)
  ID-1: /dev/nvme0n1 maj-min: 259:2 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNE0T804198 fw-rev: GDC5A02Q temp: 32.9 C scheme: GPT
  SMART: yes health: PASSED on: 204d 13h cycles: 32 read-units: 9,345,370 [4.78 TB]
    written-units: 31,604,616 [16.1 TB]
Partition:
  ID-1: / raw-size: N/A size: 3.32 TiB used: 447.38 GiB (13.2%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 28.6 MiB (2.8%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:3
  ID-3: /home raw-size: N/A size: 2.93 TiB used: 1.46 TiB (49.8%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 2.88 TiB used: 108.9 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: 51 C mobo: 26 C
  Fan Speeds (rpm): cpu: 5040 fan-3: 5040 fan-5: 5040
  Power: 12v: 12.083 5v: N/A 3.3v: N/A vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 51.9 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 1404 Power: uptime: 16d 1h 11m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 300.89 GiB Init: systemd v: 255 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 598 libs: 134 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.2.0 Client: Sudo v: 1.9.15p5 inxi: 3.3.34
```
![hardware topology](irene.lstopo.svg)
