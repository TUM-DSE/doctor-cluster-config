# mickey

```
System:
  Host: mickey Kernel: 6.12.12 arch: x86_64 bits: 64 compiler: gcc v: 13.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\1w47a34jn09sv7nd9ysvllpwgnzhs3dn-initrd-linux-6.12.12-initrd.efi
    init=/nix/store/767q2b2848n7vkns3rq0hvnins9qa6ad-nixos-system-mickey-24.11.20250209.392aa11/init
    console=ttyS0,115200 console=tty0 nohibernate loglevel=4
  Console: N/A Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Server System: Dell product: PowerEdge R440 v: N/A serial: 3YBVXK3 Chassis: type: 23
    serial: 3YBVXK3
  Mobo: Dell model: 04JN2K v: A09 serial: .3YBVXK3.CNFCP001B3002P.
    part-nu: SKU=07C9;ModelName=PowerEdge R440 uuid: 4c4c4544-0059-4210-8056-b3c04f584b33 UEFI: Dell
    v: 2.12.2 date: 07/09/2021
Memory:
  System RAM: total: 128 GiB available: 125.51 GiB used: 60.83 GiB (48.5%)
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
    microcode: 0x5003707
  Topology: cpus: 2x cores: 10 tpc: 2 threads: 20 smt: enabled cache: L1: 2x 640 KiB (1.2 MiB)
    desc: d-10x32 KiB; i-10x32 KiB L2: 2x 10 MiB (20 MiB) desc: 10x1024 KiB
    L3: 2x 13.8 MiB (27.5 MiB) desc: 1x13.8 MiB
  Speed (MHz): avg: 2300 high: 2500 min/max: N/A base/boost: 2500/4000 volts: 1.8 V
    ext-clock: 10400 MHz cores: 1: 2500 2: 2500 3: 1000 4: 2500 5: 1000 6: 2500 7: 2500 8: 2500
    9: 1000 10: 2500 11: 1000 12: 2500 13: 2500 14: 2500 15: 2500 16: 2500 17: 2500 18: 2500
    19: 2000 20: 2500 21: 2500 22: 2500 23: 2500 24: 2500 25: 2500 26: 2500 27: 2500 28: 2500
    29: 1000 30: 2500 31: 2500 32: 2500 33: 2500 34: 2500 35: 2500 36: 2500 37: 2500 38: 2500
    39: 2500 40: 2500 bogomips: 200000
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
  Vulnerabilities:
  Type: gather_data_sampling mitigation: Microcode
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
  IF: eno1 state: down mac: f4:ee:08:0b:f6:37
  Device-2: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 04:00.1
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno2 state: down mac: f4:ee:08:0b:f6:38
  Device-3: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell
    driver: bnxt_en v: kernel pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 5e:00.0
    chip-ID: 14e4:16d8 class-ID: 0200 temp: 76.0 C
  IF: enp94s0f0np0 state: up speed: 10000 Mbps duplex: full mac: f4:ee:08:0a:ea:b5
  IP v4: 131.159.102.10/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::10/128 type: dynamic noprefixroute scope: global
  IP v6: 2a09:80c0:102::f000:0/64 scope: global
  IP v6: fe80::f6ee:8ff:fe0a:eab5/64 virtual: proto kernel_ll scope: link
  Device-4: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell
    driver: bnxt_en v: kernel pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 5e:00.1
    chip-ID: 14e4:16d8 class-ID: 0200
  IF: enp94s0f1np1 state: down mac: f4:ee:08:0a:ea:b6
  IF-ID-1: docker0 state: down mac: 02:42:fc:88:e2:68
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-2: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:a85d:33c6:14ca:3cf7:8827/16 scope: global
  Info: services: nfsd, sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.10
RAID:
  Hardware-1: Broadcom / LSI MegaRAID 12GSAS/PCIe Secure SAS39xx driver: megaraid_sas
    v: 07.727.03.00-rc1 port: c000 bus-ID: af:00.0 chip-ID: 1000:10e2 rev: class-ID: 0104
  Device-1: nfs-data type: zfs status: ONLINE level: linear raw: size: 14.5 TiB free: 10.1 TiB
    allocated: 4.4 TiB zfs-fs: size: 14.41 TiB free: 10 TiB
  Components: Online:
  1: sda1 maj-min: 8:1 size: 7.28 TiB
  2: sdb1 maj-min: 8:17 size: 7.28 TiB
  Device-2: nfs-home type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 857 GiB
    allocated: 2.65 TiB zfs-fs: size: 3.38 TiB free: 746.28 GiB
  Components: Online:
  1: nvme0n1p1 maj-min: 259:4 size: 3.49 TiB
  Device-3: zroot type: zfs status: ONLINE level: linear raw: size: 1.45 TiB free: 1.3 TiB
    allocated: 153 GiB zfs-fs: size: 1.41 TiB free: 1.26 TiB
  Components: Online:
  1: nvme1n1p2 maj-min: 259:2 size: 1.45 TiB
Drives:
  Local Storage: total: raw: 19.5 TiB usable: 19.19 TiB used: 6.36 TiB (33.1%)
  ID-1: /dev/nvme0n1 maj-min: 259:3 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNT0X115369 fw-rev: GDC5A02Q temp: 31.9 C scheme: GPT
  SMART: yes health: PASSED on: 309d 2h cycles: 15 read-units: 43,860,313 [22.4 TB]
    written-units: 29,412,831 [15.0 TB]
  ID-2: /dev/nvme1n1 maj-min: 259:0 vendor: Dell model: Ent NVMe P5600 MU U.2 1.6TB
    size: 1.46 TiB block-size: physical: 512 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: PHAB1233010E1P9SGN fw-rev: 1.1.5 temp: 33.9 C scheme: GPT
  SMART: yes health: PASSED on: 3y 33d 19h cycles: 30 read-units: 14,707,044 [7.53 TB]
    written-units: 115,153,096 [58.9 TB]
  ID-3: /dev/sda maj-min: 8:0 vendor: Samsung model: SSD 870 QVO 8TB family: based SSDs
    size: 7.28 TiB block-size: physical: 512 B logical: 512 B sata: 3.3 speed: <unknown> tech: SSD
    serial: S5SSNJ0X300228R fw-rev: 2B6Q temp: 24 C scheme: GPT
  SMART: yes state: enabled health: PASSED on: 309d 1h cycles: 15 written: 3.09 TiB
  ID-4: /dev/sdb maj-min: 8:16 vendor: Samsung model: SSD 870 QVO 8TB family: based SSDs
    size: 7.28 TiB block-size: physical: 512 B logical: 512 B sata: 3.3 speed: <unknown> tech: SSD
    serial: S5SSNJ0X300181Y fw-rev: 2B6Q temp: 24 C scheme: GPT
  SMART: yes state: enabled health: PASSED on: 309d 1h cycles: 15 written: 3.08 TiB
Partition:
  ID-1: / raw-size: N/A size: 1.29 TiB used: 34.3 GiB (2.6%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 37 MiB (3.6%) fs: vfat
    block-size: 512 B dev: /dev/nvme1n1p1 maj-min: 259:1
  ID-3: /tmp raw-size: N/A size: 1.26 TiB used: 1.5 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: N/A mobo: N/A
  Fan Speeds (rpm): cpu: 5880 fan-26: 4440 fan-42: 4440 fan-43: 4800 fan-58: 4560 fan-59: 4920
    fan-74: 4560 fan-75: 4920 fan-90: 4680 fan-91: 4920 fan-106: 4800 fan-107: 6120
  Power: 12v: N/A 5v: N/A 3.3v: N/A vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 76.0 C pch: 38.0 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 1009 Power: uptime: 3d 23h 7m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 50.19 GiB Init: systemd v: 256 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 615 libs: 135 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](mickey.lstopo.svg)
