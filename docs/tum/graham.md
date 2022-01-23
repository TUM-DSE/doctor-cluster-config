# graham

```
System:    Host: graham Kernel: 5.10.89 x86_64 bits: 64 Console: N/A 
           Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Server System: Dell product: PowerEdge R7515 v: N/A serial: BP0PSH3 
           Mobo: Dell model: 07PXPY v: A04 serial: .BP0PSH3.CNCMS0016O00V8. UEFI: Dell v: 2.5.5 
           date: 10/07/2021 
CPU:       Info: 64-Core model: AMD EPYC 7713P bits: 64 type: MCP cache: L2: 32 MiB 
           Speed: 3092 MHz min/max: 1500/2000 MHz Core speeds (MHz): 1: 3092 2: 2820 3: 2713 
           4: 2533 5: 2674 6: 2635 7: 2700 8: 3014 9: 2473 10: 2848 11: 2474 12: 3094 13: 2575 
           14: 2866 15: 3077 16: 2904 17: 2876 18: 3046 19: 3092 20: 2603 21: 2720 22: 2472 
           23: 2611 24: 2529 25: 2472 26: 2619 27: 3093 28: 2896 29: 2923 30: 2927 31: 2956 
           32: 2855 33: 2961 34: 3092 35: 2499 36: 3060 37: 3002 38: 3031 39: 3076 40: 2892 
           41: 3082 42: 2719 43: 2518 44: 2530 45: 2523 46: 2673 47: 2544 48: 2596 49: 3094 
           50: 2601 51: 2684 52: 2646 53: 2773 54: 2587 55: 2755 56: 2656 57: 2468 58: 3092 
           59: 3048 60: 2720 61: 2951 62: 2599 63: 3092 64: 3019 
Graphics:  Device-1: Matrox Systems Integrated Matrox G200eW3 Graphics driver: mgag200 v: kernel 
           Display: server: X.org 1.20.13 driver: loaded: mgag200 note: n/a (using device driver) 
           tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Message: No device data found. 
Network:   Device-1: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en 
           IF: enp2s0f0np0 state: up speed: 10000 Mbps duplex: full mac: 2c:ea:7f:af:57:18 
           IP v4: 131.159.102.9/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::9/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80:942d:18ab:a4c9::11/64 scope: link 
           IP v6: fe80::2eea:7fff:feaf:5718/64 scope: link 
           Device-2: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en 
           IF: enp2s0f1np1 state: down mac: 2c:ea:7f:af:57:19 
           Device-3: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe driver: tg3 
           IF: eno8303 state: down mac: d0:8e:79:ba:02:20 
           Device-4: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe driver: tg3 
           IF: eno8403 state: down mac: d0:8e:79:ba:02:21 
           Device-5: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en 
           IF: enp196s0f0np0 state: up speed: 10000 Mbps duplex: full mac: e4:3d:1a:71:d6:b0 
           IP v4: 169.254.198.164/16 scope: link 
           IP v6: fe80::e63d:1aff:fe71:d6b0/64 scope: link 
           Device-6: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet driver: bnxt_en 
           IF: enp196s0f1np1 state: up speed: 10000 Mbps duplex: full mac: e4:3d:1a:71:d6:b1 
           IP v4: 169.254.246.133/16 scope: link 
           IP v6: fe80::e63d:1aff:fe71:d6b1/64 scope: link 
           IF-ID-1: br-4b6eeb1e3fb5 state: down mac: 02:42:02:e5:20:19 
           IP v4: 172.18.0.1/16 scope: global 
           IF-ID-2: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:49:cb:98:94 
           IP v4: 172.17.0.1/16 scope: global 
           IP v6: fe80::42:49ff:fecb:9894/64 scope: link 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.199/12 scope: global 
           IP v6: 42:0:3c46:ab64:fa7c:171a:c94a:ac19/12 scope: global 
           IP v6: fe80::916f:3842:868a:ad5/64 virtual: stable-privacy scope: link 
           IF-ID-4: veth3b542dd state: up speed: 10000 Mbps duplex: full mac: ce:b6:1f:d6:ec:6c 
           WAN IP: 131.159.102.9 
RAID:      Hardware-1: Broadcom / LSI MegaRAID SAS-3 3008 [Fury] driver: megaraid_sas 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.45 TiB free: 671 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.46 TiB usable: 4.91 TiB used: 541.33 GiB (10.8%) 
           ID-1: /dev/nvme0n1 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB size: 1.46 TiB 
           ID-2: /dev/nvme1n1 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB size: 1.46 TiB 
           ID-3: /dev/sda model: AL15SEB060NY size: 558.91 GiB 
Partition: ID-1: / size: 813.07 GiB used: 189.08 GiB (23.3%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 406 MiB (81.2%) fs: vfat dev: /dev/nvme0n1p1 
           ID-3: /home size: 972.83 GiB used: 348.84 GiB (35.9%) fs: zfs logical: zroot/root/home 
           ID-4: /tmp size: 626.44 GiB used: 2.45 GiB (0.4%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 849 
           Uptime: 14:03:30  up 21 days  0:23,  6 users,  load average: 6.96, 6.99, 7.00 
           Memory: 503.27 GiB used: 224.82 GiB (44.7%) Init: systemd Client: Sudo inxi: 3.3.04 
```
