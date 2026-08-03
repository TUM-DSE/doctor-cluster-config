# amy

```
System:
  Host: amy Kernel: 6.9.0-rc7 arch: x86_64 bits: 64 compiler: gcc v: 14.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\cvmvmsd2kyilbfs61h4130x3ay75jlfs-initrd-linux-6.9-initrd.efi
    init=/nix/store/pdzkdd1lfidk2vckfhp9n0wdykv16l9p-nixos-system-amy-25.11.20260123.ac3d985/init
    console=ttyS0,115200 console=tty0 hugepagesz=1GB hugepages=0 hugepagesz=2MB hugepages=768000
    amd_iommu=off kvm_amd.sev=1 kvm_amd.sev_es=1 kvm_amd.sev_snp=1 sp5100_tco.blacklist=yes
    kvm.gmem_2m_enabled=1 console=ttyS1,115200n8 console=tty1 nohibernate loglevel=4
    lsm=landlock,yama,bpf
  Console: N/A DM: LightDM v: 1.32.0 Distro: NixOS 25.11 (Xantusia)
Machine:
  Type: Server System: sysGen www.sysgen.de product: AS -4124GS-TNR v: 0123456789
    serial: E404070X2C04651 Chassis: type: 17 v: 0123456789 serial: C4180AK50A60933
  Mobo: Supermicro model: H12DSG-O-CPU v: 1.01A serial: VM229S600002
    uuid: 77c47400-4a61-11ed-8000-3cecefea4b96 UEFI: American Megatrends v: 2.4 date: 04/22/2022
Memory:
  System RAM: total: 2 TiB available: 1.95 TiB used: 187.42 GiB (9.4%)
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
  Info: model: AMD EPYC 7413 socket: SP3 bits: 64 type: MCP SMP arch: Zen 3 gen: 3 level: v3
    note: check built: 2021-22 process: TSMC n7 (7nm) family: 0x19 (25) model-id: 1 stepping: 1
    microcode: 0xA001173
  Topology: cpus: 2x dies: 1 clusters: 1 cores: 24 smt: <unsupported> cache:
    L1: 2x 1.5 MiB (3 MiB) desc: d-24x32 KiB; i-24x32 KiB L2: 2x 12 MiB (24 MiB) desc: 24x512 KiB
    L3: 2x 128 MiB (256 MiB) desc: 4x32 MiB
  Speed (MHz): avg: 2650 min/max: 1500/3631 boost: disabled base/boost: 2650/3625 scaling:
    driver: acpi-cpufreq governor: schedutil volts: 1.1 V ext-clock: 100 MHz cores: 1: 2650 2: 2650
    3: 2650 4: 2650 5: 2650 6: 2650 7: 2650 8: 2650 9: 2650 10: 2650 11: 2650 12: 2650 13: 2650
    14: 2650 15: 2650 16: 2650 17: 2650 18: 2650 19: 2650 20: 2650 21: 2650 22: 2650 23: 2650
    24: 2650 25: 2650 26: 2650 27: 2650 28: 2650 29: 2650 30: 2650 31: 2650 32: 2650 33: 2650
    34: 2650 35: 2650 36: 2650 37: 2650 38: 2650 39: 2650 40: 2650 41: 2650 42: 2650 43: 2650
    44: 2650 45: 2650 46: 2650 47: 2650 48: 2650 bogomips: 254410
  Flags-basic: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow status: Vulnerable: Safe RET, no microcode
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Retpolines; IBPB: conditional; IBRS_FW; STIBP: disabled; RSB
    filling; PBRSB-eIBRS: Not affected; BHI: Not affected
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: Virtual-1 bus-ID: 64:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: unspecified server: X.org v: 1.21.1.20 compositor: xfwm4 driver: gpu: ast tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL v: 1.5 platforms: device: 0 drv: swrast surfaceless: drv: swrast
    inactive: gbm,wayland,x11
  API: OpenGL v: 4.5 vendor: mesa v: 25.2.6 note: console (EGL sourced) renderer: llvmpipe (LLVM
    21.1.7 256 bits)
  Info: Tools: api: eglinfo,glxinfo de: xfce4-display-settings x11: xdpyinfo, xprop, xrandr
Audio:
  Message: No device data found.
  Server-1: PipeWire v: 1.4.9 status: off with: 1: pipewire-pulse status: off 2: wireplumber
    status: off 3: pipewire-alsa type: plugin tools: pw-cat,pw-cli,wpctl
Network:
  Device-1: Intel Ethernet E810-C for QSFP driver: ice v: kernel pcie: gen: 4 speed: 16 GT/s
    lanes: 16 port: N/A bus-ID: 61:00.0 chip-ID: 8086:1592 class-ID: 0200 temp: 50.0 C
  IF: enp97s0np0 state: up speed: 100000 Mbps duplex: full mac: b4:96:91:b3:8a:90
  IP v4: 10.0.34.1/8 scope: global
  IP v6: fe80::b696:91ff:feb3:8a90/64 virtual: proto kernel_ll scope: link
  Device-2: Broadcom BCM57412 NetXtreme-E 10Gb RDMA Ethernet driver: bnxt_en v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: c2:00.0 chip-ID: 14e4:16d6 class-ID: 0200
    temp: 55.0 C
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
  IF-ID-1: br-0c031003423a state: down mac: 2a:5e:f2:f5:47:1e
  IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255
  IF-ID-2: docker0 state: down mac: 62:1d:38:51:0e:3d
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-3: doctor-bridge state: up speed: 10000 Mbps duplex: unknown mac: 84:16:0c:cd:99:10
  IP v4: 131.159.102.20/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::20/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::8616:cff:fecd:9910/64 virtual: proto kernel_ll scope: link
  IF-ID-4: enp38s0f3u1u2c2 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-5: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:1551:1906:bc7c:801f:3c4/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.20
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 3-1.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 820 GiB
    allocated: 956 GiB zfs-fs: size: 1.68 TiB free: 764.93 GiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:4 size: 1.75 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.43 TiB used: 760.63 GiB (21.7%)
  ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: MZQL21T9HCJR-00A07 size: 1.75 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64GNA0T724989 fw-rev: GDC5602Q temp: 31.9 C scheme: GPT
  SMART: yes health: PASSED on: 3y 42d 20h cycles: 140 read-units: 102,890,260 [52.6 TB]
    written-units: 176,492,100 [90.3 TB]
  ID-2: /dev/nvme1n1 maj-min: 259:1 vendor: Samsung model: MZQL21T9HCJR-00A07 size: 1.75 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64GNA0T724990 fw-rev: GDC5602Q temp: 33.9 C scheme: MBR
  SMART: yes health: PASSED on: 3y 42d 20h cycles: 140 read-units: 57,527,515 [29.4 TB]
    written-units: 79,627,705 [40.7 TB]
Partition:
  ID-1: / raw-size: N/A size: 1.49 TiB used: 760.59 GiB (49.9%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 30.6 MiB (3.0%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:3
  ID-3: /home raw-size: N/A size: 3.47 TiB used: 2.54 TiB (73.3%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 764.93 GiB used: 896 KiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu-1: 38 C cpu-2: 35 C mobo: 37 C
  Fan Speeds (rpm): fan-1: 3220 fan-2: 3220 fan-3: 3220 fan-4: 3220 fan-5: 3220 fan-6: 3220
    fan-7: 3220 fan-8: 3220 fan-9: 1120 fan-16: 1260
  Power: 12v: 12.112 5v: 5.020 3.3v: 3.276 vbat: N/A dimm-p1: 1.195 dimm-p2: 1.200
  Src: lm-sensors System Temperatures: cpu: 37.5 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 885 Power: uptime: 9d 20h 0m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 798.41 GiB services: upowerd,xfce4-power-manager Init: systemd v: 258
    default: graphical tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 1010 libs: 237 pm: nix-usr pkgs: 0
    Compilers: gcc: 14.3.0 Client: Sudo v: 1.9.17p2 inxi: 3.3.39
```
![hardware topology](amy.lstopo.svg)
