# graham

```
System:    Host: graham Kernel: 5.15.79 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: initrd=\efi\nixos\9vm8y6k50c0r6miymwki39lm451c0l7c-initrd-linux-5.15.79-initrd.efi 
           init=/nix/store/5c16p6jcwapl7q3gfp7ip1bh1hn6vy9c-nixos-system-graham-22.05.20221121.41c6fb2/init 
           amd_iommu=on console=ttyS0,115200n8 console=tty0 default_hugepagesz=1GB hugepagesz=1GB 
           hugepages=8 kvm_amd.sev=1 panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A DM: LightDM 1.32.0 Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Server System: Dell product: PowerEdge R7515 v: N/A serial: BP0PSH3 Chassis: 
           type: 23 serial: BP0PSH3 
           Mobo: Dell model: 07PXPY v: A04 serial: .BP0PSH3.CNCMS0016O00V8. UEFI: Dell v: 2.5.5 
           date: 10/07/2021 
Memory:    RAM: total: 503.18 GiB used: 299.55 GiB (59.5%) 
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
           family: 19 (25) model-id: 1 stepping: 1 microcode: A001173 cache: L2: 32 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm bogomips: 511063 
           Speed: 1656 MHz min/max: 1500/2000 MHz base/boost: 2000/3900 boost: enabled 
           volts: 1.8 V ext-clock: 2000 MHz Core speeds (MHz): 1: 1656 2: 3057 3: 2948 4: 1793 
           5: 1791 6: 1792 7: 1792 8: 1791 9: 2667 10: 2176 11: 1793 12: 2338 13: 2176 14: 2949 
           15: 2226 16: 1793 17: 1759 18: 1625 19: 3253 20: 2186 21: 1792 22: 1790 23: 1791 
           24: 1793 25: 2351 26: 1791 27: 1793 28: 1793 29: 1794 30: 1792 31: 1792 32: 1795 
           33: 1793 34: 2357 35: 2156 36: 3684 37: 2934 38: 1992 39: 1914 40: 1912 41: 3401 
           42: 3280 43: 1913 44: 1915 45: 1912 46: 2958 47: 2954 48: 2949 49: 2949 50: 3693 
           51: 2947 52: 1794 53: 2945 54: 2952 55: 1799 56: 1797 57: 1794 58: 1795 59: 1794 
           60: 1794 61: 1793 62: 1795 63: 2142 64: 1794 65: 1795 66: 2333 67: 3215 68: 2295 
           69: 1793 70: 1796 71: 1795 72: 1794 73: 1795 74: 2167 75: 2954 76: 2263 77: 2442 
           78: 1943 79: 2947 80: 2269 81: 1792 82: 1793 83: 1795 84: 1792 85: 1793 86: 1795 
           87: 1796 88: 1792 89: 1791 90: 2173 91: 1794 92: 1854 93: 1842 94: 2729 95: 2174 
           96: 1791 97: 1794 98: 1792 99: 2773 100: 2947 101: 2179 102: 1791 103: 1794 104: 1792 
           105: 1791 106: 1791 107: 1791 108: 1910 109: 2444 110: 2408 111: 2228 112: 2393 
           113: 1915 114: 1911 115: 1911 116: 2956 117: 2985 118: 1792 119: 2952 120: 2953 
           121: 3689 122: 2950 123: 2951 124: 2957 125: 1796 126: 1794 127: 1793 128: 1791 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data status: Not affected 
           Type: retbleed status: Not affected 
           Type: spec_store_bypass 
           mitigation: Speculative Store Bypass disabled via prctl and seccomp 
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
           Device-3: Intel Ethernet E810-C for QSFP driver: vfio-pci v: N/A modules: ice 
           port: 1000 bus-ID: 81:00.0 chip-ID: 8086:1592 class-ID: 0200 
           Device-4: Intel Ethernet E810-C for QSFP driver: vfio-pci v: N/A modules: ice 
           port: 1000 bus-ID: 81:00.1 chip-ID: 8086:1592 class-ID: 0200 
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
           IF-ID-1: br-3050ab4aecf2 state: down mac: 02:42:58:35:86:3d 
           IP v4: 172.20.0.1/16 scope: global broadcast: 172.20.255.255 
           IF-ID-2: br-4b6eeb1e3fb5 state: down mac: 02:42:7e:0a:18:14 
           IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255 
           IF-ID-3: br-73bd5d65cf4a state: down mac: 02:42:80:71:e2:2a 
           IP v4: 172.21.0.1/16 scope: global broadcast: 172.21.255.255 
           IF-ID-4: br-cf2cd8ea9ee9 state: down mac: 02:42:49:e3:88:ba 
           IP v4: 172.19.0.1/16 scope: global broadcast: 172.19.255.255 
           IF-ID-5: br-db48a1acaae7 state: down mac: 02:42:89:0b:48:62 
           IP v4: 172.22.0.1/16 scope: global broadcast: 172.22.255.255 
           IF-ID-6: docker0 state: down mac: 02:42:da:a9:72:80 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-7: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:ab64:fa7c:171a:c94a:ac19/16 scope: global 
           IF-ID-8: virbr0 state: down mac: 52:54:00:08:20:72 
           IP v4: 192.168.122.1/24 scope: global broadcast: 192.168.122.255 
           WAN IP: 131.159.102.9 
RAID:      Hardware-1: Broadcom / LSI MegaRAID SAS-3 3008 [Fury] driver: megaraid_sas 
           v: 07.717.02.00-rc1 port: 1000 bus-ID: 01:00.0 chip-ID: 1000.005f rev: 02 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.45 TiB free: 386 GiB 
           allocated: 1.08 TiB 
           Components: Online: N/A 
Drives:    Local Storage: total: 3.46 TiB used: 1.77 TiB (51.1%) 
           ID-1: /dev/nvme0n1 maj-min: 259:3 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB 
           size: 1.46 TiB block-size: physical: 512 B logical: 512 B rotation: SSD 
           serial: S61ANA0R501400 rev: 2.0.2 temp: 13 Celsius C scheme: GPT 
           SMART: yes health: PASSED on: 1y 52d 20h cycles: 20 read-units: 114,125,847 [58.4 TB] 
           written-units: 138,152,228 [70.7 TB] 
           ID-2: /dev/nvme1n1 maj-min: 259:1 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB 
           size: 1.46 TiB block-size: physical: 512 B logical: 512 B rotation: SSD 
           serial: S61ANA0R501120 rev: 2.0.2 temp: 13 Celsius C 
           SMART: yes health: PASSED on: 1y 52d 20h cycles: 21 read-units: 572 [292 MB] 
           ID-3: /dev/sda maj-min: 8:0 model: AL15SEB060NY size: 558.91 GiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: 10000 rpm serial: N/A 
           rev: EF06 temp: 15 C scheme: MBR 
           SMART: yes state: enabled 
Partition: ID-1: / raw-size: N/A size: 1.15 TiB used: 842.48 GiB (71.3%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 136.4 MiB (27.3%) fs: vfat 
           block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:4 
           ID-3: /home raw-size: N/A size: 880.51 GiB used: 538.51 GiB (61.2%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 341.69 GiB used: 3.35 GiB (1.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 37.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 1488 
           Uptime: 13:51:11  up 8 days 13:30,  10 users,  load average: 14.92, 19.67, 45.04 
           wakeups: 0 Init: systemd v: 251 target: graphical.target tool: systemctl Compilers: 
           gcc: 11.3.0 Packages: nix-default: 0 nix-sys: 870 lib: 204 nix-usr: 0 Client: Sudo 
           v: 1.9.12p1 inxi: 3.3.04 
```
![hardware topology](graham.lstopo.svg)
