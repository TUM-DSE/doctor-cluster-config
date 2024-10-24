# astrid

```
System:
  Host: astrid Kernel: 6.6.48 arch: x86_64 bits: 64 compiler: gcc v: 13.2.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\pvq6m6i0j9jx126spddrhbwsy59b6kiw-initrd-linux-6.6.48-initrd.efi
    init=/nix/store/riz1zi1ljs09js18gf86mw8w7z1h7wq9-nixos-system-astrid-24.05.20240902.eb68393/init
    console=ttyS0,115200 console=tty0 nohibernate loglevel=4
  Console: N/A Distro: NixOS 24.05 (Uakari)
Machine:
  Type: Server System: Dell product: PowerEdge R440 v: N/A serial: 2YBVXK3 Chassis: type: 23
    serial: 2YBVXK3
  Mobo: Dell model: 04JN2K v: A09 serial: .2YBVXK3.CNFCP001B301ND.
    part-nu: SKU=07C9;ModelName=PowerEdge R440 uuid: 4c4c4544-0059-4210-8056-b2c04f584b33 UEFI: Dell
    v: 2.12.2 date: 07/09/2021
Memory:
  System RAM: total: 128 GiB available: 125.52 GiB used: 35.37 GiB (28.2%)
  Array-1: capacity: 1024 GiB slots: 16 modules: 4 EC: Multi-bit ECC max-module-size: 64 GiB
    note: est.
  Device-1: A1 type: DDR4 detail: synchronous registered (buffered) size: 32 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E799A
  Device-2: A2 type: DDR4 detail: synchronous registered (buffered) size: 32 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E763D
  Device-3: A3 type: no module installed
  Device-4: A4 type: no module installed
  Device-5: A5 type: no module installed
  Device-6: A6 type: no module installed
  Device-7: A7 type: no module installed
  Device-8: A8 type: no module installed
  Device-9: A9 type: no module installed
  Device-10: A10 type: no module installed
  Device-11: B1 type: DDR4 detail: synchronous registered (buffered) size: 32 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E7639
  Device-12: B2 type: DDR4 detail: synchronous registered (buffered) size: 32 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E765F
  Device-13: B3 type: no module installed
  Device-14: B4 type: no module installed
  Device-15: B5 type: no module installed
  Device-16: B6 type: no module installed
PCI Slots:
  Slot: 2 type: PCIe gen: 3 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 3 type: PCIe gen: 3 status: in use length: short volts: 3.3 bus-ID: af:00.0
  Slot: 1 type: PCIe gen: 3 status: in use length: other volts: 3.3 bus-ID: 5e:00.0
  Slot: 8 type: PCIe gen: 3 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 18:00.0
  Slot: 9 type: PCIe gen: 3 status: in use length: 2.5" drive form factor volts: 3.3
    bus-ID: 19:00.0
  Slot: 7 type: PCIe gen: 3 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 86:00.0
  Slot: 6 type: PCIe gen: 3 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 87:00.0
CPU:
  Info: model: Intel Xeon Gold 5215 socket: LGA2011 bits: 64 type: MT MCP SMP arch: Cascade Lake
    level: v4 note: check built: 2019 process: Intel 14nm family: 6 model-id: 0x55 (85) stepping: 7
    microcode: 0x5003707
  Topology: cpus: 2x cores: 10 tpc: 2 threads: 20 smt: enabled cache: L1: 2x 640 KiB (1.2 MiB)
    desc: d-10x32 KiB; i-10x32 KiB L2: 2x 10 MiB (20 MiB) desc: 10x1024 KiB
    L3: 2x 13.8 MiB (27.5 MiB) desc: 1x13.8 MiB
  Speed (MHz): avg: 2199 high: 2500 min/max: N/A base/boost: 2500/4000 volts: 1.8 V
    ext-clock: 10400 MHz cores: 1: 2500 2: 1000 3: 2500 4: 2500 5: 2500 6: 2500 7: 2500 8: 2500
    9: 1000 10: 2500 11: 998 12: 1000 13: 2500 14: 2500 15: 2500 16: 2500 17: 2500 18: 2500 19: 998
    20: 2500 21: 2500 22: 2500 23: 2500 24: 2500 25: 2500 26: 2500 27: 2500 28: 1001 29: 1000
    30: 2500 31: 2500 32: 2500 33: 2500 34: 2500 35: 2500 36: 2500 37: 2500 38: 2500 39: 1000
    40: 2500 bogomips: 200000
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
  Vulnerabilities:
  Type: gather_data_sampling mitigation: Microcode
  Type: itlb_multihit status: KVM: VMX disabled
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed mitigation: Enhanced IBRS
  Type: spec_rstack_overflow status: Not affected
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Enhanced / Automatic IBRS; IBPB: conditional; RSB filling;
    PBRSB-eIBRS: SW sequence; BHI: SW loop, KVM: SW loop
  Type: srbds status: Not affected
  Type: tsx_async_abort mitigation: TSX disabled
Graphics:
  Device-1: Matrox Systems Integrated G200eW3 Graphics vendor: Dell driver: mgag200 v: kernel
    ports: active: VGA-1 empty: none bus-ID: 03:00.0 chip-ID: 102b:0536 class-ID: 0300
  Display: server: No display server data found. Headless machine? tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
Network:
  Device-1: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 04:00.0
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno1 state: down mac: f4:ee:08:0b:9f:86
  Device-2: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 04:00.1
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno2 state: down mac: f4:ee:08:0b:9f:87
  Device-3: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell
    driver: bnxt_en v: kernel pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 5e:00.0
    chip-ID: 14e4:16d8 class-ID: 0200 temp: 77.0 C
  IF: enp94s0f0np0 state: up speed: 10000 Mbps duplex: full mac: f4:ee:08:0a:ea:05
  IP v4: 131.159.102.11/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::11/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::f6ee:8ff:fe0a:ea05/64 virtual: proto kernel_ll scope: link
  Device-4: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell
    driver: bnxt_en v: kernel pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 5e:00.1
    chip-ID: 14e4:16d8 class-ID: 0200
  IF: enp94s0f1np1 state: down mac: f4:ee:08:0a:ea:06
  IF-ID-1: cni0 state: up speed: 10000 Mbps duplex: unknown mac: fa:12:a0:77:7a:2c
  IP v4: 10.42.0.1/24 scope: global broadcast: 10.42.0.255
  IP v6: fe80::f812:a0ff:fe77:7a2c/64 virtual: proto kernel_ll scope: link
  IF-ID-2: docker0 state: down mac: 02:42:5c:b1:32:e0
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:98ac:9c80:4f25:50e3:1d8f/16 scope: global
  IF-ID-4: veth13cc1ac7 state: up speed: 10000 Mbps duplex: full mac: 92:67:84:5e:74:3f
  IF-ID-5: veth1734a03f state: up speed: 10000 Mbps duplex: full mac: 2a:10:46:0d:5c:89
  IF-ID-6: veth23b60711 state: up speed: 10000 Mbps duplex: full mac: f6:70:cd:4b:be:1f
  IF-ID-7: veth5cc1d6e5 state: up speed: 10000 Mbps duplex: full mac: 06:1b:09:43:3a:72
  IF-ID-8: veth6515a878 state: up speed: 10000 Mbps duplex: full mac: da:06:c8:67:6d:ac
  IF-ID-9: veth8463a4bb state: up speed: 10000 Mbps duplex: full mac: 12:22:33:d1:d5:96
  IF-ID-10: vetha2266346 state: up speed: 10000 Mbps duplex: full mac: 36:fc:8a:87:46:d2
  IF-ID-11: vethb096ec28 state: up speed: 10000 Mbps duplex: full mac: 5a:09:42:29:85:82
  IF-ID-12: vethc3cf9dfe state: up speed: 10000 Mbps duplex: full mac: d2:bc:14:ea:6c:9a
  IF-ID-13: vethdbe34409 state: up speed: 10000 Mbps duplex: full mac: d2:ef:bd:b1:25:4b
  Info: services: nginx, sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.11
RAID:
  Hardware-1: Broadcom / LSI MegaRAID 12GSAS/PCIe Secure SAS39xx driver: megaraid_sas
    v: 07.725.01.00-rc1 port: c000 bus-ID: af:00.0 chip-ID: 1000:10e2 rev: class-ID: 0104
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 1.45 TiB free: 1.39 TiB
    allocated: 60.6 GiB zfs-fs: size: 1.41 TiB free: 1.35 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:2 size: 1.45 TiB
Drives:
  Local Storage: total: raw: 2.77 TiB usable: 2.72 TiB used: 49.96 GiB (1.8%)
  ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Dell model: Ent NVMe P5600 MU U.2 1.6TB
    size: 1.46 TiB block-size: physical: 512 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: PHAB123301411P9SGN fw-rev: 1.1.5 temp: 31.9 C scheme: GPT
  SMART: yes health: PASSED on: 2y 273d 8h cycles: 42 read-units: 11,608,460 [5.94 TB]
    written-units: 109,079,507 [55.8 TB]
  ID-2: /dev/sda maj-min: 8:0 vendor: Micron model: MTFDDAK480TDT size: 447.13 GiB block-size:
    physical: 4096 B logical: 512 B sata: 3.3 speed: <unknown> tech: SSD serial: 214131EA4BA1
    fw-rev: J004 temp: 28 C
  SMART: yes state: enabled health: PASSED on: 2y 273d 13h cycles: 42 written: 84.91 GiB
  ID-3: /dev/sdb maj-min: 8:16 vendor: Micron model: MTFDDAK480TDT size: 447.13 GiB block-size:
    physical: 4096 B logical: 512 B sata: 3.3 speed: <unknown> tech: SSD serial: 214131EA4A01
    fw-rev: J004 temp: 29 C
  SMART: yes state: enabled health: PASSED on: 2y 273d 13h cycles: 41 written: 82.69 GiB
  ID-4: /dev/sdc maj-min: 8:32 vendor: Micron model: MTFDDAK480TDT size: 447.13 GiB block-size:
    physical: 4096 B logical: 512 B sata: 3.3 speed: <unknown> tech: SSD serial: 21232F840E14
    fw-rev: J004 temp: 25 C
  SMART: yes state: enabled health: PASSED on: 2y 273d 16h cycles: 55 written: 82.84 GiB
Partition:
  ID-1: / raw-size: N/A size: 1.39 TiB used: 39.25 GiB (2.8%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 36.2 MiB (3.5%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:1
  ID-3: /home raw-size: N/A size: 2.93 TiB used: 1.46 TiB (49.8%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 1.35 TiB used: 16.4 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: N/A mobo: N/A
  Fan Speeds (rpm): cpu: 5880 fan-26: 4560 fan-42: 4560 fan-43: 4800 fan-58: 4560 fan-59: 4920
    fan-74: 4560 fan-75: 4800 fan-90: 4440 fan-91: 4800 fan-106: 4560 fan-107: 5880
  Power: 12v: N/A 5v: N/A 3.3v: N/A vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 78.0 C pch: 40.0 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 741 Power: uptime: 25d 10h 21m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 50.19 GiB Init: systemd v: 255 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 612 libs: 139 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.2.0 Client: Sudo v: 1.9.15p5 inxi: 3.3.34
```
![hardware topology](astrid.lstopo.svg)
