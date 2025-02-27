# amy

```
System:
  Host: amy Kernel: 6.9.0-rc7 arch: x86_64 bits: 64 compiler: gcc v: 13.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\114v5k3v9al62kgy7w40z3ymxy6dyjn3-initrd-linux-6.9-initrd.efi
    init=/nix/store/vvziawfb20gwrgk91x2s9l3h8qcwkhwh-nixos-system-amy-24.11.20250209.392aa11/init
    amd_iommu=on console=ttyS0,115200 console=tty0 hugepagesz=1GB hugepages=0 hugepagesz=2MB
    hugepages=768000 kvm_amd.sev=1 kvm_amd.sev_es=1 kvm_amd.sev_snp=1 sp5100_tco.blacklist=yes
    kvm.gmem_2m_enabled=1 console=ttyS1,115200n8 console=tty1 nohibernate loglevel=4
  Console: N/A DM: LightDM v: 1.32.0 Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Server System: sysGen www.sysgen.de product: AS -4124GS-TNR v: 0123456789
    serial: E404070X2C04651 Chassis: type: 17 v: 0123456789 serial: C4180AK50A60933
  Mobo: Supermicro model: H12DSG-O-CPU v: 1.01A serial: VM229S600002
    uuid: 77c47400-4a61-11ed-8000-3cecefea4b96 UEFI: American Megatrends v: 2.4 date: 04/22/2022
Memory:
  System RAM: total: 2 TiB available: 1.95 TiB used: 1.86 TiB (95.4%)
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
  Info: model: AMD EPYC 7413 socket: SP3 bits: 64 type: MCP SMP arch: Zen 3 gen: 4 level: v3
    note: check built: 2021-22 process: TSMC n7 (7nm) family: 0x19 (25) model-id: 1 stepping: 1
    microcode: 0xA0011D5
  Topology: cpus: 2x cores: 24 smt: <unsupported> cache: L1: 2x 1.5 MiB (3 MiB) desc: d-24x32
    KiB; i-24x32 KiB L2: 2x 12 MiB (24 MiB) desc: 24x512 KiB L3: 2x 128 MiB (256 MiB)
    desc: 4x32 MiB
  Speed (MHz): avg: 1523 high: 2650 min/max: 1500/3631 boost: disabled base/boost: 2650/3625
    scaling: driver: acpi-cpufreq governor: schedutil volts: 1.1 V ext-clock: 100 MHz cores: 1: 1500
    2: 1500 3: 1500 4: 1500 5: 1500 6: 1500 7: 1500 8: 1500 9: 1500 10: 1500 11: 1500 12: 1500
    13: 1500 14: 1500 15: 1500 16: 1500 17: 1500 18: 1500 19: 1500 20: 1500 21: 1500 22: 1500
    23: 1500 24: 1500 25: 1500 26: 1500 27: 1500 28: 1500 29: 1500 30: 1500 31: 1500 32: 1500
    33: 1500 34: 1500 35: 1500 36: 1500 37: 1500 38: 1500 39: 2650 40: 1500 41: 1500 42: 1500
    43: 1500 44: 1500 45: 1500 46: 1500 47: 1500 48: 1500 bogomips: 254408
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
    empty: Virtual-1 bus-ID: 64:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: unspecified server: X.org v: 1.21.1.14 compositor: xfwm4 driver: gpu: ast tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL v: 1.5 platforms: device: 0 drv: swrast surfaceless: drv: swrast
    inactive: gbm,wayland,x11
  API: OpenGL v: 4.5 vendor: mesa v: 24.2.8 note: console (EGL sourced) renderer: llvmpipe (LLVM
    18.1.8 256 bits)
Audio:
  Message: No device data found.
  Server-1: PipeWire v: 1.2.7 status: off with: 1: pipewire-pulse status: off 2: wireplumber
    status: off 3: pipewire-alsa type: plugin tools: pw-cat,pw-cli,wpctl
Network:
  Device-1: Intel Ethernet E810-C for QSFP driver: ice v: kernel pcie: gen: 4 speed: 16 GT/s
    lanes: 16 port: N/A bus-ID: 61:00.0 chip-ID: 8086:1592 class-ID: 0200 temp: 53.0 C
  IF: enp97s0np0 state: down mac: b4:96:91:b3:8a:90
  Device-2: Broadcom BCM57412 NetXtreme-E 10Gb RDMA Ethernet driver: bnxt_en v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: c2:00.0 chip-ID: 14e4:16d6 class-ID: 0200
    temp: 58.0 C
  IF: enp194s0f0np0 state: up speed: 10000 Mbps duplex: full mac: 84:16:0c:cd:99:10
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
  IF-ID-1: br-0c031003423a state: down mac: 02:42:f3:07:7a:25
  IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255
  IF-ID-2: docker0 state: down mac: 02:42:48:56:21:b4
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-3: doctor-bridge state: up speed: 10000 Mbps duplex: unknown mac: 84:16:0c:cd:99:10
  IP v4: 131.159.102.20/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::20/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::8616:cff:fecd:9910/64 virtual: proto kernel_ll scope: link
  IF-ID-4: enp38s0f3u1u2c2 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-5: tap-okelman-1 state: down mac: b6:0c:12:12:4d:a1
  IF-ID-6: tapa-okelma-1 state: down mac: 2a:7d:06:26:9b:30
  IP v6: fe80::287d:6ff:fe26:9b30/64 virtual: proto kernel_ll scope: link
  IF-ID-7: tapa-okelma-10 state: down mac: ce:28:2a:04:80:7b
  IP v6: fe80::cc28:2aff:fe04:807b/64 virtual: proto kernel_ll scope: link
  IF-ID-8: tapa-okelma-11 state: down mac: 3a:a4:ee:ba:62:af
  IP v6: fe80::38a4:eeff:feba:62af/64 virtual: proto kernel_ll scope: link
  IF-ID-9: tapa-okelma-12 state: down mac: 46:d4:e5:fe:bf:dd
  IP v6: fe80::44d4:e5ff:fefe:bfdd/64 virtual: proto kernel_ll scope: link
  IF-ID-10: tapa-okelma-13 state: down mac: 2e:33:41:00:b0:12
  IP v6: fe80::2c33:41ff:fe00:b012/64 virtual: proto kernel_ll scope: link
  IF-ID-11: tapa-okelma-14 state: down mac: 72:fc:f9:71:a0:54
  IP v6: fe80::70fc:f9ff:fe71:a054/64 virtual: proto kernel_ll scope: link
  IF-ID-12: tapa-okelma-15 state: down mac: 26:05:33:b5:c8:56
  IP v6: fe80::2405:33ff:feb5:c856/64 virtual: proto kernel_ll scope: link
  IF-ID-13: tapa-okelma-16 state: down mac: 8e:97:4d:13:06:2f
  IP v6: fe80::8c97:4dff:fe13:62f/64 virtual: proto kernel_ll scope: link
  IF-ID-14: tapa-okelma-17 state: down mac: be:4c:d8:5a:d6:2b
  IP v6: fe80::bc4c:d8ff:fe5a:d62b/64 virtual: proto kernel_ll scope: link
  IF-ID-15: tapa-okelma-18 state: down mac: 8a:c1:37:85:40:af
  IP v6: fe80::88c1:37ff:fe85:40af/64 virtual: proto kernel_ll scope: link
  IF-ID-16: tapa-okelma-19 state: down mac: b6:a0:b9:5f:64:cd
  IP v6: fe80::b4a0:b9ff:fe5f:64cd/64 virtual: proto kernel_ll scope: link
  IF-ID-17: tapa-okelma-2 state: down mac: 3e:5d:a0:5f:79:7d
  IP v6: fe80::3c5d:a0ff:fe5f:797d/64 virtual: proto kernel_ll scope: link
  IF-ID-18: tapa-okelma-20 state: down mac: 96:10:c8:d8:b7:81
  IP v6: fe80::9410:c8ff:fed8:b781/64 virtual: proto kernel_ll scope: link
  IF-ID-19: tapa-okelma-21 state: down mac: 6e:5d:e2:b3:15:22
  IP v6: fe80::6c5d:e2ff:feb3:1522/64 virtual: proto kernel_ll scope: link
  IF-ID-20: tapa-okelma-22 state: down mac: 06:bd:f7:7a:db:6d
  IP v6: fe80::4bd:f7ff:fe7a:db6d/64 virtual: proto kernel_ll scope: link
  IF-ID-21: tapa-okelma-23 state: down mac: 52:b2:0f:12:eb:2f
  IP v6: fe80::50b2:fff:fe12:eb2f/64 virtual: proto kernel_ll scope: link
  IF-ID-22: tapa-okelma-24 state: down mac: ee:09:e9:24:4d:5a
  IP v6: fe80::ec09:e9ff:fe24:4d5a/64 virtual: proto kernel_ll scope: link
  IF-ID-23: tapa-okelma-25 state: down mac: aa:0c:2d:fc:2e:1b
  IP v6: fe80::a80c:2dff:fefc:2e1b/64 virtual: proto kernel_ll scope: link
  IF-ID-24: tapa-okelma-26 state: down mac: ea:42:35:65:5c:14
  IP v6: fe80::e842:35ff:fe65:5c14/64 virtual: proto kernel_ll scope: link
  IF-ID-25: tapa-okelma-27 state: down mac: 4a:94:d9:01:3f:93
  IP v6: fe80::4894:d9ff:fe01:3f93/64 virtual: proto kernel_ll scope: link
  IF-ID-26: tapa-okelma-28 state: down mac: 6a:fe:11:83:2c:48
  IP v6: fe80::68fe:11ff:fe83:2c48/64 virtual: proto kernel_ll scope: link
  IF-ID-27: tapa-okelma-29 state: down mac: 02:d2:03:85:94:f5
  IP v6: fe80::d2:3ff:fe85:94f5/64 virtual: proto kernel_ll scope: link
  IF-ID-28: tapa-okelma-3 state: down mac: ca:99:bd:59:8e:f1
  IP v6: fe80::c899:bdff:fe59:8ef1/64 virtual: proto kernel_ll scope: link
  IF-ID-29: tapa-okelma-30 state: down mac: b6:80:5f:16:1e:be
  IP v6: fe80::b480:5fff:fe16:1ebe/64 virtual: proto kernel_ll scope: link
  IF-ID-30: tapa-okelma-31 state: down mac: fe:56:44:8b:c1:4d
  IP v6: fe80::fc56:44ff:fe8b:c14d/64 virtual: proto kernel_ll scope: link
  IF-ID-31: tapa-okelma-32 state: down mac: 62:fc:64:07:79:ca
  IP v6: fe80::60fc:64ff:fe07:79ca/64 virtual: proto kernel_ll scope: link
  IF-ID-32: tapa-okelma-33 state: down mac: de:3b:e7:bd:3d:0b
  IP v6: fe80::dc3b:e7ff:febd:3d0b/64 virtual: proto kernel_ll scope: link
  IF-ID-33: tapa-okelma-34 state: down mac: ee:cf:e5:0c:9e:24
  IP v6: fe80::eccf:e5ff:fe0c:9e24/64 virtual: proto kernel_ll scope: link
  IF-ID-34: tapa-okelma-35 state: down mac: f6:87:9a:53:64:54
  IP v6: fe80::f487:9aff:fe53:6454/64 virtual: proto kernel_ll scope: link
  IF-ID-35: tapa-okelma-36 state: down mac: 5e:e6:66:d1:db:60
  IP v6: fe80::5ce6:66ff:fed1:db60/64 virtual: proto kernel_ll scope: link
  IF-ID-36: tapa-okelma-37 state: down mac: 7e:c2:4b:a8:46:e8
  IP v6: fe80::7cc2:4bff:fea8:46e8/64 virtual: proto kernel_ll scope: link
  IF-ID-37: tapa-okelma-38 state: down mac: 86:d3:0a:48:b9:f7
  IP v6: fe80::84d3:aff:fe48:b9f7/64 virtual: proto kernel_ll scope: link
  IF-ID-38: tapa-okelma-39 state: down mac: 96:9e:a0:34:a1:aa
  IP v6: fe80::949e:a0ff:fe34:a1aa/64 virtual: proto kernel_ll scope: link
  IF-ID-39: tapa-okelma-4 state: down mac: 42:8c:9a:c4:77:73
  IP v6: fe80::408c:9aff:fec4:7773/64 virtual: proto kernel_ll scope: link
  IF-ID-40: tapa-okelma-40 state: down mac: c6:96:6e:ac:01:2b
  IP v6: fe80::c496:6eff:feac:12b/64 virtual: proto kernel_ll scope: link
  IF-ID-41: tapa-okelma-41 state: down mac: ba:ba:6f:1e:fd:47
  IP v6: fe80::b8ba:6fff:fe1e:fd47/64 virtual: proto kernel_ll scope: link
  IF-ID-42: tapa-okelma-42 state: down mac: e6:af:68:b4:ca:70
  IP v6: fe80::e4af:68ff:feb4:ca70/64 virtual: proto kernel_ll scope: link
  IF-ID-43: tapa-okelma-43 state: down mac: 46:37:dd:30:39:e7
  IP v6: fe80::4437:ddff:fe30:39e7/64 virtual: proto kernel_ll scope: link
  IF-ID-44: tapa-okelma-44 state: down mac: 5a:ee:f3:5d:8f:ec
  IP v6: fe80::58ee:f3ff:fe5d:8fec/64 virtual: proto kernel_ll scope: link
  IF-ID-45: tapa-okelma-45 state: down mac: 12:62:1e:13:72:c6
  IP v6: fe80::1062:1eff:fe13:72c6/64 virtual: proto kernel_ll scope: link
  IF-ID-46: tapa-okelma-46 state: down mac: 86:14:29:93:51:6c
  IP v6: fe80::8414:29ff:fe93:516c/64 virtual: proto kernel_ll scope: link
  IF-ID-47: tapa-okelma-47 state: down mac: c2:88:6b:ff:5f:dd
  IP v6: fe80::c088:6bff:feff:5fdd/64 virtual: proto kernel_ll scope: link
  IF-ID-48: tapa-okelma-48 state: down mac: fe:01:8b:ef:fa:78
  IP v6: fe80::fc01:8bff:feef:fa78/64 virtual: proto kernel_ll scope: link
  IF-ID-49: tapa-okelma-49 state: down mac: 26:59:06:0c:fe:4d
  IP v6: fe80::2459:6ff:fe0c:fe4d/64 virtual: proto kernel_ll scope: link
  IF-ID-50: tapa-okelma-5 state: down mac: f2:cc:9d:87:73:93
  IP v6: fe80::f0cc:9dff:fe87:7393/64 virtual: proto kernel_ll scope: link
  IF-ID-51: tapa-okelma-50 state: down mac: e2:39:d5:fd:bb:c6
  IP v6: fe80::e039:d5ff:fefd:bbc6/64 virtual: proto kernel_ll scope: link
  IF-ID-52: tapa-okelma-51 state: down mac: d6:a2:1e:32:15:e7
  IP v6: fe80::d4a2:1eff:fe32:15e7/64 virtual: proto kernel_ll scope: link
  IF-ID-53: tapa-okelma-52 state: down mac: 46:6e:1e:29:fe:31
  IP v6: fe80::446e:1eff:fe29:fe31/64 virtual: proto kernel_ll scope: link
  IF-ID-54: tapa-okelma-53 state: down mac: 7a:c6:09:52:e1:4c
  IP v6: fe80::78c6:9ff:fe52:e14c/64 virtual: proto kernel_ll scope: link
  IF-ID-55: tapa-okelma-54 state: down mac: 3a:81:dc:eb:ac:b1
  IP v6: fe80::3881:dcff:feeb:acb1/64 virtual: proto kernel_ll scope: link
  IF-ID-56: tapa-okelma-55 state: down mac: ce:9a:82:fd:35:1d
  IP v6: fe80::cc9a:82ff:fefd:351d/64 virtual: proto kernel_ll scope: link
  IF-ID-57: tapa-okelma-56 state: down mac: da:3c:36:c4:a9:93
  IP v6: fe80::d83c:36ff:fec4:a993/64 virtual: proto kernel_ll scope: link
  IF-ID-58: tapa-okelma-57 state: down mac: 2a:19:82:8f:5b:d8
  IP v6: fe80::2819:82ff:fe8f:5bd8/64 virtual: proto kernel_ll scope: link
  IF-ID-59: tapa-okelma-58 state: down mac: de:a9:4c:3f:9d:28
  IP v6: fe80::dca9:4cff:fe3f:9d28/64 virtual: proto kernel_ll scope: link
  IF-ID-60: tapa-okelma-59 state: down mac: 36:b1:33:2f:45:28
  IP v6: fe80::34b1:33ff:fe2f:4528/64 virtual: proto kernel_ll scope: link
  IF-ID-61: tapa-okelma-6 state: down mac: aa:2c:65:80:bf:3c
  IP v6: fe80::a82c:65ff:fe80:bf3c/64 virtual: proto kernel_ll scope: link
  IF-ID-62: tapa-okelma-60 state: down mac: f6:cb:12:71:c7:98
  IP v6: fe80::f4cb:12ff:fe71:c798/64 virtual: proto kernel_ll scope: link
  IF-ID-63: tapa-okelma-61 state: down mac: 1e:7d:89:87:9f:97
  IP v6: fe80::1c7d:89ff:fe87:9f97/64 virtual: proto kernel_ll scope: link
  IF-ID-64: tapa-okelma-62 state: down mac: b2:9b:f7:b3:51:41
  IP v6: fe80::b09b:f7ff:feb3:5141/64 virtual: proto kernel_ll scope: link
  IF-ID-65: tapa-okelma-63 state: down mac: c6:04:b9:bc:90:c2
  IP v6: fe80::c404:b9ff:febc:90c2/64 virtual: proto kernel_ll scope: link
  IF-ID-66: tapa-okelma-64 state: down mac: 9a:6b:6a:9a:d8:1f
  IF-ID-67: tapa-okelma-7 state: down mac: 32:b6:8f:54:69:16
  IP v6: fe80::30b6:8fff:fe54:6916/64 virtual: proto kernel_ll scope: link
  IF-ID-68: tapa-okelma-8 state: down mac: 6a:02:25:d6:4d:8c
  IP v6: fe80::6802:25ff:fed6:4d8c/64 virtual: proto kernel_ll scope: link
  IF-ID-69: tapa-okelma-9 state: down mac: fe:dd:cf:98:30:69
  IP v6: fe80::fcdd:cfff:fe98:3069/64 virtual: proto kernel_ll scope: link
  IF-ID-70: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:1551:1906:bc7c:801f:3c4/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.20
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 3-1.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zokelmannvms type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 1000 GiB
    allocated: 776 GiB zfs-fs: size: 1.68 TiB free: 945.34 GiB
  Components: Online:
  1: nvme1n1p1 maj-min: 259:2 size: 1.75 TiB
  Device-2: zroot type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 989 GiB
    allocated: 787 GiB zfs-fs: size: 1.68 TiB free: 933.51 GiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:4 size: 1.75 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.36 TiB used: 1.31 TiB (38.8%)
  ID-1: /dev/nvme0n1 maj-min: 259:1 vendor: Samsung model: MZQL21T9HCJR-00A07 size: 1.75 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64GNA0T724989 fw-rev: GDC5602Q temp: 35.9 C scheme: GPT
  SMART: yes health: PASSED on: 2y 12d 0h cycles: 135 read-units: 70,964,546 [36.3 TB]
    written-units: 119,262,115 [61.0 TB]
  ID-2: /dev/nvme1n1 maj-min: 259:0 vendor: Samsung model: MZQL21T9HCJR-00A07 size: 1.75 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64GNA0T724990 fw-rev: GDC5602Q temp: 38.9 C scheme: MBR
  SMART: yes health: PASSED on: 2y 12d 0h cycles: 135 read-units: 30,004,602 [15.3 TB]
    written-units: 54,930,597 [28.1 TB]
Partition:
  ID-1: / raw-size: N/A size: 1.46 TiB used: 558.9 GiB (37.4%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 29.1 MiB (2.8%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:3
  ID-3: /home raw-size: N/A size: 2.71 TiB used: 1.98 TiB (73.1%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 933.51 GiB used: 2.8 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu-1: 38 C cpu-2: 36 C mobo: 39 C
  Fan Speeds (rpm): fan-1: 3220 fan-2: 3220 fan-3: 3220 fan-4: 3220 fan-5: 3220 fan-6: 3220
    fan-7: 3220 fan-8: 3220 fan-9: 1260 fan-16: 1260
  Power: 12v: 12.112 5v: 5.020 3.3v: 3.276 vbat: N/A dimm-p1: 1.213 dimm-p2: 1.221
  Src: lm-sensors System Temperatures: cpu: 38.5 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 1026 Power: uptime: 3d 6h 58m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 798.41 GiB services: upowerd,xfce4-power-manager Init: systemd v: 256
    default: graphical tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 962 libs: 225 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](amy.lstopo.svg)
