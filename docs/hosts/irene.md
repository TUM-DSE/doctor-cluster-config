# irene

```
System:    Host: irene Kernel: 6.6.22 x86_64 bits: 64 compiler: gcc v: 12.3.0 
           parameters: initrd=\efi\nixos\zn3ihy52bd0d8mxyvjazz0f50dri2lg1-initrd-linux-6.6.22-initrd.efi 
           init=/nix/store/zq8dlsali2nbxbrcd4gng64h6f3j7z5i-nixos-system-irene-23.11.20240321.e542a71/init 
           console=tty0 console=ttyS0,115200 amd_iommu=on vfio-pci.ids=1e0f:0013 
           console=ttyS1,115200n8 console=tty1 nohibernate loglevel=4 
           Console: N/A Distro: NixOS 23.11 (Tapir) 
Machine:   Type: Kvm System: Supermicro product: AS -2015CS-TNR v: 0123456789 
           serial: E508280X4300377 Chassis: type: 1 v: 0123456789 serial: CLA26FM43BD0327 
           Mobo: Supermicro model: H13SSW v: 1.01A serial: WM236S605732 
           UEFI: American Megatrends LLC. v: 1.6a date: 01/24/2024 
Memory:    RAM: total: 755.19 GiB used: 53.53 GiB (7.1%) 
           Array-1: capacity: 6 TiB note: check slots: 12 EC: Multi-bit ECC 
           max-module-size: 512 GiB note: est. 
           Device-1: DIMMA1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E9321 
           Device-2: DIMMB1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93CF 
           Device-3: DIMMC1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E9300 
           Device-4: DIMMD1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93EB 
           Device-5: DIMME1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93E9 
           Device-6: DIMMF1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E938C 
           Device-7: DIMMG1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93E0 
           Device-8: DIMMH1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93D8 
           Device-9: DIMMI1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93A8 
           Device-10: DIMMJ1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E9306 
           Device-11: DIMMK1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93FB 
           Device-12: DIMML1 size: 64 GiB speed: 4800 MT/s type: DDR5 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 80 bits 
           manufacturer: SK Hynix part-no: HMCG94MEBRA123N serial: 80AD012321767E93CB 
PCI Slots: Slot: 1 type: x2 PCI Express 3 x2 M.2-C1 status: Available length: Long 
           Slot: 2 type: x2 PCI Express 3 x2 M.2-C2 status: Available length: Long 
           Slot: 3 type: x16 PCI Express 5 x16 RSC-D2-666G5 SLOT3 PCIe5.0 X16 status: Available 
           length: Long 
           Slot: 3 type: x16 PCI Express 5 x16 RSC-D2R-666G5 SLOT6 PCIe5.0 X16 status: Available 
           length: Long 
           Slot: 1 type: x16 PCI Express 5 x16 CPU AIOM1 PCIe5.0 x16 status: In Use length: Long 
           Slot: 2 type: x16 PCI Express 5 x16 CPU AIOM2 PCIe5.0 x16 status: Available 
           length: Long 
CPU:       Info: 96-Core model: AMD EPYC 9654P bits: 64 type: MT MCP arch: Zen 3 family: 19 (25) 
           model-id: 11 (17) stepping: 1 microcode: A101144 cache: L1: 6 MiB L2: 96 MiB 
           L3: 384 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm bogomips: 921596 
           Speed: 2400 MHz min/max: 1500/2400 MHz base/boost: 2400/3700 boost: enabled 
           volts: 0.9 V ext-clock: 100 MHz Core speeds (MHz): 1: 2400 2: 2400 3: 2400 4: 2400 
           5: 2400 6: 2400 7: 2400 8: 2400 9: 2400 10: 2400 11: 2400 12: 2400 13: 2400 14: 2400 
           15: 2400 16: 2400 17: 2400 18: 3700 19: 2400 20: 2400 21: 2400 22: 2400 23: 2400 
           24: 2400 25: 2400 26: 2400 27: 2400 28: 2400 29: 2400 30: 2400 31: 2400 32: 2400 
           33: 2400 34: 2400 35: 2400 36: 2400 37: 2400 38: 2400 39: 2400 40: 2400 41: 2400 
           42: 2400 43: 2400 44: 2400 45: 2400 46: 2400 47: 2400 48: 2400 49: 2400 50: 2400 
           51: 2400 52: 2400 53: 2400 54: 2400 55: 2400 56: 2400 57: 2400 58: 2400 59: 2400 
           60: 2400 61: 2400 62: 2400 63: 2400 64: 2400 65: 2400 66: 2400 67: 2400 68: 2400 
           69: 2400 70: 2400 71: 2400 72: 2400 73: 2400 74: 2400 75: 2400 76: 2400 77: 2400 
           78: 2400 79: 2400 80: 2400 81: 2400 82: 2400 83: 2400 84: 2400 85: 2400 86: 2400 
           87: 2400 88: 2400 89: 2400 90: 3700 91: 2400 92: 2400 93: 2400 94: 2400 95: 2400 
           96: 2400 97: 2400 98: 2400 99: 2400 100: 2400 101: 2400 102: 2400 103: 2400 104: 2400 
           105: 2400 106: 2400 107: 2400 108: 3699 109: 2400 110: 2400 111: 2400 112: 2400 
           113: 2400 114: 2400 115: 2400 116: 2400 117: 2400 118: 2400 119: 2400 120: 2400 
           121: 2400 122: 2400 123: 2400 124: 2400 125: 2400 126: 2400 127: 2400 128: 2400 
           129: 2400 130: 2400 131: 2400 132: 2400 133: 2400 134: 2400 135: 2400 136: 2400 
           137: 2400 138: 2400 139: 2400 140: 2400 141: 2400 142: 2400 143: 2400 144: 2400 
           145: 2400 146: 2400 147: 2400 148: 2400 149: 2400 150: 2400 151: 2400 152: 2400 
           153: 2400 154: 2400 155: 2400 156: 2400 157: 2400 158: 2400 159: 2400 160: 2400 
           161: 2400 162: 2400 163: 2400 164: 2400 165: 2400 166: 2400 167: 2400 168: 2400 
           169: 2400 170: 2400 171: 2400 172: 2400 173: 2400 174: 2400 175: 2400 176: 2400 
           177: 2400 178: 2400 179: 2400 180: 2400 181: 2400 182: 2400 183: 2400 184: 2400 
           185: 2400 186: 2400 187: 2400 188: 2400 189: 2400 190: 2400 191: 2400 192: 2400 
           Vulnerabilities: Type: gather_data_sampling status: Not affected 
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
           Type: spectre_v2 mitigation: Enhanced / Automatic IBRS, IBPB: conditional, STIBP: 
           always-on, RSB filling, PBRSB-eIBRS: Not affected 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: cb:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel 
           port: N/A bus-ID: 81:00.0 chip-ID: 8086:15ff class-ID: 0200 
           IF: enp129s0f0 state: down mac: 7c:c2:55:25:d0:c4 
           Device-2: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel 
           port: N/A bus-ID: 81:00.1 chip-ID: 8086:15ff class-ID: 0200 
           IF: enp129s0f1 state: down mac: 7c:c2:55:25:d0:c5 
           Device-3: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e 
           v: kernel port: N/A bus-ID: 81:00.2 chip-ID: 8086:104e class-ID: 0200 
           IF: enp129s0f2 state: up speed: 10000 Mbps duplex: full mac: 7c:c2:55:25:d0:c6 
           IP v4: 131.159.102.28/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::28/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::7ec2:55ff:fe25:d0c6/64 virtual: proto kernel_ll scope: link 
           Device-4: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e 
           v: kernel port: N/A bus-ID: 81:00.3 chip-ID: 8086:104e class-ID: 0200 
           IF: enp129s0f3 state: down mac: 7c:c2:55:25:d0:c7 
           IF-ID-1: docker0 state: down mac: 02:42:fa:02:a5:f6 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:faff:fe02:a5f6/64 virtual: proto kernel_ll scope: link 
           IF-ID-2: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:b965:c30d:8b13:bcc7:59e8/16 scope: global 
           IF-ID-3: usb0 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::bc3a:f2ff:feb6:59f/64 virtual: proto kernel_ll scope: link 
           WAN IP: 131.159.102.28 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 3-1.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 3.48 TiB free: 3.45 TiB 
           allocated: 39.9 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 6.97 TiB used: 2.94 TiB (42.2%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: MZQL23T8HCLS-00A07 
           size: 3.49 TiB block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 
           rotation: SSD serial: S64HNE0T804198 rev: GDC5A02Q temp: 30 ° (303 K) C scheme: GPT 
           SMART: yes health: PASSED on: 4d 11h cycles: 23 read-units: 2,169,429 [1.11 TB] 
           written-units: 4,511,941 [2.31 TB] 
Partition: ID-1: / raw-size: N/A size: 3.35 TiB used: 14.09 GiB (0.4%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 54.6 MiB (5.3%) fs: vfat 
           block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:1 
           ID-3: /home raw-size: N/A size: 3.13 TiB used: 1.02 TiB (32.6%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 3.34 TiB used: 1.6 MiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Message: No sensor data found. Is lm-sensors configured? 
Info:      Processes: 2496 
           Uptime: 08:48:45  up 3 days  2:05,  0 users,  load average: 0.00, 0.00, 0.00 wakeups: 0 
           Init: systemd v: 254 target: multi-user.target tool: systemctl Compilers: gcc: 12.3.0 
           Packages: nix-default: 0 nix-sys: 579 lib: 131 nix-usr: 0 Client: Sudo v: 1.9.15p2 
           inxi: 3.3.04 
```
![hardware topology](irene.lstopo.svg)
