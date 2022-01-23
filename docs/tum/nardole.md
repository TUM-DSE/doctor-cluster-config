# nardole

```
System:    Host: nardole Kernel: 5.10.89 x86_64 bits: 64 Console: N/A 
           Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Desktop System: sysGen www.sysgen.de product: Super Server v: 0123456789 
           serial: 0123456789 
           Mobo: Supermicro model: X12SCZ-TLN4F v: 1.01A serial: UM20BS000427 
           UEFI: American Megatrends v: 1.0a date: 01/11/2021 
CPU:       Info: 10-Core model: Intel Core i9-10900K bits: 64 type: MT MCP cache: L2: 20 MiB 
           Speed: 5057 MHz min/max: 800/5300 MHz Core speeds (MHz): 1: 5057 2: 5035 3: 5065 
           4: 5010 5: 4994 6: 5051 7: 4998 8: 4989 9: 5085 10: 4988 11: 4945 12: 4940 13: 5044 
           14: 5054 15: 5041 16: 5047 17: 5044 18: 5095 19: 5025 20: 5061 
Graphics:  Device-1: ASPEED Graphics Family driver: ast v: kernel 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Comet Lake PCH cAVS driver: snd_hda_intel 
           Sound Server-1: ALSA v: k5.10.89 running: yes 
Network:   Device-1: Intel Ethernet I219-LM driver: e1000e 
           IF: eno1 state: down mac: 3c:ec:ef:2c:f5:14 
           Device-2: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core 
           IF: slave0 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           Device-3: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core 
           IF: slave1 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           Device-4: Intel I210 Gigabit Network driver: igb 
           IF: eno2 state: down mac: 3c:ec:ef:2c:f5:15 
           Device-5: Intel Ethernet 10G X550T driver: ixgbe 
           IF: eno3 state: down mac: 3c:ec:ef:30:36:1a 
           Device-6: Intel Ethernet 10G X550T driver: ixgbe 
           IF: eno4 state: down mac: 3c:ec:ef:30:36:1b 
           IF-ID-1: bond0 state: down mac: ba:ca:51:9d:bc:13 
           IF-ID-2: bond1 state: up speed: 20000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           IP v4: 131.159.102.2/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::f000:3/64 scope: global 
           IP v6: 2a09:80c0:102::f000:0/64 scope: global 
           IP v6: 2a09:80c0:102::2/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::bace:f6ff:fe0b:ee74/64 scope: link 
           IF-ID-3: bonding_masters state: N/A speed: N/A duplex: N/A mac: N/A 
           IF-ID-4: cni0 state: up speed: 10000 Mbps duplex: unknown mac: f6:eb:9b:cf:89:14 
           IP v4: 10.42.1.1/24 scope: global 
           IP v6: fe80::f4eb:9bff:fecf:8914/64 scope: link 
           IF-ID-5: docker0 state: down mac: 02:42:ea:1e:03:c3 
           IP v4: 172.17.0.1/16 scope: global 
           IF-ID-6: eth0 state: down mac: b0:3a:f2:b6:05:9f 
           IF-ID-7: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.173/12 scope: global 
           IP v6: 42:0:3c46:362d:a9aa:4996:c78e:839a/12 scope: global 
           IP v6: fe80::d596:44cf:175c:a7b2/64 virtual: stable-privacy scope: link 
           IF-ID-8: veth499cc1b2 state: up speed: 10000 Mbps duplex: full mac: 6e:8a:bd:0f:04:55 
           IF-ID-9: veth58bad7c2 state: up speed: 10000 Mbps duplex: full mac: ba:88:56:52:cd:fa 
           IF-ID-10: veth85fc6a71 state: up speed: 10000 Mbps duplex: full mac: d2:0a:78:18:9e:da 
           IF-ID-11: vethddef694c state: up speed: 10000 Mbps duplex: full mac: f6:65:d4:da:eb:2f 
           WAN IP: 131.159.102.2 
Bluetooth: Device-1: Linux 3.18.0 with ast_vhub RNDIS/Ethernet Gadget type: USB driver: rndis_host 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zpool1 type: zfs status: ONLINE level: linear size: 928 GiB free: 928 GiB 
           Components: Online: N/A 
           Device-2: zpool2 type: zfs status: ONLINE level: linear size: 14.5 TiB free: 14.5 TiB 
           Components: Online: N/A 
           Device-3: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 767 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 23.62 TiB usable: 39.89 TiB used: 97.64 GiB (0.2%) 
           ID-1: /dev/nvme0n1 vendor: Samsung model: SSD 970 EVO Plus 1TB size: 931.51 GiB 
           ID-2: /dev/sda vendor: Samsung model: MZ7LH960HAJR-00005 size: 894.25 GiB 
           ID-3: /dev/sdb vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           ID-4: /dev/sdc vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           ID-5: /dev/sdd vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
Partition: ID-1: / size: 831.65 GiB used: 93.1 GiB (11.2%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 418.7 MiB (83.8%) fs: vfat dev: /dev/sda1 
           ID-3: /tmp size: 738.82 GiB used: 282 MiB (0.0%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 565 
           Uptime: 14:04:36  up 16 days 17:25,  0 users,  load average: 0.02, 0.04, 0.00 
           Memory: 125.7 GiB used: 35.26 GiB (28.1%) Init: systemd Client: Sudo inxi: 3.3.04 
```
