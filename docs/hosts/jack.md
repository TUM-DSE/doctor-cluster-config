# jack

```
System:
  Host: jack Kernel: 6.16.9 arch: x86_64 bits: 64 compiler: gcc v: 14.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\msl6smz553b0d75mfaqv23h92i3rsw4c-initrd-linux-6.16.9-initrd.efi
    init=/nix/store/iw4ky3ks9z67n7s8fgnn23dkb4h277bf-nixos-system-jack-25.05.20250930.51fcc5b/init
    intel_iommu=on console=ttyS1,115200n8 console=tty1 console=ttyS0,115200 console=tty0
    hugepagesz=1GB hugepages=0 hugepagesz=2MB hugepages=1000 nohibernate loglevel=4
    lsm=landlock,yama,bpf nvidia-drm.modeset=1 nvidia-drm.fbdev=1
    nvidia.NVreg_OpenRmEnableUnsupportedGpus=1
  Console: N/A Distro: NixOS 25.05 (Warbler)
Machine:
  Type: Kvm System: Supermicro product: SYS-120U-TNR v: 0123456789 serial: E411764X2300334 Chassis:
    type: 1 v: 0123456789 serial: C119UAK12P20190
  Mobo: Supermicro model: X12DPU-6 v: 1.02A serial: HM218S018239
    uuid: 36a0aa00-1080-11ec-8000-3ceceffb5c78 UEFI: American Megatrends LLC. v: 1.2 date: 02/15/2022
Memory:
  System RAM: total: 320 GiB available: 314.25 GiB used: 223.89 GiB (71.2%)
  Array-1: capacity: 12 TiB note: check slots: 32 modules: 20 EC: Single-bit ECC
    max-module-size: 384 GiB note: est.
  Device-1: P1-DIMMA1 type: no module installed
  Device-2: P1-DIMMA2 type: no module installed
  Device-3: P1-DIMMB1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836234FBF
  Device-4: P1-DIMMB2 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836234FBD
  Device-5: P1-DIMMC1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012217369684C9
  Device-6: P1-DIMMC2 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012217369684C8
  Device-7: P1-DIMMD1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012217369684CB
  Device-8: P1-DIMMD2 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012148362350AF
  Device-9: P1-DIMME1 type: no module installed
  Device-10: P1-DIMME2 type: no module installed
  Device-11: P1-DIMMF1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD0122173696849F
  Device-12: P1-DIMMF2 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836235013
  Device-13: P1-DIMMG1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012217369684A3
  Device-14: P1-DIMMG2 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012217369684A1
  Device-15: P1-DIMMH1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836235007
  Device-16: P1-DIMMH2 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012217369690EE
  Device-17: P2-DIMMA1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012217369684F8
  Device-18: P2-DIMMA2 type: no module installed
  Device-19: P2-DIMMB1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD0122173696849E
  Device-20: P2-DIMMB2 type: no module installed
  Device-21: P2-DIMMC1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836234FC4
  Device-22: P2-DIMMC2 type: no module installed
  Device-23: P2-DIMMD1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01221736969091
  Device-24: P2-DIMMD2 type: no module installed
  Device-25: P2-DIMME1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD0122173696902B
  Device-26: P2-DIMME2 type: no module installed
  Device-27: P2-DIMMF1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836234FBE
  Device-28: P2-DIMMF2 type: no module installed
  Device-29: P2-DIMMG1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD012217369684A2
  Device-30: P2-DIMMG2 type: no module installed
  Device-31: P2-DIMMH1 type: DDR4 detail: synchronous registered (buffered) size: 16 GiB
    speed: 3200 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64 total: 72
    manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN firmware: 0000 serial: 80AD01214836235011
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
    stepping: 6 microcode: 0xD000410
  Topology: cpus: 2x dies: 1 clusters: 16 cores: 16 threads: 32 tpc: 2 smt: enabled cache:
    L1: 2x 1.2 MiB (2.5 MiB) desc: d-16x48 KiB; i-16x32 KiB L2: 2x 20 MiB (40 MiB) desc: 16x1.2 MiB
    L3: 2x 24 MiB (48 MiB) desc: 1x24 MiB
  Speed (MHz): avg: 800 min/max: 800/3500 base/boost: 2900/4500 scaling: driver: intel_cpufreq
    governor: schedutil volts: 1.6 V ext-clock: 100 MHz cores: 1: 800 2: 800 3: 800 4: 800 5: 800
    6: 800 7: 800 8: 800 9: 800 10: 800 11: 800 12: 800 13: 800 14: 800 15: 800 16: 800 17: 800
    18: 800 19: 800 20: 800 21: 800 22: 800 23: 800 24: 800 25: 800 26: 800 27: 800 28: 800 29: 800
    30: 800 31: 800 32: 800 33: 800 34: 800 35: 800 36: 800 37: 800 38: 800 39: 800 40: 800 41: 800
    42: 800 43: 800 44: 800 45: 800 46: 800 47: 800 48: 800 49: 800 50: 800 51: 800 52: 800 53: 800
    54: 800 55: 800 56: 800 57: 800 58: 800 59: 800 60: 800 61: 800 62: 800 63: 800 64: 800
    bogomips: 371200
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
  Vulnerabilities:
  Type: gather_data_sampling mitigation: Microcode
  Type: ghostwrite status: Not affected
  Type: indirect_target_selection mitigation: Aligned branch/return thunks
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable
  Type: old_microcode status: Not affected
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow status: Not affected
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Enhanced / Automatic IBRS; IBPB: conditional; PBRSB-eIBRS: SW
    sequence; BHI: SW loop, KVM: SW loop
  Type: srbds status: Not affected
  Type: tsa status: Not affected
  Type: tsx_async_abort status: Not affected
  Type: vmscape status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: none bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Device-2: NVIDIA GA102GL [A40] driver: nvidia v: 580.82.09
    alternate: nvidiafb,nouveau,nvidia_drm non-free: 550-570.xx+ status: current (as of 2025-04;
    EOL~2026-12-xx) arch: Ampere code: GAxxx process: TSMC n7 (7nm) built: 2020-2023 pcie: gen: 1
    speed: 2.5 GT/s lanes: 16 link-max: gen: 4 speed: 16 GT/s bus-ID: ca:00.0 chip-ID: 10de:2235
    class-ID: 0302
  Display: unspecified server: N/A driver: gpu: ast tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL v: 1.5 hw: drv: nvidia nouveau drv: nvidia platforms: device: 0 drv: nvidia device: 1
    drv: nouveau device: 2 drv: swrast gbm: drv: nvidia surfaceless: drv: nvidia
    inactive: wayland,x11
  API: OpenGL v: 4.6.0 compat-v: 4.5 vendor: mesa v: 25.0.7 note: console (EGL sourced)
    renderer: NVIDIA A40/PCIe/SSE2, zink Vulkan 1.4(NVIDIA A40 (NVIDIA_PROPRIETARY)), llvmpipe (LLVM
    19.1.7 256 bits)
  Info: Tools: api: eglinfo,glxinfo gpu: nvidia-settings,nvidia-smi x11: xdpyinfo, xprop, xrandr
Audio:
  Message: No device data found.
Network:
  Device-1: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 19:00.0 chip-ID: 8086:15ff class-ID: 0200
  IF: enp25s0f0np0 state: down mac: 3c:ec:ef:fb:5c:78
  Device-2: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel pcie:
    gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 19:00.1 chip-ID: 8086:15ff class-ID: 0200
  IF: enp25s0f1np1 state: down mac: 3c:ec:ef:fb:5c:79
  Device-3: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 19:00.2 chip-ID: 8086:104e class-ID: 0200
  IF: enp25s0f2np2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:fb:5c:7a
  IP v4: 131.159.102.17/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::17/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::3eec:efff:fefb:5c7a/64 virtual: proto kernel_ll scope: link
  Device-4: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 19:00.3 chip-ID: 8086:104e class-ID: 0200
  IF: enp25s0f3np3 state: down mac: 3c:ec:ef:fb:5c:7b
  IF-ID-1: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:fe:4a:33:bb
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IP v6: fe80::42:feff:fe4a:33bb/64 virtual: proto kernel_ll scope: link
  IF-ID-2: enp0s20f0u7u2c2 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:43ea:3161:1159:e7e6:ff78/16 scope: global
  IF-ID-4: vethf006bca state: up speed: 10000 Mbps duplex: full mac: aa:09:20:00:44:12
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.17
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 1-7.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 888 GiB free: 168 GiB
    allocated: 720 GiB zfs-fs: size: 860.5 GiB free: 140.49 GiB
  Components: Online:
  1: sda2 maj-min: 8:2 size: 893.25 GiB
Drives:
  Local Storage: total: raw: 894.25 GiB usable: 861.5 GiB used: 205.23 GiB (23.8%)
  ID-1: /dev/sda maj-min: 8:0 vendor: Intel model: SSDSC2KB960G8 family: Solidigm S46x0/S45x0
    Series SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B sata: 3.2
    speed: 6.0 Gb/s tech: SSD serial: PHYF152302UG960CGN fw-rev: 0132 temp: 23 C scheme: GPT
  SMART: yes state: enabled health: PASSED on: 3y 170d 20h cycles: 48 read: 48.13 TiB
    written: 53.53 TiB
Partition:
  ID-1: / raw-size: N/A size: 340.86 GiB used: 200.37 GiB (58.8%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 44.4 MiB (4.3%) fs: vfat
    block-size: 512 B dev: /dev/sda1 maj-min: 8:1
  ID-3: /home raw-size: N/A size: 3.43 TiB used: 1.61 TiB (47.0%) fs: nfs4
    remote: nfs:/export/home
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu-1: 50 C cpu-2: 59 C mobo: 25 C
  Fan Speeds (rpm): cpu: 7140 fan-2: 7140 fan-3: 7140 fan-4: 7140 fan-5: 7980 fan-6: 7980
    fan-7: 7980 fan-8: 7980
  Power: 12v: 12.186 5v: 4.927 3.3v: 3.311 vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 56.0 C pch: 49.0 C mobo: N/A gpu: nvidia temp: 42 C
  Fan Speeds (rpm): N/A
Info:
  Processes: 935 Power: uptime: 23d 9h 48m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 125.68 GiB Init: systemd v: 257 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 610 libs: 138 pm: nix-usr pkgs: 0
    Compilers: gcc: 14.3.0 Client: Sudo v: 1.9.17p2 inxi: 3.3.38
```
![hardware topology](jack.lstopo.svg)
