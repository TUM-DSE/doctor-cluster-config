# mickey

```
System:
  Host: mickey Kernel: 6.12.66 arch: x86_64 bits: 64 compiler: gcc v: 14.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\klqj73v1vwvv3mscgja2n7fw4dvh4icw-initrd-linux-6.12.66-initrd.efi
    init=/nix/store/hlgbbj432s52jm9xaibkcc5v4k8fbs6x-nixos-system-mickey-25.11.20260123.ac3d985/init
    console=ttyS0,115200 console=tty0 nohibernate loglevel=4 lsm=landlock,yama,bpf
  Console: N/A Distro: NixOS 25.11 (Xantusia)
Machine:
  Type: Server System: Dell product: PowerEdge R440 v: N/A serial: 3YBVXK3 Chassis: type: 23
    serial: 3YBVXK3
  Mobo: Dell model: 04JN2K v: A09 serial: .3YBVXK3.CNFCP001B3002P.
    part-nu: SKU=07C9;ModelName=PowerEdge R440 uuid: 4c4c4544-0059-4210-8056-b3c04f584b33 UEFI: Dell
    v: 2.12.2 date: 07/09/2021
Memory:
  System RAM: total: 128 GiB available: 125.51 GiB used: 95.54 GiB (76.1%)
  Array-1: capacity: 1024 GiB slots: 16 modules: 4 EC: Multi-bit ECC max-module-size: 64 GiB
    note: est.
  Device-1: A1 type: DDR4 detail: synchronous registered (buffered) size: 32 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E7616
  Device-2: A2 type: DDR4 detail: synchronous registered (buffered) size: 32 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 2064040F
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
    total: 72 manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E764A
  Device-12: B2 type: DDR4 detail: synchronous registered (buffered) size: 32 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E764B
  Device-13: B3 type: no module installed
  Device-14: B4 type: no module installed
  Device-15: B5 type: no module installed
  Device-16: B6 type: no module installed
PCI Slots:
  Slot: 2 type: PCIe gen: 3 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 3 type: PCIe gen: 3 status: in use length: short volts: 3.3 bus-ID: af:00.0
  Slot: 1 type: PCIe gen: 3 status: in use length: other volts: 3.3 bus-ID: 5e:00.0
  Slot: 8 type: PCIe gen: 3 status: in use length: 2.5" drive form factor volts: 3.3
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
    microcode: 0x5003901
  Topology: cpus: 2x dies: 1 clusters: 10 cores: 10 threads: 20 tpc: 2 smt: enabled cache:
    L1: 2x 640 KiB (1.2 MiB) desc: d-10x32 KiB; i-10x32 KiB L2: 2x 10 MiB (20 MiB) desc: 10x1024 KiB
    L3: 2x 13.8 MiB (27.5 MiB) desc: 1x13.8 MiB
  Speed (MHz): avg: 2124 high: 2500 min/max: N/A base/boost: 2500/4000 volts: 1.8 V
    ext-clock: 10400 MHz cores: 1: 2500 2: 2500 3: 2500 4: 2500 5: 2500 6: 2500 7: 1000 8: 2500
    9: 2500 10: 2500 11: 1000 12: 1000 13: 1000 14: 2500 15: 1000 16: 2500 17: 1000 18: 2500
    19: 1000 20: 2500 21: 2500 22: 2500 23: 1000 24: 2500 25: 2500 26: 2500 27: 2500 28: 2500
    29: 2500 30: 2500 31: 2500 32: 2500 33: 2500 34: 2500 35: 2500 36: 2500 37: 2500 38: 1000
    39: 2500 40: 999 bogomips: 200000
  Flags-basic: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
  Vulnerabilities:
  Type: gather_data_sampling mitigation: Microcode
  Type: indirect_target_selection mitigation: Aligned branch/return thunks
  Type: itlb_multihit status: KVM: Split huge pages
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed mitigation: Enhanced IBRS
  Type: spec_rstack_overflow status: Not affected
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Enhanced / Automatic IBRS; IBPB: conditional; PBRSB-eIBRS: SW
    sequence; BHI: SW loop, KVM: SW loop
  Type: srbds status: Not affected
  Type: tsa status: Not affected
  Type: tsx_async_abort mitigation: TSX disabled
  Type: vmscape mitigation: IBPB before exit to userspace
Graphics:
  Device-1: Matrox Systems Integrated G200eW3 Graphics vendor: Dell driver: mgag200 v: kernel
    ports: active: VGA-1 empty: none bus-ID: 03:00.0 chip-ID: 102b:0536 class-ID: 0300
  Display: server: No display server data found. Headless machine? tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
  Info: Tools: api: eglinfo,glxinfo x11: xdpyinfo, xprop, xrandr
Audio:
  Message: No device data found.
Network:
  Device-1: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 04:00.0
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno1 state: down mac: f4:ee:08:0b:f6:37
  Device-2: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 04:00.1
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno2 state: down mac: f4:ee:08:0b:f6:38
  Device-3: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell
    driver: bnxt_en v: kernel pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 5e:00.0
    chip-ID: 14e4:16d8 class-ID: 0200 temp: 77.0 C
  IF: ens1f0np0 state: up speed: 10000 Mbps duplex: full mac: f4:ee:08:0a:ea:b5
  IP v4: 131.159.102.10/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::10/128 type: dynamic noprefixroute scope: global
  IP v6: 2a09:80c0:102::f000:0/64 scope: global
  IP v6: fe80::f6ee:8ff:fe0a:eab5/64 virtual: proto kernel_ll scope: link
  Device-4: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell
    driver: bnxt_en v: kernel pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 5e:00.1
    chip-ID: 14e4:16d8 class-ID: 0200
  IF: ens1f1np1 state: down mac: f4:ee:08:0a:ea:b6
  IF-ID-1: cni0 state: up speed: 10000 Mbps duplex: unknown mac: 0e:3e:78:01:fc:58
  IP v4: 10.42.1.1/24 scope: global broadcast: 10.42.1.255
  IP v6: fe80::c3e:78ff:fe01:fc58/64 virtual: proto kernel_ll scope: link
  IF-ID-2: docker0 state: down mac: b6:e3:e3:90:2a:cd
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:a85d:33c6:14ca:3cf7:8827/16 scope: global
  IF-ID-4: veth17edceb0 state: up speed: 10000 Mbps duplex: full mac: ee:ff:3b:ce:b9:32
  IF-ID-5: veth6b475989 state: up speed: 10000 Mbps duplex: full mac: 0a:76:cc:c1:56:c4
  IF-ID-6: veth9e0aeaec state: up speed: 10000 Mbps duplex: full mac: a2:44:3b:aa:4b:b9
  IF-ID-7: vetha70d0478 state: up speed: 10000 Mbps duplex: full mac: da:a4:10:8f:40:64
  IF-ID-8: vetha9719602 state: up speed: 10000 Mbps duplex: full mac: ba:69:df:4c:a1:d3
  IF-ID-9: vethd634f22a state: up speed: 10000 Mbps duplex: full mac: ba:cb:e8:0b:c2:5f
  Info: services: nfsd, sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.10
RAID:
  Hardware-1: Broadcom / LSI MegaRAID 12GSAS/PCIe Secure SAS39xx driver: megaraid_sas
    v: 07.727.03.00-rc1 port: c000 bus-ID: af:00.0 chip-ID: 1000:10e2 rev: class-ID: 0104
  Device-1: nfs-data type: zfs status: ONLINE level: linear raw: size: 14.5 TiB free: 9.7 TiB
    allocated: 4.83 TiB zfs-fs: size: 14.42 TiB free: 9.57 TiB
  Components: Online:
  1: sda1 maj-min: 8:1 size: 7.28 TiB
  2: sdb1 maj-min: 8:17 size: 7.28 TiB
  Device-2: nfs-home type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 1.04 TiB
    allocated: 2.45 TiB zfs-fs: size: 3.47 TiB free: 948.9 GiB
  Components: Online:
  1: nvme0n1p1 maj-min: 259:4 size: 3.49 TiB
  Device-3: zroot type: zfs status: ONLINE level: linear raw: size: 1.45 TiB free: 1.39 TiB
    allocated: 68.5 GiB zfs-fs: size: 1.41 TiB free: 1.34 TiB
  Components: Online:
  1: nvme1n1p2 maj-min: 259:2 size: 1.45 TiB
Drives:
  Local Storage: total: raw: 19.5 TiB usable: 19.3 TiB used: 7.43 TiB (38.5%)
  ID-1: /dev/nvme0n1 maj-min: 259:3 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNT0X115369 fw-rev: GDC5A02Q temp: 29.9 C scheme: GPT
  SMART: yes health: PASSED on: 1y 339d 22h cycles: 17 read-units: 142,088,555 [72.7 TB]
    written-units: 108,084,387 [55.3 TB]
  ID-2: /dev/nvme1n1 maj-min: 259:0 vendor: Dell model: Ent NVMe P5600 MU U.2 1.6TB
    size: 1.46 TiB block-size: physical: 512 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: PHAB1233010E1P9SGN fw-rev: 1.1.5 temp: 30.9 C scheme: GPT
  SMART: yes health: PASSED on: 4y 64d 12h cycles: 32 read-units: 19,998,937 [10.2 TB]
    written-units: 159,229,925 [81.5 TB]
  ID-3: /dev/sda maj-min: 8:0 vendor: Samsung model: SSD 870 QVO 8TB family: based SSDs
    size: 7.28 TiB block-size: physical: 512 B logical: 512 B sata: 3.3 speed: <unknown> tech: SSD
    serial: S5SSNJ0X300228R fw-rev: 2B6Q temp: 22 C scheme: GPT
  SMART: yes state: enabled health: PASSED on: 1y 339d 21h cycles: 17 written: 3.99 TiB
  ID-4: /dev/sdb maj-min: 8:16 vendor: Samsung model: SSD 870 QVO 8TB family: based SSDs
    size: 7.28 TiB block-size: physical: 512 B logical: 512 B sata: 3.3 speed: <unknown> tech: SSD
    serial: S5SSNJ0X300181Y fw-rev: 2B6Q temp: 22 C scheme: GPT
  SMART: yes state: enabled health: PASSED on: 1y 339d 21h cycles: 17 written: 3.99 TiB
Partition:
  ID-1: / raw-size: N/A size: 1.38 TiB used: 42.39 GiB (3.0%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 45.3 MiB (4.4%) fs: vfat
    block-size: 512 B dev: /dev/nvme1n1p1 maj-min: 259:1
  ID-3: /tmp raw-size: N/A size: 1.34 TiB used: 256 KiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: N/A mobo: N/A
  Fan Speeds (rpm): cpu: 5160 fan-26: 3960 fan-42: 3960 fan-43: 4320 fan-58: 4440 fan-59: 4680
    fan-74: 4200 fan-75: 4560 fan-90: 4200 fan-91: 4440 fan-106: 4320 fan-107: 5640
  Power: 12v: N/A 5v: N/A 3.3v: N/A vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 76.0 C pch: 37.0 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 1008 Power: uptime: 57d 10h 35m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 50.19 GiB Init: systemd v: 258 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 666 libs: 140 pm: nix-usr pkgs: 0
    Compilers: gcc: 14.3.0 Client: Sudo v: 1.9.17p2 inxi: 3.3.39
```
![hardware topology](mickey.lstopo.svg)
