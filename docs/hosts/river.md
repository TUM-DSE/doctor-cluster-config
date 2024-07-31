# river

```
System:
  Host: river Kernel: 5.15.84 arch: x86_64 bits: 64 compiler: gcc v: 13.2.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\w6x5z1zscnvww8vbkyi45ar1b5a8ihax-initrd-linux-5.15-initrd.efi
    init=/nix/store/w967hyfjgvajrsci6cbpgcsai1vw3762-nixos-system-river-24.05.20240709.249fbde/init
    console=ttyS0,115200 console=tty0 intel_iommu=on console=ttyS1,115200n8 console=tty1
    hugepagesz=1GB hugepages=8 hugepagesz=2MB hugepages=51200 nohibernate loglevel=4
  Console: N/A Distro: NixOS 24.05 (Uakari)
Machine:
  Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 serial: E424030X2100639 Chassis:
    type: 1 v: 0123456789 serial: C1160LK21P50425
  Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002408
    uuid: 00000000-0000-0000-0000-3cecef62ac56 UEFI: American Megatrends LLC. v: 1.1c
    date: 11/08/2021
Memory:
  System RAM: total: 1.25 TiB available: 251.21 GiB used: 121.6 GiB (48.4%)
  Array-1: capacity: 12 TiB note: check slots: 8 modules: 8 EC: Single-bit ECC
    max-module-size: 1.50 TiB note: est.
  Device-1: DIMMA1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE firmware: 0000
    serial: H1KX00014148249F17
  Device-2: DIMMB1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2
    width (bits): data: 64 total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553
    serial: 214400000EF2
  Device-3: DIMMC1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE firmware: 0000
    serial: H1KX00014148249FDC
  Device-4: DIMMD1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2
    width (bits): data: 64 total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553
    serial: 214400000E7F
  Device-5: DIMME1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE firmware: 0000
    serial: H1KX00014148249F1D
  Device-6: DIMMF1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2
    width (bits): data: 64 total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553
    serial: 214400000D60
  Device-7: DIMMG1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE firmware: 0000
    serial: H1KX00014148249FDA
  Device-8: DIMMH1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2
    width (bits): data: 64 total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553
    serial: 214400000F08
PCI Slots:
  Slot: N/A type: N/A status: available info: M.2 length: short volts: 3.3 bus-ID: ff:00.0
  Slot: 1 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: 8a:00.0
  Slot: 2 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: 51:00.0
  Slot: 1 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: 18:00.0
CPU:
  Info: model: Intel Xeon Gold 5317 socket: LGA4189 bits: 64 type: MT MCP arch: Ice Lake level: v4
    note: check built: 2019-21 process: Intel 10nm family: 6 model-id: 0x6A (106) stepping: 6
    microcode: 0xD0003D1
  Topology: cpus: 1x cores: 12 tpc: 2 threads: 24 smt: enabled cache: L1: 960 KiB desc: d-12x48
    KiB; i-12x32 KiB L2: 15 MiB desc: 12x1.2 MiB L3: 18 MiB desc: 1x18 MiB
  Speed (MHz): avg: 988 high: 2602 min/max: 800/3600 base/boost: 3000/4500 scaling:
    driver: intel_cpufreq governor: schedutil volts: 1.6 V ext-clock: 100 MHz cores: 1: 801 2: 2602
    3: 801 4: 801 5: 801 6: 800 7: 801 8: 801 9: 2310 10: 801 11: 801 12: 1706 13: 801 14: 1080
    15: 801 16: 801 17: 801 18: 800 19: 800 20: 801 21: 801 22: 801 23: 801 24: 801
    bogomips: 144000
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
  Vulnerabilities:
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable
  Type: retbleed status: Not affected
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl and seccomp
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Enhanced IBRS, IBPB: conditional, RSB filling, PBRSB-eIBRS: SW
    sequence
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel ports: active: VGA-1
    empty: none bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300
  Display: server: No display server data found. Headless machine? tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
Network:
  Device-1: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel pcie: gen: 3
    speed: 8 GT/s lanes: 4 port: N/A bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200
  IF: eno1 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ac:56
  IP v4: 169.254.10.88/16 scope: link
  IP v6: fe80::3eec:efff:fe62:ac56/64 scope: link
  Device-2: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel pcie: gen: 3
    speed: 8 GT/s lanes: 4 port: N/A bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200
  IF: eno2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ac:57
  IP v4: 169.254.227.211/16 scope: link
  IP v6: fe80::3eec:efff:fe62:ac57/64 scope: link
  Device-3: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel pcie: gen: 2
    speed: 5 GT/s lanes: 8 port: 7020 bus-ID: 18:00.0 chip-ID: 8086:10fb class-ID: 0200
  IF: enp24s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:82:d8
  IP v4: 131.159.102.16/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::16/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::21b:21ff:fec3:82d8/64 scope: link
  Device-4: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel pcie: gen: 2
    speed: 5 GT/s lanes: 8 port: 7000 bus-ID: 18:00.1 chip-ID: 8086:10fb class-ID: 0200
  IF: enp24s0f1 state: down mac: 00:1b:21:c3:82:da
  Device-5: Intel Ethernet E810-C for QSFP driver: N/A modules: ice pcie: gen: 4 speed: 16 GT/s
    lanes: 16 port: N/A bus-ID: 51:00.0 chip-ID: 8086:1592 class-ID: 0200
  IF-ID-1: docker0 state: down mac: 02:42:eb:8a:d8:94
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:f7cf:5f5a:8ed8:f139:be6d/16 scope: global
  IF-ID-3: usb0 state: unknown speed: -1 duplex: half mac: 7a:38:1e:58:99:0d
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::7838:1eff:fe58:990d/64 scope: link
  Info: services: mld, sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.16
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas v: 07.717.02.00-rc1
    port: d000 bus-ID: 8a:00.0 chip-ID: 1000:0017 rev: N/A class-ID: 0104
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 1.46 TiB
    allocated: 284 GiB zfs-fs: size: 1.68 TiB free: 1.4 TiB
  Components: Online:
  1: sda2 maj-min: 8:2 size: 1.75 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.43 TiB used: 283.55 GiB (8.1%)
  ID-1: /dev/sda maj-min: 8:0 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size:
    physical: 512 B logical: 512 B speed: <unknown> tech: SSD serial: N/A fw-rev: 102Q temp: 38 C
    scheme: GPT
  SMART: yes state: enabled
  ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size:
    physical: 512 B logical: 512 B speed: <unknown> tech: SSD serial: N/A fw-rev: 102Q temp: 37 C
  SMART: yes state: enabled
Partition:
  ID-1: / raw-size: N/A size: 1.68 TiB used: 283.48 GiB (16.5%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 67.7 MiB (6.6%) fs: vfat
    block-size: 512 B dev: /dev/sda1 maj-min: 8:1
  ID-3: /home raw-size: N/A size: 3.02 TiB used: 1.3 TiB (43.1%) fs: nfs4
    remote: nfs:/export/home
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: 36 C mobo: 31 C
  Fan Speeds (rpm): cpu: 12180 fan-2: 12180 fan-3: 12180 fan-4: 12180 fan-5: 12180 fan-6: 12180
  Power: 12v: 11.508 5v: 4.958 3.3v: 3.299 vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 34.0 C pch: 44.0 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 438 Power: uptime: 3d 14h 46m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 97.27 GiB Init: systemd v: 255 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 583 libs: 133 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.2.0 Client: Sudo v: 1.9.15p5 inxi: 3.3.34
```
![hardware topology](river.lstopo.svg)
