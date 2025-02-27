# graham

```
System:
  Host: graham Kernel: 6.8.0-rc5-next-20240221 arch: x86_64 bits: 64 compiler: gcc v: 13.3.0
    clocksource: tsc avail: hpet,acpi_pm
    parameters: initrd=\EFI\nixos\i75f0115sg7p264gm5zqx0kf9g7n5b3p-initrd-linux-6.8-initrd.efi
    init=/nix/store/zk2xgqlf90lcz623wp447wwhl377w3l7-nixos-system-graham-24.11.20250209.392aa11/init
    amd_iommu=on console=ttyS0,115200 console=tty0 hugepagesz=1GB hugepages=0 hugepagesz=2MB
    hugepages=153600 kvm_amd.sev=1 kvm_amd.sev_es=1 kvm_amd.sev_snp=1 sp5100_tco.blacklist=yes
    kvm.gmem_2m_enabled=1 nohibernate loglevel=4
  Console: N/A DM: LightDM v: 1.32.0 Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Server System: Dell product: PowerEdge R7515 v: N/A serial: BP0PSH3 Chassis: type: 23
    serial: BP0PSH3
  Mobo: Dell model: 07PXPY v: A04 serial: .BP0PSH3.CNCMS0016O00V8.
    part-nu: SKU=NotProvided;ModelName=PowerEdge R7515 uuid: 4c4c4544-0050-3010-8050-c2c04f534833
    UEFI: Dell v: 2.5.5 date: 10/07/2021
Memory:
  System RAM: total: 1024 GiB available: 991.23 GiB used: 631.69 GiB (63.7%)
  Array-1: capacity: 2 TiB slots: 16 modules: 16 EC: Multi-bit ECC max-module-size: 128 GiB
    note: est.
  Device-1: A1 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD80B380AD part-no: HMAA8GR7CJR4N-XN serial: 94D31F06
  Device-2: A2 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD80B380AD part-no: HMAA8GR7CJR4N-XN serial: 94D31EC7
  Device-3: A3 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD869D80AD part-no: HMAA8GR7AJR4N-XN serial: 2414B54A
  Device-4: A4 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD869D80AD part-no: HMAA8GR7AJR4N-XN serial: 2414B4D9
  Device-5: A5 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD80B380AD part-no: HMAA8GR7CJR4N-XN serial: 94D31EED
  Device-6: A6 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD80B380AD part-no: HMAA8GR7CJR4N-XN serial: 94D31E77
  Device-7: A7 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD869D80AD part-no: HMAA8GR7AJR4N-XN serial: 2414B4DB
  Device-8: A8 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7AJR4N-XN serial: 23A24A1E
  Device-9: A9 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7CJR4N-XN serial: 87D2AA90
  Device-10: A10 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7CJR4N-XN serial: 87D2A9E2
  Device-11: A11 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7CJR4N-XN serial: 87D2A9C7
  Device-12: A12 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7CJR4N-XN serial: 87D2AA2C
  Device-13: A13 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7CJR4N-XN serial: 87D2A9F3
  Device-14: A14 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7CJR4N-XN serial: 87D2A996
  Device-15: A15 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7CJR4N-XN serial: 87D2AAF5
  Device-16: A16 type: DDR4 detail: synchronous registered (buffered) size: 64 GiB speed:
    spec: 3200 MT/s actual: 2933 MT/s volts: curr: 1.2 min: 1.2 max: 1.2 width (bits): data: 64
    total: 72 manufacturer: 80AD863280AD part-no: HMAA8GR7CJR4N-XN serial: 87D2A9C4
PCI Slots:
  Slot: 3 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: c4:00.0
  Slot: 2 type: PCIe gen: 3 status: in use length: long volts: 3.3 bus-ID: 81:00.0
  Slot: 5 type: PCIe gen: 3 status: in use length: long volts: 3.3 bus-ID: 03:00.0
  Slot: 4 type: PCIe gen: 4 status: in use length: long volts: 3.3 bus-ID: 41:00.0
  Slot: 1 type: PCIe gen: 3 status: in use length: long volts: 3.3 bus-ID: 02:00.0
CPU:
  Info: model: AMD EPYC 7713P socket: SP3 bits: 64 type: MCP arch: Zen 3 gen: 4 level: v3
    note: check built: 2021-22 process: TSMC n7 (7nm) family: 0x19 (25) model-id: 1 stepping: 1
    microcode: 0xA0011D5
  Topology: cpus: 1x cores: 64 smt: <unsupported> cache: L1: 4 MiB desc: d-64x32 KiB; i-64x32 KiB
    L2: 32 MiB desc: 64x512 KiB L3: 256 MiB desc: 8x32 MiB
  Speed (MHz): avg: 1570 high: 2000 min/max: 1500/3721 boost: disabled base/boost: 2000/3900
    scaling: driver: acpi-cpufreq governor: schedutil volts: 1.8 V ext-clock: 2000 MHz cores: 1: 1500
    2: 1500 3: 1500 4: 1500 5: 1500 6: 1500 7: 1500 8: 1500 9: 1500 10: 1500 11: 1500 12: 1500
    13: 1500 14: 1500 15: 1500 16: 2000 17: 1500 18: 1500 19: 1500 20: 2000 21: 2000 22: 1500
    23: 1500 24: 1500 25: 1500 26: 1500 27: 1500 28: 1500 29: 1500 30: 1500 31: 1500 32: 1500
    33: 1500 34: 1500 35: 2000 36: 1500 37: 2000 38: 1500 39: 1500 40: 1500 41: 1500 42: 1500
    43: 1500 44: 1500 45: 2000 46: 2000 47: 1500 48: 1500 49: 1500 50: 1500 51: 1500 52: 1500
    53: 1500 54: 1500 55: 2000 56: 1500 57: 1500 58: 1500 59: 1500 60: 1500 61: 1500 62: 2000
    63: 1500 64: 1500 bogomips: 255529
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow mitigation: Safe RET
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Type: spectre_v2 mitigation: Retpolines, IBPB: conditional, IBRS_FW, STIBP: disabled, RSB
    filling, PBRSB-eIBRS: Not affected
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: Matrox Systems Integrated G200eW3 Graphics driver: mgag200 v: kernel ports:
    active: VGA-1 empty: none bus-ID: c3:00.0 chip-ID: 102b:0536 class-ID: 0300
  Display: unspecified server: X.org v: 1.21.1.14 driver: gpu: mgag200 tty: 80x40
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
  Device-1: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell driver: bnxt_en
    v: kernel pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 02:00.0 chip-ID: 14e4:16d8
    class-ID: 0200 temp: 45.0 C
  IF: enp2s0f0np0 state: up speed: 10000 Mbps duplex: full mac: 2c:ea:7f:af:57:18
  Device-2: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell
    driver: bnxt_en v: kernel pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: 02:00.1
    chip-ID: 14e4:16d8 class-ID: 0200
  IF: enp2s0f1np1 state: down mac: 2c:ea:7f:af:57:19
  Device-3: Intel Ethernet E810-C for QSFP driver: vfio-pci v: N/A modules: ice pcie: gen: 3
    speed: 8 GT/s lanes: 16 link-max: gen: 4 speed: 16 GT/s port: N/A bus-ID: 81:00.0
    chip-ID: 8086:1592 class-ID: 0200
  Device-4: Intel Ethernet E810-C for QSFP driver: ice v: kernel pcie: gen: 3 speed: 8 GT/s
    lanes: 16 link-max: gen: 4 speed: 16 GT/s port: N/A bus-ID: 81:00.1 chip-ID: 8086:1592
    class-ID: 0200
  IF: enp129s0f1np1 state: down mac: b4:96:91:a4:1c:f1
  Device-5: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell PowerEdge R6515/R7515
    LOM driver: tg3 v: kernel pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A
    bus-ID: c1:00.0 chip-ID: 14e4:165f class-ID: 0200
  IF: eno8303 state: down mac: d0:8e:79:ba:02:20
  Device-6: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell PowerEdge R6515/R7515
    LOM driver: tg3 v: kernel pcie: gen: 2 speed: 5 GT/s lanes: 1 link-max: lanes: 2 port: N/A
    bus-ID: c1:00.1 chip-ID: 14e4:165f class-ID: 0200
  IF: eno8403 state: down mac: d0:8e:79:ba:02:21
  Device-7: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: c4:00.0 chip-ID: 14e4:16d8 class-ID: 0200
    temp: 37.0 C
  IF: enp196s0f0np0 state: up speed: 10000 Mbps duplex: full mac: e4:3d:1a:71:d6:b0
  IP v4: 169.254.164.174/16 scope: link
  IP v6: fe80::e63d:1aff:fe71:d6b0/64 virtual: proto kernel_ll scope: link
  Device-8: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en v: kernel
    pcie: gen: 3 speed: 8 GT/s lanes: 8 port: N/A bus-ID: c4:00.1 chip-ID: 14e4:16d8 class-ID: 0200
  IF: enp196s0f1np1 state: up speed: 10000 Mbps duplex: full mac: e4:3d:1a:71:d6:b1
  IP v4: 169.254.87.211/16 scope: link
  IP v6: fe80::e63d:1aff:fe71:d6b1/64 virtual: proto kernel_ll scope: link
  IF-ID-1: br-33389a0306b4 state: down mac: 02:42:9f:29:0c:f7
  IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255
  IF-ID-2: bra-dominik0 state: down mac: d2:e5:b9:f8:78:0b
  IP v4: 192.168.56.1/21 scope: global
  IP v6: fe80::d0e5:b9ff:fef8:780b/64 virtual: proto kernel_ll scope: link
  IF-ID-3: docker0 state: down mac: 02:42:a6:b0:3b:e3
  IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255
  IF-ID-4: doctor-bridge state: up speed: 10000 Mbps duplex: unknown mac: 2c:ea:7f:af:57:18
  IP v4: 131.159.102.9/24 type: dynamic scope: global
  IP v6: 2a09:80c0:102::9/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::2eea:7fff:feaf:5718/64 virtual: proto kernel_ll scope: link
  IF-ID-5: tapa-domini-1 state: down mac: f2:4c:e0:15:21:69
  IP v6: fe80::f04c:e0ff:fe15:2169/64 virtual: proto kernel_ll scope: link
  IF-ID-6: tapa-domini-10 state: down mac: f2:9f:49:5f:ee:19
  IF-ID-7: tapa-domini-11 state: down mac: e6:84:8a:56:80:98
  IF-ID-8: tapa-domini-12 state: down mac: be:0d:63:48:0f:89
  IF-ID-9: tapa-domini-13 state: down mac: 56:77:b5:e3:e8:f5
  IF-ID-10: tapa-domini-14 state: down mac: 56:9d:d0:54:5c:15
  IF-ID-11: tapa-domini-15 state: down mac: 86:08:2c:38:50:1f
  IF-ID-12: tapa-domini-16 state: down mac: 1a:d8:f9:77:36:fd
  IF-ID-13: tapa-domini-17 state: down mac: 6a:7c:3e:33:59:66
  IF-ID-14: tapa-domini-18 state: down mac: 5e:92:82:c0:c7:c7
  IF-ID-15: tapa-domini-19 state: down mac: ba:57:1c:cc:31:9c
  IF-ID-16: tapa-domini-2 state: down mac: 82:cf:2b:46:c9:31
  IF-ID-17: tapa-domini-20 state: down mac: 8e:ef:8c:dd:25:ce
  IF-ID-18: tapa-domini-21 state: down mac: be:e0:53:39:0d:98
  IF-ID-19: tapa-domini-22 state: down mac: fe:b9:c6:ee:84:a0
  IF-ID-20: tapa-domini-23 state: down mac: 22:ad:8a:d8:00:4f
  IF-ID-21: tapa-domini-24 state: down mac: 9e:17:4f:74:2c:4e
  IF-ID-22: tapa-domini-25 state: down mac: 1e:5c:e0:db:09:cd
  IF-ID-23: tapa-domini-26 state: down mac: a6:20:9f:09:f7:29
  IF-ID-24: tapa-domini-27 state: down mac: ba:78:1f:d7:de:95
  IF-ID-25: tapa-domini-28 state: down mac: 3a:68:a5:c9:41:a2
  IF-ID-26: tapa-domini-29 state: down mac: ae:64:c5:6d:dd:18
  IF-ID-27: tapa-domini-3 state: down mac: d6:85:b0:f7:f8:fd
  IF-ID-28: tapa-domini-30 state: down mac: 52:c5:ee:85:4a:2c
  IF-ID-29: tapa-domini-31 state: down mac: e6:37:e2:d1:1d:18
  IF-ID-30: tapa-domini-32 state: down mac: a2:1d:0c:e8:37:62
  IF-ID-31: tapa-domini-33 state: down mac: 92:c0:fe:98:c6:72
  IF-ID-32: tapa-domini-34 state: down mac: 3e:85:4f:05:71:f8
  IF-ID-33: tapa-domini-35 state: down mac: da:b5:22:89:71:55
  IF-ID-34: tapa-domini-36 state: down mac: ee:79:42:14:3e:79
  IF-ID-35: tapa-domini-37 state: down mac: 16:f2:f0:4b:c7:0b
  IF-ID-36: tapa-domini-38 state: down mac: ae:8c:19:27:d3:cb
  IF-ID-37: tapa-domini-39 state: down mac: 46:53:64:8f:80:13
  IF-ID-38: tapa-domini-4 state: down mac: a6:0b:47:ed:82:ab
  IF-ID-39: tapa-domini-40 state: down mac: a6:b0:08:48:41:06
  IF-ID-40: tapa-domini-41 state: down mac: a6:01:27:2a:ab:bf
  IF-ID-41: tapa-domini-42 state: down mac: c2:57:80:16:b7:2a
  IF-ID-42: tapa-domini-43 state: down mac: 2e:98:a8:c7:b7:c1
  IF-ID-43: tapa-domini-44 state: down mac: 12:42:a5:8a:e3:48
  IF-ID-44: tapa-domini-45 state: down mac: 96:ad:f9:37:28:af
  IF-ID-45: tapa-domini-46 state: down mac: 66:2b:cc:44:4a:70
  IF-ID-46: tapa-domini-47 state: down mac: 96:d0:32:ee:86:8a
  IF-ID-47: tapa-domini-48 state: down mac: 86:ea:e6:73:17:38
  IF-ID-48: tapa-domini-49 state: down mac: ba:6a:c1:30:d3:10
  IF-ID-49: tapa-domini-5 state: down mac: 3a:c1:b4:6a:96:7c
  IF-ID-50: tapa-domini-50 state: down mac: de:a3:d9:2b:d7:cc
  IF-ID-51: tapa-domini-6 state: down mac: 36:37:45:de:00:c6
  IF-ID-52: tapa-domini-7 state: down mac: ba:2a:fd:0f:c0:47
  IF-ID-53: tapa-domini-8 state: down mac: ca:fb:64:cb:ef:6b
  IF-ID-54: tapa-domini-9 state: down mac: 8a:3e:04:e0:d0:d9
  IF-ID-55: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:ab64:fa7c:171a:c94a:ac19/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.102.9
RAID:
  Hardware-1: Broadcom / LSI MegaRAID SAS-3 3008 [Fury] driver: megaraid_sas v: 07.727.03.00-rc1
    port: 1000 bus-ID: 01:00.0 chip-ID: 1000:005f rev: N/A class-ID: 0104
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 3.48 TiB free: 1.77 TiB
    allocated: 1.72 TiB zfs-fs: size: 3.38 TiB free: 1.66 TiB
  Components: Online:
  1: nvme1n1p2 maj-min: 259:4 size: 3.49 TiB
Drives:
  Local Storage: total: raw: 4.95 TiB usable: 4.83 TiB used: 1.3 TiB (26.9%)
  ID-1: /dev/nvme0n1 maj-min: 259:1 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB size: 1.46 TiB
    block-size: physical: 512 B logical: 512 B tech: SSD serial: S61ANA0R501400 fw-rev: 2.0.2
    temp: 19 ° (292 K) C
  SMART: yes health: PASSED on: 3y 137d 13h cycles: 39 read-units: 253,537,251 [129 TB]
    written-units: 242,345,129 [124 TB]
  ID-2: /dev/nvme1n1 maj-min: 259:2 vendor: Samsung model: MZ1L23T8HBLA-00A07 size: 3.49 TiB
    block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: S667NJ0T732147 fw-rev: GDC7302Q temp: 27.9 C scheme: GPT
  SMART: yes health: PASSED on: 1y 50d 23h cycles: 16 read-units: 74,603,554 [38.1 TB]
    written-units: 201,690,710 [103 TB]
Partition:
  ID-1: / raw-size: N/A size: 2.96 TiB used: 1.3 TiB (44.0%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 29.2 MiB (2.9%) fs: vfat
    block-size: 512 B dev: /dev/nvme1n1p1 maj-min: 259:3
  ID-3: /home raw-size: N/A size: 2.71 TiB used: 1.98 TiB (73.1%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 1.66 TiB used: 369.6 MiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  Src: ipmi System Temperatures: cpu: N/A mobo: N/A
  Fan Speeds (rpm): cpu: 9960
  Power: 12v: N/A 5v: N/A 3.3v: N/A vbat: N/A dimm-p1: N/A dimm-p2: N/A
  Src: lm-sensors System Temperatures: cpu: 36.2 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 1033 Power: uptime: 3d 23h 15m states: freeze,mem suspend: s2idle wakeups: 0
    hibernate: disabled image: 396.48 GiB Init: systemd v: 256 default: graphical tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 964 libs: 225 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](graham.lstopo.svg)
