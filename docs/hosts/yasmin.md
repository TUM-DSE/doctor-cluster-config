# yasmin

```
System:
  Host: yasmin Kernel: 6.12.12 arch: aarch64 bits: 64 compiler: gcc v: 13.3.0
    clocksource: arch_sys_counter
    parameters: BOOT_IMAGE=(hd3,gpt1)//kernels/lpr3ykyd9rlajnki1aq5h3njfdxha9d2-linux-6.12.12-Image
    init=/nix/store/m4ayg1cciarbzzy4r2kai62xk7fjysxd-nixos-system-yasmin-24.11.20250209.392aa11/init
    console=ttyS0,115200 console=ttyAMA0,115200 console=tty0 console=ttyS0,115200n8
    console=ttyAMA0,115200n8 console=tty0 nohibernate loglevel=4
  Console: N/A Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Server System: GIGABYTE product: R181-T90-00 v: 0100 serial: GLG4NN012A0002 Chassis:
    type: 23 v: 1.0 serial: 01234567890123456789AB
  Mobo: GIGABYTE model: MT91-FS1-00 v: 00030101 serial: JH6N6700014 part-nu: SABER SKU
    uuid: 00000000-0000-0040-8000-b42e993f747c UEFI: GIGABYTE v: F34 date: 08/13/2020
Memory:
  System RAM: total: 256 GiB available: 251.23 GiB used: 132.35 GiB (52.7%)
  Report: arrays: 2 capacity: 4 TiB installed: 256 GiB slots: 24 active: 4 type: DDR4
    eec: Multi-bit ECC
  Array-1: capacity: 2 TiB installed: 128 GiB slots: 12 modules: 2 EC: Multi-bit ECC
    max-module-size: 170.67 GiB note: est.
  Device-1: DIMM_P0_A0 type: DDR4 detail: registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: 1158043522
  Device-2: DIMM_P0_B0 type: DDR4 detail: registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: 1158043450
  Array-2: capacity: 2 TiB installed: 128 GiB slots: 12 modules: 2 EC: Multi-bit ECC
    max-module-size: 170.67 GiB note: est.
  Device-1: DIMM_P1_I0 type: DDR4 detail: registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: 1158043569
  Device-2: DIMM_P1_J0 type: DDR4 detail: registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2666 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: 27077680
PCI Slots:
  Slot: 0 type: PCIe gen: 3 status: available length: short volts: 3.3 bus-ID: 01:00.0
  Slot: 4 type: PCIe gen: 3 status: available length: short volts: 3.3 bus-ID: 05:00.0
  Slot: 6 type: PCIe gen: 3 status: in use length: short volts: 3.3 bus-ID: 07:00.0
  Slot: 7 type: PCIe gen: 3 status: available length: short volts: 3.3 bus-ID: 08:00.0
  Slot: 8 type: PCIe gen: 3 status: available length: short volts: 3.3 bus-ID: 09:00.0
  Slot: 10 type: PCIe gen: 3 status: in use length: short volts: 3.3 bus-ID: 0b:00.0
  Slot: 12 type: PCIe gen: 3 status: in use length: short volts: 3.3 bus-ID: 0f:00.0
  Slot: 14 type: PCIe gen: 3 status: available length: long volts: 3.3 bus-ID: 81:00.0
  Slot: 18 type: PCIe gen: 3 status: available length: long volts: 3.3 bus-ID: 91:00.0
  Slot: 26 type: PCIe gen: 3 status: available length: short volts: 3.3 bus-ID: 99:00.0
  Slot: 22 type: PCIe gen: 3 status: available length: long volts: 3.3 bus-ID: 95:00.0
CPU:
  Info: model: N/A bits: 64 type: MT MCP SMP arch: ARMv8 family: 8 model-id: 1 stepping: 2
  Topology: cpus: 2x cores: 28 tpc: 4 threads: 112 smt: enabled cache: L1: 2x 1.8 MiB (3.5 MiB)
    desc: d-28x32 KiB; i-28x32 KiB L2: 2x 7 MiB (14 MiB) desc: 28x256 KiB L3: 2x 32 MiB (64 MiB)
    desc: 1x32 MiB
  Speed: N/A min/max: N/A base/boost: 2000/2500 volts: 0.8 V ext-clock: 33 MHz cores: No per
    core speed data found. bogomips: 89600
  Features: Use -f option to see features
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow status: Not affected
  Type: spec_store_bypass status: Vulnerable
  Type: spectre_v1 mitigation: __user pointer sanitization
  Type: spectre_v2 status: Vulnerable
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family driver: ast v: kernel ports: active: VGA-1 empty: none
    bus-ID: 0e:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: server: No display server data found. Headless machine? tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
  API: ALSA v: k6.12.12 status: kernel-api tools: N/A
Network:
  Device-1: QLogic FastLinQ QL41000 Series 10/25/40/50GbE vendor: Gigabyte driver: qede v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 4 link-max: lanes: 8 port: N/A bus-ID: 0b:00.0
    chip-ID: 1077:8070 class-ID: 0200
  IF: eno1 state: up speed: 10000 Mbps duplex: full mac: b4:2e:99:3f:74:7c
  IP v4: 131.159.102.7/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::7/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::b62e:99ff:fe3f:747c/64 virtual: proto kernel_ll scope: link
  Device-2: QLogic FastLinQ QL41000 Series 10/25/40/50GbE vendor: Gigabyte driver: qede v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 4 link-max: lanes: 8 port: N/A bus-ID: 0b:00.1
    chip-ID: 1077:8070 class-ID: 0200
  IF: eno1 state: up speed: 10000 Mbps duplex: full mac: b4:2e:99:3f:74:7c
  IP v4: 131.159.102.7/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::7/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::b62e:99ff:fe3f:747c/64 virtual: proto kernel_ll scope: link
  Device-3: American Megatrends Virtual Ethernet driver: cdc_ether type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 3-1.3:5 chip-ID: 046b:ffb0 class-ID: 0a00
    serial: 1234567890
  IF: enp0s15f1u1u3c2 state: unknown speed: -1 duplex: half mac: 16:d4:72:2c:21:77
  IP v4: 169.254.252.174/16 scope: link
  IP v6: fe80::14d4:72ff:fe2c:2177/64 virtual: proto kernel_ll scope: link
  IF-ID-1: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:6a:d1:26:0b
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IP v6: fe80::42:6aff:fed1:260b/64 virtual: proto kernel_ll scope: link
  IF-ID-2: eno2 state: down mac: b4:2e:99:3f:74:7d
  IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:9b18:d5e7:d945:ccf8:829e/16 scope: global
  IF-ID-4: veth1bbe4a0 state: up speed: 10000 Mbps duplex: full mac: f2:68:b9:13:f4:f0
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.7
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 888 GiB free: 244 GiB
    allocated: 644 GiB zfs-fs: size: 860.5 GiB free: 215.56 GiB
  Components: Online:
  1: sdb2 maj-min: 8:18 size: 893.76 GiB
Drives:
  Local Storage: total: raw: 1.78 TiB usable: 1.75 TiB used: 512.71 GiB (28.6%)
  ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: SSD 970 EVO Plus 1TB size: 931.51 GiB
    block-size: physical: 512 B logical: 512 B speed: 31.6 Gb/s lanes: 4 tech: SSD
    serial: S4EWNX0R514087T fw-rev: 2B2QEXM7 temp: 34.9 C
  SMART: yes health: PASSED on: 68d 18h cycles: 8 read-units: 877 [449 MB]
    written-units: 562,585 [288 GB]
  ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ7LH960HAJR-00005 family: based SSDs
    size: 894.25 GiB block-size: physical: 4096 B logical: 512 B sata: 3.2 speed: 6.0 Gb/s tech: SSD
    serial: S45NNC0R216725 fw-rev: 904Q temp: 27 C scheme: GPT
  SMART: yes state: enabled health: PASSED on: 3y 209d 7h cycles: 23 read: 35.63 TiB
    written: 77.04 TiB
Partition:
  ID-1: / raw-size: N/A size: 462.08 GiB used: 246.52 GiB (53.3%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 91.4 MiB (18.3%) fs: vfat
    block-size: 512 B dev: /dev/sdb1 maj-min: 8:17
  ID-3: /home raw-size: N/A size: 2.71 TiB used: 1.98 TiB (73.1%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 215.57 GiB used: 7.8 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu-1: 44 C cpu-2: 43 C mobo: 30 C
  Fan Speeds (rpm): N/A
  Power: 12v: 12.545 5v: N/A 3.3v: N/A vbat: 3.074 dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors+/sys Message: No sensor data found using /sys/class/hwmon or lm-sensors.
Info:
  Processes: 2438 Power: uptime: 3d 23h 0m states: freeze,mem suspend: deep avail: s2idle
    wakeups: 0 hibernate: disabled image: 100.47 GiB Init: systemd v: 256 default: multi-user
    tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 559 libs: 125 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](yasmin.lstopo.svg)
