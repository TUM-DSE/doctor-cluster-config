# graham

```
System:    Host: graham Kernel: 6.1.21 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: initrd=\efi\nixos\gg7iwbpg0p3qxbgmqrkkqqsjrkm5ry20-initrd-linux-6.1.21-initrd.efi 
           init=/nix/store/qj6n01yzi3j7m8q1xh2zkqhw2gdkhb99-nixos-system-graham-22.11.20230325.6facb7e/init 
           amd_iommu=on console=tty0 console=ttyS0,115200 default_hugepagesz=1GB hugepagesz=1GB 
           hugepages=8 kvm_amd.sev=1 kvm_amd.sev_es=1 nohibernate loglevel=4 
           Console: N/A DM: LightDM 1.32.0 Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Server System: Dell product: PowerEdge R7515 v: N/A serial: BP0PSH3 Chassis: 
           type: 23 serial: BP0PSH3 
           Mobo: Dell model: 07PXPY v: A04 serial: .BP0PSH3.CNCMS0016O00V8. UEFI: Dell v: 2.5.5 
           date: 10/07/2021 
Memory:    RAM: total: 503.18 GiB used: 284.39 GiB (56.5%) 
           Array-1: capacity: 2 TiB slots: 16 EC: Multi-bit ECC max-module-size: 128 GiB 
           note: est. 
           Device-1: A1 size: 64 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 80AD80B380AD part-no: HMAA8GR7CJR4N-XN serial: 94D31F06 
           Device-2: A2 size: 64 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 80AD80B380AD part-no: HMAA8GR7CJR4N-XN serial: 94D31EC7 
           Device-3: A3 size: 64 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 80AD869D80AD part-no: HMAA8GR7AJR4N-XN serial: 2414B54A 
           Device-4: A4 size: 64 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 80AD869D80AD part-no: HMAA8GR7AJR4N-XN serial: 2414B4D9 
           Device-5: A5 size: 64 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 80AD80B380AD part-no: HMAA8GR7CJR4N-XN serial: 94D31EED 
           Device-6: A6 size: 64 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 80AD80B380AD part-no: HMAA8GR7CJR4N-XN serial: 94D31E77 
           Device-7: A7 size: 64 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 80AD869D80AD part-no: HMAA8GR7AJR4N-XN serial: 2414B4DB 
           Device-8: A8 size: 64 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 80AD863280AD part-no: HMAA8GR7AJR4N-XN serial: 23A24A1E 
           Device-9: A9 size: No Module Installed 
           Device-10: A10 size: No Module Installed 
           Device-11: A11 size: No Module Installed 
           Device-12: A12 size: No Module Installed 
           Device-13: A13 size: No Module Installed 
           Device-14: A14 size: No Module Installed 
           Device-15: A15 size: No Module Installed 
           Device-16: A16 size: No Module Installed 
PCI Slots: Slot: 3 type: x16 PCI Express 4 PCIe Slot 3 status: In Use length: Long 
           Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: In Use length: Long 
           Slot: 5 type: x16 PCI Express 3 PCIe Slot 5 status: In Use length: Long 
           Slot: 4 type: x16 PCI Express 4 PCIe Slot 4 status: In Use length: Long 
           Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Long 
CPU:       Info: 64-Core model: AMD EPYC 7713P socket: SP3 bits: 64 type: MT MCP arch: Zen 3 
           family: 19 (25) model-id: 1 stepping: 1 microcode: A0011A8 cache: L2: 32 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm bogomips: 511015 
           Speed: 3087 MHz min/max: 1500/2000 MHz base/boost: 2000/3900 boost: enabled 
           volts: 1.8 V ext-clock: 2000 MHz Core speeds (MHz): 1: 3094 2: 3095 3: 3100 4: 3091 
           5: 3095 6: 3092 7: 3095 8: 3094 9: 3091 10: 2000 11: 2000 12: 3087 13: 3092 14: 3094 
           15: 3094 16: 3092 17: 3094 18: 3088 19: 3089 20: 3092 21: 3093 22: 3089 23: 3090 
           24: 3086 25: 3092 26: 3087 27: 3084 28: 3094 29: 3092 30: 3093 31: 3096 32: 3088 
           33: 3089 34: 3092 35: 3093 36: 2000 37: 3093 38: 3088 39: 3088 40: 3087 41: 3086 
           42: 3090 43: 3094 44: 3091 45: 3089 46: 2000 47: 2000 48: 2000 49: 2000 50: 2000 
           51: 2000 52: 3084 53: 2000 54: 3092 55: 3089 56: 3089 57: 3086 58: 3091 59: 3086 
           60: 3088 61: 3088 62: 3093 63: 3085 64: 3091 65: 2635 66: 3094 67: 3094 68: 3082 
           69: 3089 70: 3090 71: 3087 72: 3084 73: 3086 74: 3093 75: 3084 76: 3087 77: 3085 
           78: 3091 79: 3091 80: 3086 81: 3092 82: 3087 83: 2000 84: 3089 85: 3091 86: 3085 
           87: 3087 88: 3085 89: 3089 90: 3086 91: 3095 92: 3094 93: 3088 94: 3093 95: 3090 
           96: 3085 97: 3094 98: 3086 99: 2000 100: 3105 101: 3094 102: 3092 103: 2000 104: 2000 
           105: 3097 106: 3090 107: 3085 108: 3096 109: 3094 110: 3092 111: 3091 112: 3093 
           113: 3094 114: 3097 115: 3086 116: 3094 117: 3092 118: 3087 119: 3094 120: 3092 
           121: 3094 122: 3094 123: 3094 124: 3094 125: 3092 126: 3095 127: 3101 128: 3094 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data status: Not affected 
           Type: retbleed status: Not affected 
           Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 mitigation: Retpolines, IBPB: conditional, IBRS_FW, STIBP: always-on, 
           RSB filling, PBRSB-eIBRS: Not affected 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: Matrox Systems Integrated Matrox G200eW3 Graphics driver: mgag200 v: kernel 
           bus-ID: c3:00.0 chip-ID: 102b:0536 class-ID: 0300 
           Display: server: X.org 1.20.14 driver: loaded: mgag200 note: n/a (using device driver) 
           tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
Network:   Device-1: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell 
           driver: bnxt_en v: kernel port: 1000 bus-ID: 02:00.0 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp2s0f0np0 state: up speed: 10000 Mbps duplex: full mac: 2c:ea:7f:af:57:18 
           IP v4: 131.159.102.9/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::9/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::2eea:7fff:feaf:5718/64 scope: link 
           Device-2: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell 
           driver: bnxt_en v: kernel port: 1000 bus-ID: 02:00.1 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp2s0f1np1 state: down mac: 2c:ea:7f:af:57:19 
           Device-3: Intel Ethernet E810-C for QSFP driver: N/A modules: ice port: 1000 
           bus-ID: 81:00.0 chip-ID: 8086:1592 class-ID: 0200 
           Device-4: Intel Ethernet E810-C for QSFP driver: N/A modules: ice port: 1000 
           bus-ID: 81:00.1 chip-ID: 8086:1592 class-ID: 0200 
           Device-5: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe 
           vendor: Dell PowerEdge R6515/R7515 LOM driver: tg3 v: kernel port: 1000 bus-ID: c1:00.0 
           chip-ID: 14e4:165f class-ID: 0200 
           IF: eno8303 state: down mac: d0:8e:79:ba:02:20 
           Device-6: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe 
           vendor: Dell PowerEdge R6515/R7515 LOM driver: tg3 v: kernel port: 1000 bus-ID: c1:00.1 
           chip-ID: 14e4:165f class-ID: 0200 
           IF: eno8403 state: down mac: d0:8e:79:ba:02:21 
           Device-7: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en 
           v: kernel port: 1000 bus-ID: c4:00.0 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp196s0f0np0 state: up speed: 10000 Mbps duplex: full mac: e4:3d:1a:71:d6:b0 
           IP v4: 169.254.198.164/16 scope: link 
           IP v6: fe80::e63d:1aff:fe71:d6b0/64 scope: link 
           Device-8: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en 
           v: kernel port: 1000 bus-ID: c4:00.1 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp196s0f1np1 state: up speed: 10000 Mbps duplex: full mac: e4:3d:1a:71:d6:b1 
           IP v4: 169.254.246.133/16 scope: link 
           IP v6: fe80::e63d:1aff:fe71:d6b1/64 scope: link 
           IF-ID-1: br-3050ab4aecf2 state: down mac: 02:42:1e:b5:dc:52 
           IP v4: 172.20.0.1/16 scope: global broadcast: 172.20.255.255 
           IF-ID-2: br-4b6eeb1e3fb5 state: down mac: 02:42:ac:4b:24:33 
           IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255 
           IF-ID-3: br-73bd5d65cf4a state: down mac: 02:42:a3:e9:a2:13 
           IP v4: 172.21.0.1/16 scope: global broadcast: 172.21.255.255 
           IF-ID-4: br-cf2cd8ea9ee9 state: down mac: 02:42:1c:dc:80:37 
           IP v4: 172.19.0.1/16 scope: global broadcast: 172.19.255.255 
           IF-ID-5: br-db48a1acaae7 state: down mac: 02:42:97:f7:08:04 
           IP v4: 172.22.0.1/16 scope: global broadcast: 172.22.255.255 
           IF-ID-6: docker0 state: down mac: 02:42:52:b5:e0:d9 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:52ff:feb5:e0d9/64 scope: link 
           IF-ID-7: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:ab64:fa7c:171a:c94a:ac19/16 scope: global 
           IF-ID-8: virbr0 state: up speed: 10 Mbps duplex: unknown mac: 52:54:00:08:20:72 
           IP v4: 192.168.122.1/24 scope: global broadcast: 192.168.122.255 
           IF-ID-9: vnet0 state: unknown speed: 10 Mbps duplex: full mac: fe:54:00:3a:f7:9d 
           IP v6: fe80::fc54:ff:fe3a:f79d/64 scope: link 
           WAN IP: 131.159.102.9 
RAID:      Hardware-1: Broadcom / LSI MegaRAID SAS-3 3008 [Fury] driver: megaraid_sas 
           v: 07.719.03.00-rc1 port: 1000 bus-ID: 01:00.0 chip-ID: 1000.005f rev: 02 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.45 TiB free: 542 GiB 
           allocated: 946 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: 3.46 TiB used: 1.7 TiB (49.3%) 
           ID-1: /dev/nvme0n1 maj-min: 259:2 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB 
           size: 1.46 TiB block-size: physical: 512 B logical: 512 B rotation: SSD 
           serial: S61ANA0R501400 rev: 2.0.2 temp: 14 Celsius C scheme: GPT 
           SMART: yes health: PASSED on: 1y 185d 22h cycles: 20 read-units: 157,280,006 [80.5 TB] 
           written-units: 177,745,689 [91.0 TB] 
           ID-2: /dev/nvme1n1 maj-min: 259:3 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB 
           size: 1.46 TiB block-size: physical: 512 B logical: 512 B rotation: SSD 
           serial: S61ANA0R501120 rev: 2.0.2 temp: 14 Celsius C 
           SMART: yes health: PASSED on: 1y 185d 22h cycles: 21 read-units: 648 [331 MB] 
           ID-3: /dev/sda maj-min: 8:0 model: AL15SEB060NY size: 558.91 GiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: 10000 rpm serial: N/A 
           rev: EF06 temp: 16 C scheme: MBR 
           SMART: yes state: enabled 
Partition: ID-1: / raw-size: N/A size: 1.12 TiB used: 649.78 GiB (56.8%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 152.8 MiB (30.6%) fs: vfat 
           block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:4 
           ID-3: /home raw-size: N/A size: 860.78 GiB used: 504.95 GiB (58.7%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 498.19 GiB used: 3.7 GiB (0.7%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 38.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 1709 
           Uptime: 15:33:47  up 22 days 15:13,  11 users,  load average: 9.12, 3.19, 2.31 
           wakeups: 0 Init: systemd v: 251 target: graphical.target tool: systemctl Compilers: 
           gcc: 11.3.0 Packages: 893 nix-default: 6 nix-sys: 881 lib: 213 nix-usr: 6 lib: 2 
           Client: Sudo v: 1.9.13p3 inxi: 3.3.04 
```
![hardware topology](graham.lstopo.svg)
