# jackson

```
System:
  Host: jackson Kernel: 6.12.10 arch: x86_64 bits: 64 compiler: gcc v: 13.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\21v2k2xxmvar31hqx54ccgmzgsy3b7kw-initrd-linux-6.12.10-initrd.efi
    init=/nix/store/bam0n24vllm8lf94l1858bvp8hqhj15b-nixos-system-jackson-24.11.20250120.643e964/init
    intel_iommu=on console=ttyS1,115200n8 console=tty1 console=ttyS0,115200 console=tty0
    hugepagesz=1GB hugepages=8 hugepagesz=2MB hugepages=1000 nohibernate loglevel=4
  Console: N/A Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 serial: E424030X2100679 Chassis:
    type: 1 v: 0123456789 serial: C1160LK21P50442
  Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002384
    uuid: 00000000-0000-0000-0000-3cecef62ac26 UEFI: American Megatrends LLC. v: 1.1c
    date: 11/08/2021
Memory:
  System RAM: total: 1.25 TiB available: 251.2 GiB used: 37.65 GiB (15.0%)
  Array-1: capacity: 12 TiB note: check slots: 8 modules: 8 EC: Single-bit ECC
    max-module-size: 1.50 TiB note: est.
  Device-1: DIMMA1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE firmware: 0000
    serial: H1KX00014148249F76
  Device-2: DIMMB1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2
    width (bits): data: 64 total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553
    serial: 214400000F14
  Device-3: DIMMC1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE firmware: 0000
    serial: H1KX00014148249FB7
  Device-4: DIMMD1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2
    width (bits): data: 64 total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553
    serial: 214400000FD6
  Device-5: DIMME1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE firmware: 0000
    serial: H1KX00014148249EF7
  Device-6: DIMMF1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2
    width (bits): data: 64 total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553
    serial: 214400000F18
  Device-7: DIMMG1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: Samsung part-no: M393A8G40AB2-CWE firmware: 0000
    serial: H1KX00014148249FB9
  Device-8: DIMMH1 type: Logical non-volatile device detail: synchronous non-volatile lrdimm
    size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2
    width (bits): data: 64 total: 72 manufacturer: Intel part-no: NMB1XXD256GPS firmware: 1553
    serial: 214400000E15
PCI Slots:
  Slot: N/A type: N/A status: available info: M.2 length: short volts: 3.3 bus-ID: ff:00.0
  Slot: 1 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: 8a:00.0
  Slot: 2 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: 51:00.0
  Slot: 1 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: 18:00.0
CPU:
  Info: model: Intel Xeon Gold 5317 socket: LGA4189 bits: 64 type: MT MCP arch: Ice Lake level: v4
    note: check built: 2019-21 process: Intel 10nm family: 6 model-id: 0x6A (106) stepping: 6
    microcode: 0xD0003E7
  Topology: cpus: 1x cores: 12 tpc: 2 threads: 24 smt: enabled cache: L1: 960 KiB desc: d-12x48
    KiB; i-12x32 KiB L2: 15 MiB desc: 12x1.2 MiB L3: 18 MiB desc: 1x18 MiB
  Speed (MHz): avg: 2866 high: 3000 min/max: 800/3000 base/boost: 3000/4500 scaling:
    driver: intel_cpufreq governor: schedutil volts: 1.6 V ext-clock: 100 MHz cores: 1: 3000 2: 3000
    3: 3000 4: 3000 5: 3000 6: 3000 7: 3000 8: 3000 9: 3000 10: 3000 11: 3000 12: 3000 13: 3000
    14: 2216 15: 3000 16: 3000 17: 3000 18: 1374 19: 3000 20: 3000 21: 3000 22: 3000 23: 2210
    24: 3000 bogomips: 144000
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
  IF: eno1 state: down mac: 3c:ec:ef:62:ac:26
  Device-2: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel pcie: gen: 3
    speed: 8 GT/s lanes: 4 port: N/A bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200
  IF: eno2 state: down mac: 3c:ec:ef:62:ac:27
  Device-3: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel pcie: gen: 2
    speed: 5 GT/s lanes: 8 port: 7020 bus-ID: 18:00.0 chip-ID: 8086:10fb class-ID: 0200
  IF: enp24s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:85:9c
  IP v4: 131.159.102.3/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::3/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::21b:21ff:fec3:859c/64 virtual: proto kernel_ll scope: link
  Device-4: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel pcie: gen: 2
    speed: 5 GT/s lanes: 8 port: 7000 bus-ID: 18:00.1 chip-ID: 8086:10fb class-ID: 0200
  IF: enp24s0f1 state: down mac: 00:1b:21:c3:85:9e
  Device-5: Intel Ethernet E810-C for QSFP driver: ice v: kernel pcie: gen: 4 speed: 16 GT/s
    lanes: 16 port: N/A bus-ID: 51:00.0 chip-ID: 8086:1592 class-ID: 0200 temp: 62.0 C
  IF: enp81s0f0np0 state: up speed: 100000 Mbps duplex: full mac: b4:96:91:a4:1b:88
  IP v4: 10.100.100.2 scope: global
  Device-6: Intel Ethernet E810-C for QSFP driver: ice v: kernel pcie: gen: 4 speed: 16 GT/s
    lanes: 16 port: N/A bus-ID: 51:00.1 chip-ID: 8086:1592 class-ID: 0200
  IF: enp81s0f1np1 state: down mac: b4:96:91:a4:1b:89
  IF-ID-1: docker0 state: down mac: 02:42:9c:ed:5d:d9
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IP v6: fe80::42:9cff:feed:5dd9/64 virtual: proto kernel_ll scope: link
  IF-ID-2: docker_gwbridge state: down mac: 02:42:6e:37:53:28
  IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255
  IF-ID-3: eth0 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f
  IP v4: 169.254.3.1/24 type: dynamic scope: global
  IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link
  IF-ID-4: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:d295:dc35:5ec7:5a2d:c4a1/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.3
Bluetooth:
  Device-1: Insyde RNDIS/Ethernet Gadget driver: rndis_host v: kernel type: USB rev: 2.0
    speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee class-ID: 0a00
  Report: This feature requires one of these tools: hciconfig/bt-adapter
RAID:
  Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas v: 07.727.03.00-rc1
    port: d000 bus-ID: 8a:00.0 chip-ID: 1000:0017 rev: N/A class-ID: 0104
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 1.73 TiB free: 1.31 TiB
    allocated: 430 GiB zfs-fs: size: 1.68 TiB free: 1.26 TiB
  Components: Online:
  1: sda2 maj-min: 8:2 size: 1.75 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.43 TiB used: 388.84 GiB (11.1%)
  ID-1: /dev/sda maj-min: 8:0 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size:
    physical: 512 B logical: 512 B speed: <unknown> tech: SSD serial: N/A fw-rev: 102Q temp: 34 C
    scheme: GPT
  SMART: yes state: enabled
  ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size:
    physical: 512 B logical: 512 B speed: <unknown> tech: SSD serial: N/A fw-rev: 102Q temp: 35 C
  SMART: yes state: enabled
Partition:
  ID-1: / raw-size: N/A size: 1.64 TiB used: 388.77 GiB (23.1%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 74 MiB (7.2%) fs: vfat
    block-size: 512 B dev: /dev/sda1 maj-min: 8:1
  ID-3: /home raw-size: N/A size: 2.72 TiB used: 1.86 TiB (68.7%) fs: nfs4
    remote: nfs:/export/home
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: 54 C mobo: 34 C
  Fan Speeds (rpm): cpu: 8960 fan-2: 8960 fan-3: 8960 fan-4: 8960 fan-5: 8960 fan-6: 8960
  Power: 12v: 11.590 5v: 5.040 3.3v: 3.322 vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 62.0 C pch: 55.0 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 479 Power: uptime: 24d 9h 36m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 97.27 GiB Init: systemd v: 256 default: multi-user tool: systemctl
  Packages: 791 pm: nix-default pkgs: 100 pm: nix-sys pkgs: 591 libs: 132 pm: nix-usr pkgs: 100
    libs: 25 Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](jackson.lstopo.svg)
