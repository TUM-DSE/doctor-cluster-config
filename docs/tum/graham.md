# graham

```
System:    Host: graham Kernel: 5.10.89 x86_64 bits: 64 compiler: gcc v: 10.3.0 Console: N/A 
           DM: LightDM 1.30.0 Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Server System: Dell product: PowerEdge R7515 v: N/A serial: BP0PSH3 Chassis: 
           type: 23 serial: BP0PSH3 
           Mobo: Dell model: 07PXPY v: A04 serial: .BP0PSH3.CNCMS0016O00V8. UEFI: Dell v: 2.5.5 
           date: 10/07/2021 
Memory:    RAM: total: 503.27 GiB used: 224.81 GiB (44.7%) 
           RAM Report: missing: Required tool dmidecode not installed. Check --recommends 
PCI Slots: Missing: Required tool dmidecode not installed. Check --recommends 
CPU:       Info: 64-Core model: AMD EPYC 7713P bits: 64 type: MCP arch: Zen 3 rev: 1 cache: 
           L2: 32 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm bogomips: 255518 
           Speed: 2465 MHz min/max: 1500/2000 MHz boost: enabled Core speeds (MHz): 1: 2465 
           2: 2467 3: 2474 4: 2472 5: 2474 6: 3093 7: 2474 8: 2473 9: 2571 10: 2375 11: 2432 
           12: 2489 13: 2472 14: 2483 15: 2413 16: 2054 17: 2425 18: 2475 19: 3093 20: 2474 
           21: 2467 22: 2477 23: 2469 24: 2472 25: 2471 26: 2471 27: 2922 28: 2473 29: 2901 
           30: 2511 31: 2914 32: 2473 33: 2875 34: 3093 35: 3093 36: 3094 37: 2470 38: 2473 
           39: 2473 40: 2473 41: 2469 42: 2469 43: 2474 44: 2470 45: 2471 46: 2473 47: 3093 
           48: 2468 49: 2468 50: 2470 51: 2467 52: 2473 53: 2475 54: 2475 55: 2499 56: 2475 
           57: 2473 58: 2470 59: 3093 60: 2473 61: 2670 62: 2472 63: 2470 64: 2472 
Graphics:  Device-1: Matrox Systems Integrated Matrox G200eW3 Graphics driver: mgag200 v: kernel 
           bus-ID: c3:00.0 chip-ID: 102b:0536 class-ID: 0300 
           Display: server: X.org 1.20.13 driver: loaded: mgag200 note: n/a (using device driver) 
           tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Message: No device data found. 
Network:   Device-1: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell 
           driver: bnxt_en v: kernel port: 1000 bus-ID: 02:00.0 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp2s0f0np0 state: up speed: 10000 Mbps duplex: full mac: 2c:ea:7f:af:57:18 
           IP v4: 131.159.102.9/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::9/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80:942d:18ab:a4c9::11/64 scope: link 
           IP v6: fe80::2eea:7fff:feaf:5718/64 scope: link 
           Device-2: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell 
           driver: bnxt_en v: kernel port: 1000 bus-ID: 02:00.1 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp2s0f1np1 state: down mac: 2c:ea:7f:af:57:19 
           Device-3: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe 
           vendor: Dell PowerEdge R6515/R7515 LOM driver: tg3 v: kernel port: 1000 bus-ID: c1:00.0 
           chip-ID: 14e4:165f class-ID: 0200 
           IF: eno8303 state: down mac: d0:8e:79:ba:02:20 
           Device-4: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe 
           vendor: Dell PowerEdge R6515/R7515 LOM driver: tg3 v: kernel port: 1000 bus-ID: c1:00.1 
           chip-ID: 14e4:165f class-ID: 0200 
           IF: eno8403 state: down mac: d0:8e:79:ba:02:21 
           Device-5: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en 
           v: kernel port: 1000 bus-ID: c4:00.0 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp196s0f0np0 state: up speed: 10000 Mbps duplex: full mac: e4:3d:1a:71:d6:b0 
           IP v4: 169.254.198.164/16 scope: link 
           IP v6: fe80::e63d:1aff:fe71:d6b0/64 scope: link 
           Device-6: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en 
           v: kernel port: 1000 bus-ID: c4:00.1 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp196s0f1np1 state: up speed: 10000 Mbps duplex: full mac: e4:3d:1a:71:d6:b1 
           IP v4: 169.254.246.133/16 scope: link 
           IP v6: fe80::e63d:1aff:fe71:d6b1/64 scope: link 
           IF-ID-1: br-4b6eeb1e3fb5 state: down mac: 02:42:02:e5:20:19 
           IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255 
           IF-ID-2: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:49:cb:98:94 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:49ff:fecb:9894/64 scope: link 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.199/12 scope: global broadcast: 10.255.255.255 
           IP v6: 42:0:3c46:ab64:fa7c:171a:c94a:ac19/12 scope: global 
           IP v6: fe80::916f:3842:868a:ad5/64 virtual: stable-privacy scope: link 
           IF-ID-4: veth3b542dd state: up speed: 10000 Mbps duplex: full mac: ce:b6:1f:d6:ec:6c 
           WAN IP: 131.159.102.9 
RAID:      Hardware-1: Broadcom / LSI MegaRAID SAS-3 3008 [Fury] driver: megaraid_sas 
           v: 07.714.04.00-rc1 port: 1000 bus-ID: 01:00.0 chip-ID: 1000.005f rev: 02 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.45 TiB free: 671 GiB 
           allocated: 817 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.46 TiB usable: 4.91 TiB used: 541.33 GiB (10.8%) 
           ID-1: /dev/nvme0n1 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB size: 1.46 TiB 
           rotation: SSD serial: S61ANA0R501400 rev: 2.0.2 scheme: GPT 
           ID-2: /dev/nvme1n1 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB size: 1.46 TiB 
           rotation: SSD serial: S61ANA0R501120 rev: 2.0.2 
           ID-3: /dev/sda model: AL15SEB060NY size: 558.91 GiB speed: <unknown> serial: N/A 
           rev: EF06 scheme: MBR 
Partition: ID-1: / size: 813.07 GiB used: 189.08 GiB (23.3%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 406 MiB (81.2%) fs: vfat dev: /dev/nvme0n1p1 
           ID-3: /home size: 972.83 GiB used: 348.84 GiB (35.9%) fs: zfs logical: zroot/root/home 
           ID-4: /tmp size: 626.44 GiB used: 2.45 GiB (0.4%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 831 
           Uptime: 14:24:55  up 21 days  0:45,  5 users,  load average: 7.06, 7.06, 7.01 
           wakeups: 0 Init: systemd v: 249 target: graphical.target Compilers: gcc: 10.3.0 
           Packages: nix-sys: 809 Client: Sudo v: 1.9.7p2 inxi: 3.3.04 
```
