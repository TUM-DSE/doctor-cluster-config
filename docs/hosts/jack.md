# jack

```
System:
  Host: jack Kernel: 6.6.37 arch: x86_64 bits: 64 compiler: gcc v: 13.2.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\s3la410alw0hid916sv4cwmcdgdaivx1-initrd-linux-6.6.37-initrd.efi
    init=/nix/store/mng46ivz73rizldd3h4rx9dv3nw6jhkz-nixos-system-jack-24.05.20240709.249fbde/init
    console=ttyS0,115200 console=tty0 console=ttyS1,115200n8 console=tty1 hugepagesz=1GB
    hugepages=0 hugepagesz=2MB hugepages=1000 nohibernate loglevel=4
    nvidia.NVreg_OpenRmEnableUnsupportedGpus=1
  Console: N/A Distro: NixOS 24.05 (Uakari)
Machine:
  Type: Kvm System: Supermicro product: SYS-120U-TNR v: 0123456789 serial: E411764X2300334 Chassis:
    type: 1 v: 0123456789 serial: C119UAK12P20190
  Mobo: Supermicro model: X12DPU-6 v: 1.02A serial: HM218S018239
    uuid: 36a0aa00-1080-11ec-8000-3ceceffb5c78 UEFI: American Megatrends LLC. v: 1.2 date: 02/15/2022
Memory:
  System RAM: total: 2.12 TiB available: 125.5 GiB used: 70.05 GiB (55.8%)
  Array-1: capacity: 12 TiB slots: 32 modules: 16 EC: Single-bit ECC max-module-size: 384 GiB
    note: est.
  Device-1: P1-DIMMA1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553 serial: 214400000DE6
  Device-2: P1-DIMMA2 type: no module installed
  Device-3: P1-DIMMB1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836234FBF
  Device-4: P1-DIMMB2 type: no module installed
  Device-5: P1-DIMMC1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553 serial: 214400000F3B
  Device-6: P1-DIMMC2 type: no module installed
  Device-7: P1-DIMMD1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836234FBE
  Device-8: P1-DIMMD2 type: no module installed
  Device-9: P1-DIMME1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553 serial: 214400000CE1
  Device-10: P1-DIMME2 type: no module installed
  Device-11: P1-DIMMF1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836235013
  Device-12: P1-DIMMF2 type: no module installed
  Device-13: P1-DIMMG1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553 serial: 214400000CDD
  Device-14: P1-DIMMG2 type: no module installed
  Device-15: P1-DIMMH1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836235007
  Device-16: P1-DIMMH2 type: no module installed
  Device-17: P2-DIMMA1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553 serial: 214400000FD1
  Device-18: P2-DIMMA2 type: no module installed
  Device-19: P2-DIMMB1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836235011
  Device-20: P2-DIMMB2 type: no module installed
  Device-21: P2-DIMMC1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553 serial: 214400000EAF
  Device-22: P2-DIMMC2 type: no module installed
  Device-23: P2-DIMMD1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836234FC4
  Device-24: P2-DIMMD2 type: no module installed
  Device-25: P2-DIMME1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553 serial: 214400000EAE
  Device-26: P2-DIMME2 type: no module installed
  Device-27: P2-DIMMF1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012148362350AF
  Device-28: P2-DIMMF2 type: no module installed
  Device-29: P2-DIMMG1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553 serial: 214400000FF1
  Device-30: P2-DIMMG2 type: no module installed
  Device-31: P2-DIMMH1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836234FBD
  Device-32: P2-DIMMH2 type: no module installed
PCI Slots:
  Slot: 1 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: ca:00.0
  Slot: 2 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: ff:00.0
  Slot: 1 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: ff:00.0
  Slot: N/A type: N/A status: in use length: other volts: 3.3 bus-ID: 19:00.0
  Slot: 1 type: PCIe gen: 4 status: available length: long volts: 3.3 bus-ID: ff:00.0
CPU:
  Info: model: Intel Xeon Gold 6326 socket: LGA4189 bits: 64 type: MT MCP SMP arch: Ice Lake
    level: v4 note: check built: 2019-21 process: Intel 10nm family: 6 model-id: 0x6A (106)
    stepping: 6 microcode: 0xD0003D1
  Topology: cpus: 2x cores: 16 tpc: 2 threads: 32 smt: enabled cache: L1: 2x 1.2 MiB (2.5 MiB)
    desc: d-16x48 KiB; i-16x32 KiB L2: 2x 20 MiB (40 MiB) desc: 16x1.2 MiB L3: 2x 24 MiB (48 MiB)
    desc: 1x24 MiB
  Speed (MHz): avg: 1089 high: 2900 min/max: 800/3500 base/boost: 2900/4500 scaling:
    driver: intel_cpufreq governor: schedutil volts: 1.6 V ext-clock: 100 MHz cores: 1: 800 2: 800
    3: 800 4: 800 5: 800 6: 800 7: 800 8: 800 9: 2200 10: 800 11: 2000 12: 800 13: 800 14: 800
    15: 800 16: 800 17: 800 18: 800 19: 2200 20: 800 21: 800 22: 800 23: 800 24: 800 25: 2900
    26: 800 27: 2200 28: 800 29: 800 30: 2400 31: 800 32: 2200 33: 800 34: 800 35: 800 36: 800
    37: 1800 38: 800 39: 800 40: 800 41: 800 42: 800 43: 800 44: 800 45: 800 46: 800 47: 800
    48: 800 49: 800 50: 2200 51: 1800 52: 800 53: 2200 54: 800 55: 800 56: 800 57: 2600 58: 2200
    59: 800 60: 800 61: 799 62: 800 63: 800 64: 800 bogomips: 371200
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
  Vulnerabilities:
  Type: gather_data_sampling mitigation: Microcode
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow status: Not affected
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Enhanced / Automatic IBRS; IBPB: conditional; RSB filling;
    PBRSB-eIBRS: SW sequence; BHI: SW loop, KVM: SW loop
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: Virtual-1 bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Device-2: NVIDIA GA102GL [A40] driver: nvidia v: 550.78 alternate: nvidiafb,nouveau,nvidia_drm
    non-free: 550.xx+ status: current (as of 2024-04; EOL~2026-12-xx) arch: Ampere code: GAxxx
    process: TSMC n7 (7nm) built: 2020-2023 pcie: gen: 4 speed: 16 GT/s lanes: 16 bus-ID: ca:00.0
    chip-ID: 10de:2235 class-ID: 0302
  Display: server: No display server data found. Headless machine? tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL v: 1.5 hw: drv: nvidia platforms: device: egl egl: N/A drv: N/A gbm: drv: N/A
    inactive: wayland,x11
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
Network:
  Device-1: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 19:00.0 chip-ID: 8086:15ff class-ID: 0200
  IF: enp25s0f0 state: down mac: 3c:ec:ef:fb:5c:78
  Device-2: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 19:00.1 chip-ID: 8086:15ff class-ID: 0200
  IF: enp25s0f1 state: down mac: 3c:ec:ef:fb:5c:79
  Device-3: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 19:00.2 chip-ID: 8086:104e class-ID: 0200
  IF: enp25s0f2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:fb:5c:7a
  IP v4: 131.159.102.17/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::17/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::3eec:efff:fefb:5c7a/64 virtual: proto kernel_ll scope: link
  Device-4: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 19:00.3 chip-ID: 8086:104e class-ID: 0200
  IF: enp25s0f3 state: down mac: 3c:ec:ef:fb:5c:7b
  IF-ID-1: br-bf09f619aa5c state: up speed: 10000 Mbps duplex: unknown mac: 02:42:0b:af:1a:b4
  IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255
  IP v6: fe80::42:bff:feaf:1ab4/64 virtual: proto kernel_ll scope: link
  IF-ID-2: docker0 state: down mac: 02:42:81:6e:e5:2f
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IP v6: fe80::42:81ff:fe6e:e52f/64 virtual: proto kernel_ll scope: link
  IF-ID-3: enp0s20f0u7u2c2 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-4: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:43ea:3161:1159:e7e6:ff78/16 scope: global
  IF-ID-5: vethd0adc13 state: up speed: 10000 Mbps duplex: full mac: 26:08:a3:72:e5:7d
  Info: services: nginx, sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.17
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 1-7.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 888 GiB free: 379 GiB
    allocated: 509 GiB zfs-fs: size: 860.5 GiB free: 351.73 GiB
  Components: Online:
  1: sda2 maj-min: 8:2 size: 893.25 GiB
Drives:
  Local Storage: total: raw: 894.25 GiB usable: 861.5 GiB used: 358.49 GiB (41.6%)
  ID-1: /dev/sda maj-min: 8:0 vendor: Intel model: SSDSC2KB960G8 family: S4510/S4610/S4500/S4600
    Series SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B sata: 3.2
    speed: 6.0 Gb/s tech: SSD serial: PHYF152302UG960CGN fw-rev: 0132 temp: 31 C scheme: GPT
  SMART: yes state: enabled health: PASSED on: 2y 80d 23h cycles: 30 read: 37.28 TiB
    written: 25.59 TiB
Partition:
  ID-1: / raw-size: N/A size: 664.09 GiB used: 312.36 GiB (47.0%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 71.9 MiB (7.0%) fs: vfat
    block-size: 512 B dev: /dev/sda1 maj-min: 8:1
  ID-3: /home raw-size: N/A size: 3.02 TiB used: 1.3 TiB (43.1%) fs: nfs4
    remote: nfs:/export/home
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu-1: 48 C cpu-2: 59 C mobo: 33 C
  Fan Speeds (rpm): cpu: 8680 fan-2: 8820 fan-3: 8820 fan-4: 8680 fan-5: 12740 fan-6: 12600
    fan-7: 12740 fan-8: 12600
  Power: 12v: 12.186 5v: 4.927 3.3v: 3.311 vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 58.0 C pch: 51.0 C mobo: N/A gpu: nvidia temp: 65 C
  Fan Speeds (rpm): N/A
Info:
  Processes: 983 Power: uptime: 18d 3h 9m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 50.19 GiB Init: systemd v: 255 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 594 libs: 136 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.2.0 Client: Sudo v: 1.9.15p5 inxi: 3.3.34
```
![hardware topology](jack.lstopo.svg)
