# vislor

```
System:
  Host: vislor Kernel: 6.16.9 arch: x86_64 bits: 64 compiler: gcc v: 14.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\w74w0sccdrhx5l6cxv79gawm5yicazbg-initrd-linux-6.16.9-initrd.efi
    init=/nix/store/9l0zjfa1fi2b48vrfqlpzvac4c9qa5xp-nixos-system-vislor-25.05.20250930.51fcc5b/init
    console=ttyS0,115200 console=tty0 kvm_amd.sev=1 kvm_amd.sev_es=1 kvm_amd.sev_snp=1
    sp5100_tco.blacklist=yes kvm.gmem_2m_enabled=1 nvme.poll_queues=4 nvme_core.multipath=N
    amd_iommu=on nohibernate loglevel=4 lsm=landlock,yama,bpf
  Console: N/A Distro: NixOS 25.05 (Warbler)
Machine:
  Type: Server System: Dell product: PowerEdge R7625 v: N/A serial: CTQ5GZ3 Chassis: type: 23
    serial: CTQ5GZ3
  Mobo: Dell model: 0H1TJT v: A01 serial: .CTQ5GZ3.CNFCP0038G00EO.
    part-nu: SKU=0AF9;ModelName=PowerEdge R7625 uuid: 4c4c4544-0054-5110-8035-c3c04f475a33 UEFI: Dell
    v: 1.5.8 date: 07/21/2023
Memory:
  System RAM: total: 768 GiB available: 752.48 GiB used: 421.54 GiB (56.0%)
  Array-1: capacity: 6 TiB note: check slots: 24 modules: 24 EC: Multi-bit ECC
    max-module-size: 256 GiB note: est.
  Device-1: A1 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C75B0
  Device-2: A2 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C7608
  Device-3: A3 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C765B
  Device-4: A4 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C75C1
  Device-5: A5 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C75E6
  Device-6: A6 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C75AD
  Device-7: A7 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C75AF
  Device-8: A8 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C75C5
  Device-9: A9 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB speed: 4800 MT/s
    volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80 manufacturer: 80AD000080AD
    part-no: HMCG88AEBRA107N serial: 376C7570
  Device-10: A10 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C760B
  Device-11: A11 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C7607
  Device-12: A12 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C75E1
  Device-13: B1 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C75AE
  Device-14: B2 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C7600
  Device-15: B3 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C8B9B
  Device-16: B4 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C760C
  Device-17: B5 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C7678
  Device-18: B6 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C7640
  Device-19: B7 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C75D4
  Device-20: B8 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C7609
  Device-21: B9 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C8B9D
  Device-22: B10 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C7644
  Device-23: B11 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C7671
  Device-24: B12 type: DDR5 detail: synchronous registered (buffered) size: 32 GiB
    speed: 4800 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64 total: 80
    manufacturer: 80AD000080AD part-no: HMCG88AEBRA107N serial: 376C75B2
PCI Slots:
  Slot: 3 type: PCIe gen: 4 status: in use length: short volts: 3.3 bus-ID: 64:00.0
  Slot: 1 type: PCIe gen: 5 status: in use length: short volts: 3.3 bus-ID: 21:00.0
  Slot: 2 type: PCIe gen: 5 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 7 type: PCIe gen: 5 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 8 type: PCIe gen: 5 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 6 type: PCIe gen: 4 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 5 type: PCIe gen: 4 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 4 type: PCIe gen: 4 status: in use length: short volts: 3.3 bus-ID: 81:00.0
  Slot: 23 type: PCIe gen: 5 status: in use length: 2.5" drive form factor volts: 3.3
    bus-ID: 02:00.0
  Slot: 22 type: PCIe gen: 5 status: in use length: 2.5" drive form factor volts: 3.3
    bus-ID: 03:00.0
  Slot: 20 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 42:00.0
  Slot: 21 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 43:00.0
  Slot: 17 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: c1:00.0
  Slot: 16 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: c2:00.0
  Slot: 19 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: c3:00.0
  Slot: 18 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: c4:00.0
CPU:
  Info: model: AMD EPYC 9334 bits: 64 type: MCP SMP arch: Zen 4 gen: 4 level: v4 note: check
    built: 2022+ process: TSMC n5 (5nm) family: 0x19 (25) model-id: 0x11 (17) stepping: 1
    microcode: 0xA10113E
  Topology: cpus: 2x dies: 4 clusters: 4x1 cores: 32 smt: <unsupported> cache:
    L1: 2x 2 MiB (4 MiB) desc: d-32x32 KiB; i-32x32 KiB L2: 2x 32 MiB (64 MiB) desc: 32x1024 KiB
    L3: 2x 128 MiB (256 MiB) desc: 4x32 MiB
  Speed (MHz): avg: 2700 min/max: N/A base/boost: 2700/4400 volts: 1.8 V ext-clock: 32000 MHz
    cores: 1: 2700 2: 2700 3: 2700 4: 2700 5: 2700 6: 2700 7: 2700 8: 2700 9: 2700 10: 2700 11: 2700
    12: 2700 13: 2700 14: 2700 15: 2700 16: 2700 17: 2700 18: 2700 19: 2700 20: 2700 21: 2700
    22: 2700 23: 2700 24: 2700 25: 2700 26: 2700 27: 2700 28: 2700 29: 2700 30: 2700 31: 2700
    32: 2700 33: 2700 34: 2700 35: 2700 36: 2700 37: 2700 38: 2700 39: 2700 40: 2700 41: 2700
    42: 2700 43: 2700 44: 2700 45: 2700 46: 2700 47: 2700 48: 2700 49: 2700 50: 2700 51: 2700
    52: 2700 53: 2700 54: 2700 55: 2700 56: 2700 57: 2700 58: 2700 59: 2700 60: 2700 61: 2700
    62: 2700 63: 2700 64: 2700 bogomips: 345589
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: ghostwrite status: Not affected
  Type: indirect_target_selection status: Not affected
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: old_microcode status: Not affected
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow mitigation: Safe RET
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Retpolines; IBPB: conditional; IBRS_FW; STIBP: disabled; RSB
    filling; PBRSB-eIBRS: Not affected; BHI: Not affected
  Type: srbds status: Not affected
  Type: tsa status: Vulnerable: No microcode
  Type: tsx_async_abort status: Not affected
  Type: vmscape mitigation: IBPB before exit to userspace
Graphics:
  Device-1: Matrox Systems Integrated G200eW3 Graphics driver: mgag200 v: kernel ports:
    active: VGA-1 empty: none bus-ID: 62:00.0 chip-ID: 102b:0536 class-ID: 0300
  Display: unspecified server: N/A driver: gpu: mgag200 tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
  Info: Tools: api: eglinfo,glxinfo x11: xdpyinfo, xprop, xrandr
Audio:
  Message: No device data found.
Network:
  Device-1: Mellanox MT2894 Family [ConnectX-6 Lx] driver: mlx5_core v: kernel pcie: gen: 4
    speed: 16 GT/s lanes: 8 port: N/A bus-ID: 01:00.0 chip-ID: 15b3:101f class-ID: 0200 temp: 47.0 C
  IF: eno12399np0 state: up speed: 10000 Mbps duplex: full mac: 94:6d:ae:da:eb:42
  Device-2: Mellanox MT2894 Family [ConnectX-6 Lx] driver: mlx5_core v: kernel pcie: gen: 4
    speed: 16 GT/s lanes: 8 port: N/A bus-ID: 01:00.1 chip-ID: 15b3:101f class-ID: 0200
  IF: eno12409np1 state: down mac: 94:6d:ae:da:eb:43
  Device-3: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 63:00.0
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno8303 state: down mac: c4:cb:e1:ab:61:38
  Device-4: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 63:00.1
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno8403 state: down mac: c4:cb:e1:ab:61:39
  Device-5: Intel Ethernet E810-C for QSFP driver: ice v: kernel pcie: gen: 4 speed: 16 GT/s
    lanes: 8 link-max: lanes: 16 port: N/A bus-ID: 81:00.0 chip-ID: 8086:1592 class-ID: 0200
    temp: 47.0 C
  IF: enp129s0np0 state: up speed: 100000 Mbps duplex: full mac: 30:3e:a7:05:d0:98
  IP v4: 169.254.182.192/16 scope: link
  IP v6: fe80::323e:a7ff:fe05:d098/64 virtual: proto kernel_ll scope: link
  Device-6: Intel Ethernet Adaptive Virtual Function driver: vfio-pci v: N/A modules: iavf
    port: N/A bus-ID: 81:01.0 chip-ID: 8086:1889 class-ID: 0200
  Device-7: Intel Ethernet Adaptive Virtual Function driver: iavf v: kernel port: N/A
    bus-ID: 81:01.1 chip-ID: 8086:1889 class-ID: 0200
  IF: enp129s0v1 state: up speed: 100000 Mbps duplex: full mac: 8a:87:5e:c4:97:86
  IP v4: 169.254.42.16/16 scope: link
  IP v6: fe80::8887:5eff:fec4:9786/64 virtual: proto kernel_ll scope: link
  IF-ID-1: br-11c788e231d8 state: down mac: 02:42:ec:4f:42:59
  IP v4: 172.19.0.1/16 scope: global broadcast: 172.19.255.255
  IF-ID-2: docker0 state: down mac: 02:42:eb:17:08:cf
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-3: doctor-bridge state: up speed: 10000 Mbps duplex: unknown mac: 94:6d:ae:da:eb:42
  IP v4: 131.159.102.25/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::25/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::966d:aeff:feda:eb42/64 virtual: proto kernel_ll scope: link
  IF-ID-4: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:3a82:e9d3:d257:53bb:4ada/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.25
RAID:
  Hardware-1: Broadcom / LSI MegaRAID 12GSAS/PCIe Secure SAS39xx driver: megaraid_sas
    v: 07.734.00.00-rc1 port: 3000 bus-ID: 41:00.0 chip-ID: 1000:10e2 rev: class-ID: 0104
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 2.63 TiB
    allocated: 877 GiB zfs-fs: size: 3.38 TiB free: 2.52 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:4 size: 3.49 TiB
Drives:
  Local Storage: total: raw: 9.9 TiB usable: 9.78 TiB used: 707.91 GiB (7.1%)
  ID-1: /dev/nvme0n1 maj-min: 259:2 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNS0W800676 fw-rev: GDC5602Q temp: 31.9 C scheme: GPT
  SMART: yes health: PASSED on: 2y 18d 3h cycles: 61 read-units: 55,381,407 [28.3 TB]
    written-units: 88,374,253 [45.2 TB]
  ID-2: /dev/nvme1n1 maj-min: 259:5 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNJ0X815789 fw-rev: GDC5A02Q temp: 30.9 C
  SMART: yes health: PASSED on: 51d 6h cycles: 4 read-units: 100,669,194 [51.5 TB]
    written-units: 101,517,011 [51.9 TB]
  ID-3: /dev/nvme2n1 maj-min: 259:0 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB size: 1.46 TiB
    block-size: physical: 512 B logical: 512 B speed: 126.4 Gb/s lanes: 8 tech: SSD
    serial: S61ANA0R501120 fw-rev: 2.0.2 temp: 28.9 C
  SMART: yes health: PASSED on: 4y 5d 15h cycles: 74 read-units: 460,385,345 [235 TB]
    written-units: 255,968,012 [131 TB]
  ID-4: /dev/nvme3n1 maj-min: 259:1 vendor: Samsung model: MZPLJ1T6HBJR-00007 size: 1.46 TiB
    block-size: physical: 512 B logical: 512 B speed: 126.4 Gb/s lanes: 8 tech: SSD
    serial: S55JNC0W600234 fw-rev: EPK9GB5Q temp: 37.9 C
  SMART: yes health: PASSED on: 2y 66d 23h cycles: 101 read-units: 314,118,880 [160 TB]
    written-units: 224,440,692 [114 TB]
Partition:
  ID-1: / raw-size: N/A size: 3.21 TiB used: 707.77 GiB (21.5%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 61.3 MiB (6.0%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:3
  ID-3: /home raw-size: N/A size: 3.43 TiB used: 1.61 TiB (47.0%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 2.52 TiB used: 76.1 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: N/A mobo: N/A
  Fan Speeds (rpm): cpu: 9360 fan-27: 7320 fan-42: 9360 fan-43: 7320 fan-58: 9240 fan-59: 7440
    fan-74: 9240 fan-75: 7320 fan-90: 9240 fan-91: 7320 fan-106: 9360 fan-107: 7440
  Power: 12v: N/A 5v: N/A 3.3v: N/A vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 56.0 C mobo: 47.0 C
  Fan Speeds (rpm): N/A
Info:
  Processes: 933 Power: uptime: 2d 8h 14m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 300.98 GiB Init: systemd v: 257 default: multi-user tool: systemctl
  Packages: 783 pm: nix-default pkgs: 44 pm: nix-sys pkgs: 695 libs: 160 pm: nix-usr pkgs: 44
    libs: 7 Compilers: gcc: 14.3.0 Client: Sudo v: 1.9.17p2 inxi: 3.3.38
```
![hardware topology](vislor.lstopo.svg)
