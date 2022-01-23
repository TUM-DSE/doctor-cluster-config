# bill

```
System:    Host: bill Kernel: 5.10.89 x86_64 bits: 64 Console: N/A Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Desktop System: sysGen www.sysgen.de product: Super Server v: 0123456789 
           serial: 0123456789 
           Mobo: Supermicro model: X12SCZ-TLN4F v: 1.01A serial: UM20BS000421 
           UEFI: American Megatrends v: 1.0a date: 01/11/2021 
CPU:       Info: 10-Core model: Intel Core i9-10900K bits: 64 type: MT MCP cache: L2: 20 MiB 
           Speed: 5003 MHz min/max: 800/5300 MHz Core speeds (MHz): 1: 5003 2: 5000 3: 5008 
           4: 5011 5: 5006 6: 5001 7: 5002 8: 5001 9: 4990 10: 5001 11: 4998 12: 4999 13: 5015 
           14: 5000 15: 5001 16: 5001 17: 5005 18: 5001 19: 5010 20: 4997 
Graphics:  Device-1: ASPEED Graphics Family driver: ast v: kernel 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Comet Lake PCH cAVS driver: snd_hda_intel 
           Sound Server-1: ALSA v: k5.10.89 running: yes 
Network:   Device-1: Intel Ethernet I219-LM driver: e1000e 
           IF: eno1 state: down mac: 3c:ec:ef:2c:f5:54 
           Device-2: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core 
           IF: slave0 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           Device-3: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core 
           IF: slave1 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           Device-4: Intel I210 Gigabit Network driver: igb 
           IF: eno2 state: down mac: 3c:ec:ef:2c:f5:55 
           Device-5: Intel Ethernet 10G X550T driver: ixgbe 
           IF: eno3 state: down mac: 3c:ec:ef:30:36:5a 
           Device-6: Intel Ethernet 10G X550T driver: ixgbe 
           IF: eno4 state: down mac: 3c:ec:ef:30:36:5b 
           IF-ID-1: bond0 state: down mac: 42:82:14:0a:ce:8f 
           IF-ID-2: bond1 state: up speed: 20000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           IP v4: 131.159.102.1/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::f000:1/64 scope: global 
           IP v6: fe80::bace:f6ff:fe0b:ee64/64 scope: link 
           IF-ID-3: bonding_masters state: N/A speed: N/A duplex: N/A mac: N/A 
           IF-ID-4: br-9445ed3d463d state: down mac: 02:42:95:d9:31:e6 
           IP v4: 192.168.49.1/24 scope: global 
           IF-ID-5: cni0 state: up speed: 10000 Mbps duplex: unknown mac: ea:0f:1d:2e:ae:da 
           IP v4: 10.42.0.1/24 scope: global 
           IP v6: fe80::e80f:1dff:fe2e:aeda/64 scope: link 
           IF-ID-6: docker0 state: down mac: 02:42:7c:24:8f:ad 
           IP v4: 172.17.0.1/16 scope: global 
           IF-ID-7: eth0 state: down mac: b0:3a:f2:b6:05:9f 
           IF-ID-8: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.195/12 scope: global 
           IP v6: 42:0:3c46:87ed:6232:1016:7553:939c/12 scope: global 
           IP v6: fe80::1aa5:8c85:760c:500c/64 virtual: stable-privacy scope: link 
           IF-ID-9: veth5c6ddf05 state: up speed: 10000 Mbps duplex: full mac: 4e:a0:68:05:19:16 
           IF-ID-10: veth7925d3f1 state: up speed: 10000 Mbps duplex: full mac: 9e:f1:78:b8:27:39 
           IF-ID-11: vethb228609a state: up speed: 10000 Mbps duplex: full mac: 16:69:c7:35:35:e5 
           IF-ID-12: vethd9c54646 state: up speed: 10000 Mbps duplex: full mac: c2:07:4a:ea:25:37 
           IF-ID-13: vethe69a2198 state: up speed: 10000 Mbps duplex: full mac: 2e:a5:5a:c9:83:b4 
           IF-ID-14: vethfe70d733 state: up speed: 10000 Mbps duplex: full mac: 86:5a:b4:6e:48:0f 
           WAN IP: 131.159.102.1 
Bluetooth: Device-1: Linux 3.18.0 with ast_vhub RNDIS/Ethernet Gadget type: USB driver: rndis_host 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zpool1 type: zfs status: ONLINE level: linear size: 928 GiB free: 926 GiB 
           Components: Online: N/A 
           Device-2: zpool2 type: zfs status: ONLINE level: linear size: 14.5 TiB free: 14.5 TiB 
           Components: Online: N/A 
           Device-3: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 505 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 16.34 TiB usable: 32.61 TiB used: 309.57 GiB (0.9%) 
           ID-1: /dev/nvme0n1 vendor: Samsung model: SSD 970 EVO Plus 1TB size: 931.51 GiB 
           ID-2: /dev/sda vendor: Samsung model: MZ7LH960HAJR-00005 size: 894.25 GiB 
           ID-3: /dev/sdb vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           ID-4: /dev/sdc vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
Partition: ID-1: / size: 572.88 GiB used: 96.25 GiB (16.8%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 303.1 MiB (60.7%) fs: vfat dev: /dev/sda1 
           ID-3: /tmp size: 476.72 GiB used: 84.9 MiB (0.0%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 563 
           Uptime: 14:04:25  up 21 days  0:18,  0 users,  load average: 0.12, 0.21, 0.20 
           Memory: 125.68 GiB used: 42 GiB (33.4%) Init: systemd Client: Sudo inxi: 3.3.04 
```
