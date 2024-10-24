# rose

```
System:
  Host: rose Kernel: 6.9.0-rc7 arch: x86_64 bits: 64 compiler: gcc v: 13.2.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\ap27y9yraljzpfhvvghd80p83drpw32g-initrd-linux-6.9-initrd.efi
    init=/nix/store/3rm1accqfd09ximphr2fl89qfmc0yvx5-nixos-system-rose-24.05.20240926.3dfb4c8/init
    console=ttyS0,115200 console=tty0 amd_iommu=on hugepagesz=1GB hugepages=0 hugepagesz=2MB
    hugepages=768000 kvm_amd.sev=1 kvm_amd.sev_es=1 kvm_amd.sev_snp=1 sp5100_tco.blacklist=yes
    kvm.gmem_2m_enabled=1 console=ttyS1,115200n8 console=tty1 nohibernate loglevel=4
  Console: N/A DM: LightDM v: 1.32.0 Distro: NixOS 24.05 (Uakari)
Machine:
  Type: Server System: Supermicro product: Super Server v: 0123456789 serial: 0123456789 Chassis:
    type: 17 v: 0123456789 serial: 0123456789
  Mobo: Supermicro model: H12DSG-O-CPU v: 1.01A serial: VM227S602140
    uuid: e7b77c00-4ef1-11ed-8000-3cecefea4bb2 UEFI: American Megatrends v: 2.8 date: 01/26/2024
Memory:
  System RAM: total: 2 TiB available: 1.95 TiB used: 1.59 TiB (81.5%)
  Array-1: capacity: 8 TiB slots: 32 modules: 32 EC: Multi-bit ECC max-module-size: 256 GiB
    note: est.
  Device-1: P1-DIMMA1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0CZ00022451B3E62A
  Device-2: P1-DIMMA2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348534210
  Device-3: P1-DIMMB1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DQ00022551BB04A5
  Device-4: P1-DIMMB2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0TG00020749E3213D
  Device-5: P1-DIMMC1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DJ00022551BA2E53
  Device-6: P1-DIMMC2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DJ00022551BA23A7
  Device-7: P1-DIMMD1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H1QD00020749E2FA0A
  Device-8: P1-DIMMD2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348533606
  Device-9: P1-DIMME1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H1QD00020749E2E9D3
  Device-10: P1-DIMME2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0T100022451B3B16D
  Device-11: P1-DIMMF1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348534308
  Device-12: P1-DIMMF2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0O6000201494B8633
  Device-13: P1-DIMMG1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0T100022451B3AD8D
  Device-14: P1-DIMMG2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0TY000142484829B2
  Device-15: P1-DIMMH1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348534345
  Device-16: P1-DIMMH2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H1YD0002295246DBA5
  Device-17: P2-DIMMA1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DQ00022551BB0536
  Device-18: P2-DIMMA2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0TG00020749E328F2
  Device-19: P2-DIMMB1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0CZ00022451B3E411
  Device-20: P2-DIMMB2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0CZ00022451B3E434
  Device-21: P2-DIMMC1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T1PC00022451B45173
  Device-22: P2-DIMMC2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DQ00022551BB04E0
  Device-23: P2-DIMMD1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0CZ00022451B3E44F
  Device-24: P2-DIMMD2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H1YD0002295246DA37
  Device-25: P2-DIMME1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0CZ00022451B3E52C
  Device-26: P2-DIMME2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J10001434853400C
  Device-27: P2-DIMMF1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0TG00020749E3213F
  Device-28: P2-DIMMF2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348532EDB
  Device-29: P2-DIMMG1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348532922
  Device-30: P2-DIMMG2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348534195
  Device-31: P2-DIMMH1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J1000143485343F7
  Device-32: P2-DIMMH2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0T100022451B3A6A8
PCI Slots:
  Slot: 1 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: e0:03.1
  Slot: 2 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: c0:01.1
  Slot: 3 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 80:01.1
  Slot: 4 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: a0:03.1
  Slot: 5 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: c2:00.0
  Slot: 6 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: c2:00.0
  Slot: 7 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 60:03.1
  Slot: 8 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 40:01.1
  Slot: 9 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 00:01.1
  Slot: 10 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 20:03.1
CPU:
  Info: model: AMD EPYC 7413 socket: SP3 bits: 64 type: MCP SMP arch: Zen 3 gen: 4 level: v3
    note: check built: 2021-22 process: TSMC n7 (7nm) family: 0x19 (25) model-id: 1 stepping: 1
    microcode: 0xA0011D5
  Topology: cpus: 2x cores: 24 smt: <unsupported> cache: L1: 2x 1.5 MiB (3 MiB) desc: d-24x32
    KiB; i-24x32 KiB L2: 2x 12 MiB (24 MiB) desc: 24x512 KiB L3: 2x 128 MiB (256 MiB)
    desc: 4x32 MiB
  Speed (MHz): avg: 1595 high: 2650 min/max: 1500/3631 boost: disabled base/boost: 2650/3625
    scaling: driver: acpi-cpufreq governor: schedutil volts: 1.1 V ext-clock: 100 MHz cores: 1: 1500
    2: 1500 3: 1500 4: 1500 5: 1500 6: 1500 7: 1500 8: 2650 9: 1500 10: 1500 11: 1500 12: 1500
    13: 1500 14: 1500 15: 1500 16: 1500 17: 1500 18: 1500 19: 1500 20: 1500 21: 1500 22: 1500
    23: 1500 24: 1500 25: 1500 26: 1500 27: 1500 28: 2650 29: 1500 30: 1500 31: 1500 32: 1500
    33: 2650 34: 1500 35: 1500 36: 1500 37: 1500 38: 1500 39: 1500 40: 1500 41: 1500 42: 1500
    43: 1500 44: 1500 45: 1500 46: 1500 47: 1500 48: 2650 bogomips: 254395
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
  Type: spectre_v2 mitigation: Retpolines; IBPB: conditional; IBRS_FW; STIBP: disabled; RSB
    filling; PBRSB-eIBRS: Not affected; BHI: Not affected
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: Virtual-1 bus-ID: 62:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: server: X.org v: 1.21.1.13 driver: gpu: ast tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL v: 1.5 platforms: gbm: drv: N/A inactive: wayland,x11,device
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
Network:
  Device-1: Broadcom BCM57412 NetXtreme-E 10Gb RDMA Ethernet driver: bnxt_en v: kernel pcie: gen: 3
    speed: 8 GT/s lanes: 8 port: N/A bus-ID: c2:00.0 chip-ID: 14e4:16d6 class-ID: 0200 temp: 56.0 C
  IF: enp194s0f0np0 state: up speed: 10000 Mbps duplex: full mac: 84:16:0c:cd:69:40
  IP v4: 131.159.102.21/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::21/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::8616:cff:fecd:6940/64 virtual: proto kernel_ll scope: link
  Device-2: Broadcom BCM57412 NetXtreme-E 10Gb RDMA Ethernet driver: bnxt_en v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: c2:00.1 chip-ID: 14e4:16d6 class-ID: 0200
  IF: enp194s0f1np1 state: down mac: 84:16:0c:cd:69:41
  Device-3: Intel I350 Gigabit Network vendor: Super Micro driver: igb v: kernel pcie: gen: 2
    speed: 5 GT/s lanes: 1 link-max: lanes: 4 port: f020 bus-ID: e4:00.0 chip-ID: 8086:1521
    class-ID: 0200
  IF: eno1 state: up speed: 1000 Mbps duplex: full mac: 3c:ec:ef:ea:4b:b2
  IP v4: 169.254.234.177/16 scope: link
  IP v6: fe80::3eec:efff:feea:4bb2/64 virtual: proto kernel_ll scope: link
  Device-4: Intel I350 Gigabit Network vendor: Super Micro driver: igb v: kernel pcie: gen: 2
    speed: 5 GT/s lanes: 1 link-max: lanes: 4 port: f000 bus-ID: e4:00.1 chip-ID: 8086:1521
    class-ID: 0200
  IF: eno2 state: down mac: 3c:ec:ef:ea:4b:b3
  IF-ID-1: docker0 state: down mac: 02:42:48:66:16:f8
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-2: enp38s0f3u1u1c2 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:a5a1:618d:663a:f0f1:ec88/16 scope: global
  IF-ID-4: virbr0 state: down mac: 52:54:00:c4:18:f4
  IP v4: 192.168.122.1/24 scope: global broadcast: 192.168.122.255
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.21
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 3-1.1:3 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zokelmannvms type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 1.43 TiB
    allocated: 316 GiB zfs-fs: size: 1.68 TiB free: 1.37 TiB
  Components: Online:
  1: nvme0n1p1 maj-min: 259:2 size: 1.75 TiB
  Device-2: zroot type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 692 GiB
    allocated: 1.06 TiB zfs-fs: size: 1.68 TiB free: 637.33 GiB
  Components: Online:
  1: nvme1n1p2 maj-min: 259:4 size: 1.75 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.36 TiB used: 1.26 TiB (37.4%)
  ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: MZQL21T9HCJR-00A07 size: 1.75 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64GNA0T724986 fw-rev: GDC5602Q temp: 34.9 C scheme: GPT
  SMART: yes health: PASSED on: 1y 246d 18h cycles: 75 read-units: 13,217,734 [6.76 TB]
    written-units: 73,477,421 [37.6 TB]
  ID-2: /dev/nvme1n1 maj-min: 259:1 vendor: Samsung model: MZQL21T9HCJR-00A07 size: 1.75 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64GNA0T724987 fw-rev: GDC5602Q temp: 34.9 C scheme: GPT
  SMART: yes health: PASSED on: 1y 246d 18h cycles: 75 read-units: 106,930,123 [54.7 TB]
    written-units: 123,151,494 [63.0 TB]
Partition:
  ID-1: / raw-size: N/A size: 1.57 TiB used: 971.28 GiB (60.4%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 28.9 MiB (2.8%) fs: vfat
    block-size: 512 B dev: /dev/nvme1n1p1 maj-min: 259:3
  ID-3: /home raw-size: N/A size: 2.93 TiB used: 1.46 TiB (49.8%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 638.47 GiB used: 1.14 GiB (0.2%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu-1: 35 C cpu-2: 38 C mobo: 41 C
  Fan Speeds (rpm): fan-1: 3220 fan-2: 3220 fan-3: 3220 fan-4: 3220 fan-5: 3220 fan-6: 3220
    fan-7: 3220 fan-8: 3220 fan-9: 1260 fan-16: 1120
  Power: 12v: 12.112 5v: 5.020 3.3v: 3.276 vbat: N/A dimm-p1: 1.189 dimm-p2: 1.200
  Src: lm-sensors System Temperatures: cpu: 38.8 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 1022 Power: uptime: 25d 10h 53m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 798.4 GiB Init: systemd v: 255 default: graphical tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 917 libs: 222 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.2.0 Client: Sudo v: 1.9.15p5 inxi: 3.3.34
```
![hardware topology](rose.lstopo.svg)
