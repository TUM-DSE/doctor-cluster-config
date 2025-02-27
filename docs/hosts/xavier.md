# xavier

```
System:
  Host: xavier Kernel: 6.0.0 arch: x86_64 bits: 64 compiler: gcc v: 13.3.0 clocksource: tsc
    avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\2g706lxy2x66ljcz2bbx14l5006p5xjw-initrd-linux-6.0-initrd.efi
    init=/nix/store/mcch6jgzljszib0wa9hrsl4j0r4wz6zl-nixos-system-xavier-24.11.20250209.392aa11/init
    console=ttyS0,115200 console=tty0
    isolcpus=0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,126
    nohz_full=0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,126
    intel_iommu=off nopat watchdog_thresh=0 nohibernate loglevel=4
  Console: pty pts/1 Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Server System: Dell product: PowerEdge R760 v: N/A serial: DJF2924 Chassis: type: 23
    serial: DJF2924
  Mobo: Dell model: 0024FG v: A01 serial: .DJF2924.CNIVC0041N0512.
    part-nu: SKU=0A6B;ModelName=PowerEdge R760 uuid: 4c4c4544-004a-4610-8032-c4c04f393234 UEFI: Dell
    v: 2.0.0 date: 11/23/2023
Memory:
  System RAM: total: 2 TiB available: 1.97 TiB used: 644.8 GiB (32.0%)
  Array-1: capacity: 12 TiB note: check slots: 32 modules: 32 EC: Multi-bit ECC
    max-module-size: 384 GiB note: est.
  Device-1: A1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8DE64
  Device-2: A2 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E042
  Device-3: A3 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 4690D58D
  Device-4: A4 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E047
  Device-5: A5 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 4690D4E4
  Device-6: A6 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E0B9
  Device-7: A7 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8DD5D
  Device-8: A8 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E0BB
  Device-9: A9 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7606
  Device-10: A10 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7882
  Device-11: A11 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF79CA
  Device-12: A12 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF784F
  Device-13: A13 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7852
  Device-14: A14 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF76DF
  Device-15: A15 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF76DE
  Device-16: A16 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF784E
  Device-17: B1 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8DE60
  Device-18: B2 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E0AC
  Device-19: B3 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E0B8
  Device-20: B4 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E0BA
  Device-21: B5 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E03E
  Device-22: B6 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8DE6A
  Device-23: B7 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8DE6D
  Device-24: B8 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 37C8E03A
  Device-25: B9 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7856
  Device-26: B10 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF75DC
  Device-27: B11 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF757A
  Device-28: B12 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7814
  Device-29: B13 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7857
  Device-30: B14 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7815
  Device-31: B15 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7615
  Device-32: B16 type: DDR5 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 4800 MT/s actual: 4400 MT/s volts: curr: 1.1 min: 1.1 max: 1.1 width (bits): data: 64
    total: 80 manufacturer: 00AD00B300AD part-no: HMCG94MEBRA123N serial: 14AF7602
PCI Slots:
  Slot: 2 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: N/A
  Slot: 3 type: PCIe gen: 4 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 6 type: PCIe gen: 4 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 4 type: PCIe gen: 4 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 5 type: PCIe gen: 4 status: available length: short volts: 3.3 bus-ID: N/A
  Slot: 7 type: PCIe gen: 5 status: available length: long volts: 3.3 bus-ID: N/A
  Slot: 23 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 61:00.0
  Slot: 22 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 62:00.0
  Slot: 21 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 63:00.0
  Slot: 20 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: 64:00.0
  Slot: 16 type: PCIe gen: 5 status: in use length: 2.5" drive form factor volts: 3.3
    bus-ID: ca:00.0
  Slot: 17 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: cb:00.0
  Slot: 18 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: cc:00.0
  Slot: 19 type: PCIe gen: 5 status: available length: 2.5" drive form factor volts: 3.3
    bus-ID: cd:00.0
CPU:
  Info: model: Intel Xeon Gold 6438Y+ socket: LGA4677 bits: 64 type: MT MCP SMP
    arch: Sapphire Rapids level: v4 note: check built: 2023+ process: Intel 7 (10nm ESF) family: 6
    model-id: 0x8F (143) stepping: 8 microcode: 0x2B000603
  Topology: cpus: 2x cores: 32 tpc: 2 threads: 64 smt: enabled cache: L1: 2x 2.5 MiB (5 MiB)
    desc: d-32x48 KiB; i-32x32 KiB L2: 2x 64 MiB (128 MiB) desc: 32x2 MiB L3: 2x 60 MiB (120 MiB)
    desc: 1x60 MiB
  Speed (MHz): avg: 2278 high: 2800 min/max: N/A base/boost: 2000/4000 volts: 1.6 V
    ext-clock: 16000 MHz cores: 1: 786 2: 2800 3: 2000 4: 2800 5: 2000 6: 2000 7: 2000 8: 2800
    9: 2000 10: 2800 11: 2000 12: 2800 13: 2000 14: 2800 15: 2000 16: 2800 17: 2000 18: 2000
    19: 2000 20: 2800 21: 2000 22: 2800 23: 2000 24: 2000 25: 2000 26: 2000 27: 2000 28: 2000
    29: 2000 30: 2800 31: 2000 32: 2800 33: 2000 34: 2800 35: 2000 36: 2800 37: 2000 38: 2800
    39: 2000 40: 2800 41: 2000 42: 2800 43: 2000 44: 2800 45: 2000 46: 2800 47: 2000 48: 2800
    49: 2000 50: 2800 51: 2000 52: 2000 53: 2000 54: 2000 55: 2000 56: 2800 57: 2000 58: 2800
    59: 2000 60: 2800 61: 2000 62: 2000 63: 2000 64: 2800 65: 2000 66: 2800 67: 2000 68: 2800
    69: 2000 70: 2800 71: 2000 72: 2000 73: 2000 74: 2800 75: 2000 76: 2800 77: 2000 78: 2000
    79: 2000 80: 2800 81: 2000 82: 2800 83: 2000 84: 2000 85: 2000 86: 2000 87: 2000 88: 2800
    89: 2000 90: 2800 91: 2000 92: 2800 93: 2000 94: 2000 95: 2000 96: 2000 97: 2000 98: 2800
    99: 2000 100: 2800 101: 2000 102: 2800 103: 2000 104: 2000 105: 2000 106: 2800 107: 2000
    108: 2800 109: 2000 110: 2000 111: 2000 112: 2000 113: 2000 114: 2800 115: 2000 116: 2800
    117: 2000 118: 2800 119: 2000 120: 2000 121: 2000 122: 2800 123: 2000 124: 2800 125: 2000
    126: 2800 127: 2000 128: 2800 bogomips: 510803
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
  Vulnerabilities:
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: retbleed status: Not affected
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Enhanced IBRS, IBPB: conditional, RSB filling, PBRSB-eIBRS: SW
    sequence
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: Matrox Systems Integrated G200eW3 Graphics vendor: Dell driver: mgag200 v: kernel
    ports: active: VGA-1 empty: none bus-ID: 03:00.0 chip-ID: 102b:0536 class-ID: 0300
  Display: server: No display server data found. Headless machine? tty: 80x40
  Monitor-1: VGA-1 size-res: N/A in console modes: max: 1024x768 min: 640x480
  API: EGL Message: No EGL data available.
  API: OpenGL Message: GL data unavailable in console for root.
Audio:
  Message: No device data found.
Network:
  Device-1: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 01:00.0
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno8303 state: down mac: c4:cb:e1:c1:ab:7c
  Device-2: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 v: kernel
    pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A bus-ID: 01:00.1
    chip-ID: 14e4:165f class-ID: 0200
  IF: eno8403 state: down mac: c4:cb:e1:c1:ab:7d
  Device-3: Mellanox MT2894 Family [ConnectX-6 Lx] driver: mlx5_core v: kernel pcie: gen: 4
    speed: 16 GT/s lanes: 8 port: N/A bus-ID: 22:00.0 chip-ID: 15b3:101f class-ID: 0200
  IF: eno12399np0 state: up speed: 10000 Mbps duplex: full mac: 58:a2:e1:2d:91:9e
  IP v4: 131.159.102.27/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::27/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::5aa2:e1ff:fe2d:919e/64 virtual: proto kernel_ll scope: link
  Device-4: Mellanox MT2894 Family [ConnectX-6 Lx] driver: mlx5_core v: kernel pcie: gen: 4
    speed: 16 GT/s lanes: 8 port: N/A bus-ID: 22:00.1 chip-ID: 15b3:101f class-ID: 0200
  IF: eno12409np1 state: down mac: 58:a2:e1:2d:91:9f
  IF-ID-1: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:77:70:c8:43
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IP v6: fe80::42:77ff:fe70:c843/64 virtual: proto kernel_ll scope: link
  IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:6e0b:a95d:c4e8:99ac:156e/16 scope: global
  IF-ID-3: veth010d6dc state: up speed: 10000 Mbps duplex: full mac: 8a:e1:db:73:f8:40
  IF-ID-4: veth0dbfdd7 state: up speed: 10000 Mbps duplex: full mac: da:81:6e:13:d2:84
  IF-ID-5: veth10af089 state: up speed: 10000 Mbps duplex: full mac: ca:94:c3:1e:8d:c2
  IF-ID-6: veth153a2e4 state: up speed: 10000 Mbps duplex: full mac: 22:95:47:24:9a:b8
  IF-ID-7: veth1be7420 state: up speed: 10000 Mbps duplex: full mac: 6a:72:e4:3c:2c:a4
  IF-ID-8: veth1efdc58 state: up speed: 10000 Mbps duplex: full mac: b2:89:54:1e:15:90
  IF-ID-9: veth488ddd8 state: up speed: 10000 Mbps duplex: full mac: 52:e8:21:9d:24:3e
  IF-ID-10: veth4cf1b69 state: up speed: 10000 Mbps duplex: full mac: 3e:8e:2b:8c:82:89
  IF-ID-11: veth5003b0c state: up speed: 10000 Mbps duplex: full mac: 7a:d9:2d:b1:b2:05
  IF-ID-12: veth5bd0903 state: up speed: 10000 Mbps duplex: full mac: 02:1c:f3:5b:5b:a3
  IF-ID-13: veth62e29d9 state: up speed: 10000 Mbps duplex: full mac: d6:83:97:f6:58:da
  IF-ID-14: veth8c9e3df state: up speed: 10000 Mbps duplex: full mac: ba:5a:65:c8:1b:4e
  IF-ID-15: veth8e3c0ff state: up speed: 10000 Mbps duplex: full mac: b2:92:03:ad:35:2b
  IF-ID-16: veth9874626 state: up speed: 10000 Mbps duplex: full mac: 7e:68:a0:48:95:58
  IF-ID-17: vethb8ac0a0 state: up speed: 10000 Mbps duplex: full mac: 06:44:a9:de:d5:d8
  IF-ID-18: vethbe8113f state: up speed: 10000 Mbps duplex: full mac: d2:1a:ab:cb:b4:d2
  IF-ID-19: vethc990eeb state: up speed: 10000 Mbps duplex: full mac: 6e:c4:10:f6:f1:d8
  IF-ID-20: vethd1874dc state: up speed: 10000 Mbps duplex: full mac: 7e:0b:dd:84:59:ed
  IF-ID-21: vethd53a851 state: up speed: 10000 Mbps duplex: full mac: b6:39:ab:e9:9c:17
  IF-ID-22: vethd5c9a84 state: up speed: 10000 Mbps duplex: full mac: 7e:e5:53:17:92:e3
  IF-ID-23: vethec59ab2 state: up speed: 10000 Mbps duplex: full mac: 9e:c1:ba:6e:b5:7d
  IF-ID-24: vethff4231a state: up speed: 10000 Mbps duplex: full mac: 4a:6c:52:ae:99:41
  Info: services: mld, sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.27
RAID:
  Hardware-1: Broadcom / LSI Fusion-MPT 24GSAS/PCIe SAS40xx/41xx driver: mpi3mr v: 8.0.0.69.0
    port: N/A bus-ID: 4a:00.0 chip-ID: 1000:00a5 rev: N/A class-ID: 0104
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 3.09 TiB
    allocated: 404 GiB zfs-fs: size: 3.38 TiB free: 2.98 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:2 size: 3.49 TiB
Drives:
  Local Storage: total: raw: 3.49 TiB usable: 3.38 TiB used: 303.25 GiB (8.8%)
  ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: MZQL23T8HCLS-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S64HNN0W800552 fw-rev: GDC5602Q temp: 30.9 C scheme: GPT
  SMART: yes health: PASSED on: 337d 3h cycles: 23 read-units: 3,878,496 [1.98 TB]
    written-units: 17,903,032 [9.16 TB]
Partition:
  ID-1: / raw-size: N/A size: 3.25 TiB used: 278.77 GiB (8.4%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 34.8 MiB (3.4%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:1
  ID-3: /home raw-size: N/A size: 2.71 TiB used: 1.98 TiB (73.1%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 2.98 TiB used: 2.2 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: N/A mobo: N/A
  Fan Speeds (rpm): cpu: 7440 fan-27: 6600 fan-42: 8280 fan-43: 7320 fan-58: 7560 fan-59: 6600
    fan-74: 6840 fan-75: 6120 fan-90: 6840 fan-91: 6120 fan-106: 6840 fan-107: 6120
  Power: 12v: N/A 5v: N/A 3.3v: N/A vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 67.0 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 2061 Power: uptime: 4d 14h 24m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 806.15 GiB Init: systemd v: 256 default: multi-user tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 591 libs: 130 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](xavier.lstopo.svg)
