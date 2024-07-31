# amy

```
System:
  Host: amy Kernel: 6.8.12 arch: x86_64 bits: 64 compiler: gcc v: 13.2.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\yvylixfa0hxhyxwm9pxilmp9kji8mcxs-initrd-linux-6.8.12-initrd.efi
    init=/nix/store/sx5grsv8g0m8f9zdk305xk9hvjn0z2w3-nixos-system-amy-24.05.20240709.249fbde/init
    console=ttyS0,115200 console=tty0 amd_iommu=on hugepagesz=1GB hugepages=0 hugepagesz=2MB
    hugepages=768000 console=ttyS1,115200n8 console=tty1 nohibernate loglevel=4
  Console: N/A DM: LightDM v: 1.32.0 Distro: NixOS 24.05 (Uakari)
Machine:
  Type: Server System: sysGen www.sysgen.de product: AS -4124GS-TNR v: 0123456789
    serial: E404070X2C04651 Chassis: type: 17 v: 0123456789 serial: C4180AK50A60933
  Mobo: Supermicro model: H12DSG-O-CPU v: 1.01A serial: VM229S600002
    uuid: 77c47400-4a61-11ed-8000-3cecefea4b96 UEFI: American Megatrends v: 2.4 date: 04/22/2022
Memory:
  System RAM: total: 2 TiB available: 1.96 TiB used: 1.57 TiB (80.0%)
  Array-1: capacity: 8 TiB slots: 32 modules: 32 EC: Multi-bit ECC max-module-size: 256 GiB
    note: est.
  Device-1: P1-DIMMA1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DQ00022551BB04A3
  Device-2: P1-DIMMA2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0O6000201494B91E1
  Device-3: P1-DIMMB1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0TG00020749E32278
  Device-4: P1-DIMMB2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J1000143485338CE
  Device-5: P1-DIMMC1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J10001434856F4B3
  Device-6: P1-DIMMC2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J1000143485343FB
  Device-7: P1-DIMMD1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H1YD0002295246DA6B
  Device-8: P1-DIMMD2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J10001434856F4D4
  Device-9: P1-DIMME1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0T100022451B3B0B3
  Device-10: P1-DIMME2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0O6000201494BB1B6
  Device-11: P1-DIMMF1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H1YD0002295246C280
  Device-12: P1-DIMMF2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348532E63
  Device-13: P1-DIMMG1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J10001434856F4D5
  Device-14: P1-DIMMG2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DJ00022551BA26B4
  Device-15: P1-DIMMH1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0TG00020749E329BE
  Device-16: P1-DIMMH2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T1PC00022451B45722
  Device-17: P2-DIMMA1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0CZ00022451B3E451
  Device-18: P2-DIMMA2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0TG00020749E32462
  Device-19: P2-DIMMB1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DJ00022551BA2B4F
  Device-20: P2-DIMMB2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T1PD00022451B45A0B
  Device-21: P2-DIMMC1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0TG00020749E328E9
  Device-22: P2-DIMMC2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DJ00022551BA2F10
  Device-23: P2-DIMMD1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H1QD00020749E2EA44
  Device-24: P2-DIMMD2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348532E01
  Device-25: P2-DIMME1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J1000143485333E8
  Device-26: P2-DIMME2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J1000143485335C7
  Device-27: P2-DIMMF1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: H0DJ00022551BA2B20
  Device-28: P2-DIMMF2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348532ED9
  Device-29: P2-DIMMG1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0O6000201494BB005
  Device-30: P2-DIMMG2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J1000143485340DC
  Device-31: P2-DIMMH1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T0J100014348534435
  Device-32: P2-DIMMH2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40BB4-CWE firmware: M393A8G40BB4-CWE
    serial: T1PC00022451B45DF1
PCI Slots:
  Slot: 1 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: e1:00.0
  Slot: 2 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: c0:01.1
  Slot: 3 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 80:01.1
  Slot: 4 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: a0:03.1
  Slot: 5 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: c2:00.0
  Slot: 6 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: c2:00.0
  Slot: 7 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: 61:00.0
  Slot: 8 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 40:01.1
  Slot: 9 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 00:01.1
  Slot: 10 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: 20:03.1
CPU:
  Info: model: AMD EPYC 7413 socket: SP3 bits: 64 type: MT MCP SMP arch: Zen 3 gen: 4 level: v3
    note: check built: 2021-22 process: TSMC n7 (7nm) family: 0x19 (25) model-id: 1 stepping: 1
    microcode: 0xA0011D3
  Topology: cpus: 2x cores: 24 tpc: 2 threads: 48 smt: enabled cache: L1: 2x 1.5 MiB (3 MiB)
    desc: d-24x32 KiB; i-24x32 KiB L2: 2x 12 MiB (24 MiB) desc: 24x512 KiB L3: 2x 128 MiB (256 MiB)
    desc: 4x32 MiB
  Speed (MHz): avg: 1648 high: 2650 min/max: 1500/3631 boost: enabled base/boost: 2650/3625
    scaling: driver: acpi-cpufreq governor: schedutil volts: 1.1 V ext-clock: 100 MHz cores: 1: 1500
    2: 1500 3: 1500 4: 1500 5: 1500 6: 1500 7: 1500 8: 1500 9: 1500 10: 1500 11: 1500 12: 2650
    13: 1500 14: 1500 15: 1500 16: 1500 17: 1500 18: 1500 19: 1500 20: 1500 21: 1500 22: 2650
    23: 1500 24: 1500 25: 1500 26: 1500 27: 1500 28: 1500 29: 1500 30: 1500 31: 1500 32: 1500
    33: 1500 34: 1500 35: 2000 36: 1500 37: 1500 38: 1500 39: 1500 40: 2650 41: 2650 42: 1500
    43: 1500 44: 1500 45: 2650 46: 1500 47: 1500 48: 1500 49: 1500 50: 1500 51: 2650 52: 1500
    53: 1500 54: 2650 55: 2650 56: 1500 57: 1500 58: 1500 59: 1500 60: 1500 61: 1500 62: 1500
    63: 1500 64: 1500 65: 1500 66: 1500 67: 1500 68: 1500 69: 1500 70: 1500 71: 1500 72: 1500
    73: 2650 74: 1500 75: 1500 76: 1500 77: 1500 78: 1500 79: 1500 80: 1500 81: 1500 82: 1500
    83: 1500 84: 1500 85: 1500 86: 1500 87: 1500 88: 1500 89: 1500 90: 1500 91: 1500 92: 1500
    93: 2650 94: 2650 95: 2650 96: 1500 bogomips: 508795
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
  Type: spectre_v2 mitigation: Retpolines; IBPB: conditional; IBRS_FW; STIBP: always-on; RSB
    filling; PBRSB-eIBRS: Not affected; BHI: Not affected
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: Virtual-1 bus-ID: 64:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: server: X.org v: 1.21.1.13 compositor: xfwm4 driver: gpu: ast tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL v: 1.5 platforms: gbm: drv: N/A inactive: wayland,x11,device
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
Network:
  Device-1: Intel Ethernet E810-C for QSFP driver: N/A modules: ice pcie: gen: 4 speed: 16 GT/s
    lanes: 16 port: N/A bus-ID: 61:00.0 chip-ID: 8086:1592 class-ID: 0200
  Device-2: Broadcom BCM57412 NetXtreme-E 10Gb RDMA Ethernet driver: bnxt_en v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: c2:00.0 chip-ID: 14e4:16d6 class-ID: 0200
    temp: 50.0 C
  IF: enp194s0f0np0 state: up speed: 10000 Mbps duplex: full mac: 84:16:0c:cd:99:10
  IP v4: 131.159.102.20/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::20/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::8616:cff:fecd:9910/64 virtual: proto kernel_ll scope: link
  Device-3: Broadcom BCM57412 NetXtreme-E 10Gb RDMA Ethernet driver: bnxt_en v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: c2:00.1 chip-ID: 14e4:16d6 class-ID: 0200
  IF: enp194s0f1np1 state: up speed: 10000 Mbps duplex: full mac: 84:16:0c:cd:99:11
  IP v4: 169.254.91.83/16 scope: link
  IP v6: fe80::8616:cff:fecd:9911/64 virtual: proto kernel_ll scope: link
  Device-4: Intel I350 Gigabit Network vendor: Super Micro driver: igb v: kernel pcie: gen: 2
    speed: 5 GT/s lanes: 1 link-max: lanes: 4 port: f020 bus-ID: e5:00.0 chip-ID: 8086:1521
    class-ID: 0200
  IF: eno1 state: up speed: 1000 Mbps duplex: full mac: 3c:ec:ef:ea:4b:96
  IP v4: 169.254.61.183/16 scope: link
  IP v6: fe80::3eec:efff:feea:4b96/64 virtual: proto kernel_ll scope: link
  Device-5: Intel I350 Gigabit Network vendor: Super Micro driver: igb v: kernel pcie: gen: 2
    speed: 5 GT/s lanes: 1 link-max: lanes: 4 port: f000 bus-ID: e5:00.1 chip-ID: 8086:1521
    class-ID: 0200
  IF: eno2 state: up speed: 1000 Mbps duplex: full mac: 3c:ec:ef:ea:4b:97
  IP v4: 169.254.96.39/16 scope: link
  IP v6: fe80::3eec:efff:feea:4b97/64 virtual: proto kernel_ll scope: link
  IF-ID-1: br-0c031003423a state: down mac: 02:42:16:60:af:17
  IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255
  IF-ID-2: docker0 state: down mac: 02:42:91:da:48:8a
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-3: enp38s0f3u1u2c2 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-4: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:1551:1906:bc7c:801f:3c4/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.20
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 3-1.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zokelmannvms type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 1.44 TiB
    allocated: 301 GiB zfs-fs: size: 1.68 TiB free: 1.39 TiB
  Components: Online:
  1: nvme1n1p1 maj-min: 259:2 size: 1.75 TiB
  Device-2: zroot type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 1.2 TiB
    allocated: 549 GiB zfs-fs: size: 1.68 TiB free: 1.14 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:4 size: 1.75 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.36 TiB used: 676.08 GiB (19.6%)
  ID-1: /dev/nvme0n1 maj-min: 259:1 vendor: Samsung model: MZQL21T9HCJR-00A07 size: 1.75 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64GNA0T724989 fw-rev: GDC5602Q temp: 35.9 C scheme: GPT
  SMART: yes health: PASSED on: 1y 166d 1h cycles: 131 read-units: 61,858,579 [31.6 TB]
    written-units: 88,435,709 [45.2 TB]
  ID-2: /dev/nvme1n1 maj-min: 259:0 vendor: Samsung model: MZQL21T9HCJR-00A07 size: 1.75 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64GNA0T724990 fw-rev: GDC5602Q temp: 35.9 C scheme: MBR
  SMART: yes health: PASSED on: 1y 166d 1h cycles: 131 read-units: 11,451 [5.86 GB]
    written-units: 9,093,214 [4.65 TB]
Partition:
  ID-1: / raw-size: N/A size: 1.51 TiB used: 374.17 GiB (24.2%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 85.5 MiB (8.4%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:3
  ID-3: /home raw-size: N/A size: 3.02 TiB used: 1.3 TiB (43.1%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 1.14 TiB used: 446.6 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu-1: 37 C cpu-2: 39 C mobo: 39 C
  Fan Speeds (rpm): cpu: 8820 fan-2: 8820 fan-3: 8820 fan-4: 8820 fan-5: 8820 fan-6: 8820
    fan-7: 8820 fan-8: 8820 fan-9: 1540 fan-16: 1540
  Power: 12v: 12.112 5v: 5.020 3.3v: 3.293 vbat: N/A dimm-p1: 1.195 dimm-p2: 1.200
  Src: lm-sensors System Temperatures: cpu: 39.6 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 1721 Power: uptime: 2d 5h 24m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 801.55 GiB services: upowerd,xfce4-power-manager Init: systemd v: 255
    default: graphical tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 888 libs: 216 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.2.0 Client: Sudo v: 1.9.15p5 inxi: 3.3.34
```
![hardware topology](amy.lstopo.svg)
