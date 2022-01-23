# bill

```
System:    Host: bill Kernel: 5.10.89 x86_64 bits: 64 compiler: gcc v: 10.3.0 Console: N/A 
           Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Desktop System: sysGen www.sysgen.de product: Super Server v: 0123456789 
           serial: 0123456789 Chassis: type: 3 v: 0123456789 serial: 0123456789 
           Mobo: Supermicro model: X12SCZ-TLN4F v: 1.01A serial: UM20BS000421 
           UEFI: American Megatrends v: 1.0a date: 01/11/2021 
Memory:    RAM: total: 125.68 GiB used: 41.92 GiB (33.4%) 
           RAM Report: missing: Required tool dmidecode not installed. Check --recommends 
PCI Slots: Missing: Required tool dmidecode not installed. Check --recommends 
CPU:       Info: 10-Core model: Intel Core i9-10900K bits: 64 type: MT MCP arch: Comet Lake rev: 5 
           cache: L2: 20 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 147994 
           Speed: 5078 MHz min/max: 800/5300 MHz Core speeds (MHz): 1: 5078 2: 5062 3: 5068 
           4: 5063 5: 5057 6: 5103 7: 5097 8: 5100 9: 5049 10: 5000 11: 5006 12: 5091 13: 5097 
           14: 5047 15: 5042 16: 5088 17: 5035 18: 5032 19: 5099 20: 5040 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 05:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Comet Lake PCH cAVS vendor: Super Micro driver: snd_hda_intel v: kernel 
           bus-ID: 00:1f.3 chip-ID: 8086:06c8 class-ID: 0403 
           Sound Server-1: ALSA v: k5.10.89 running: yes 
Network:   Device-1: Intel Ethernet I219-LM vendor: Super Micro driver: e1000e v: kernel 
           port: efa0 bus-ID: 00:1f.6 chip-ID: 8086:0d4c class-ID: 0200 
           IF: eno1 state: down mac: 3c:ec:ef:2c:f5:54 
           Device-2: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: 5.0-0 port: efa0 
           bus-ID: 02:00.0 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave0 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           Device-3: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: 5.0-0 port: efa0 
           bus-ID: 02:00.1 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave1 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           Device-4: Intel I210 Gigabit Network vendor: Super Micro driver: igb v: kernel 
           port: 4000 bus-ID: 03:00.0 chip-ID: 8086:1533 class-ID: 0200 
           IF: eno2 state: down mac: 3c:ec:ef:2c:f5:55 
           Device-5: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 3000 bus-ID: 06:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno3 state: down mac: 3c:ec:ef:30:36:5a 
           Device-6: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 3000 bus-ID: 06:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno4 state: down mac: 3c:ec:ef:30:36:5b 
           IF-ID-1: bond0 state: down mac: 42:82:14:0a:ce:8f 
           IF-ID-2: bond1 state: up speed: 20000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           IP v4: 131.159.102.1/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::f000:1/64 scope: global 
           IP v6: fe80::bace:f6ff:fe0b:ee64/64 scope: link 
           IF-ID-3: bonding_masters state: N/A speed: N/A duplex: N/A mac: N/A 
           IF-ID-4: br-9445ed3d463d state: down mac: 02:42:95:d9:31:e6 
           IP v4: 192.168.49.1/24 scope: global broadcast: 192.168.49.255 
           IF-ID-5: cni0 state: up speed: 10000 Mbps duplex: unknown mac: ea:0f:1d:2e:ae:da 
           IP v4: 10.42.0.1/24 scope: global broadcast: 10.42.0.255 
           IP v6: fe80::e80f:1dff:fe2e:aeda/64 scope: link 
           IF-ID-6: docker0 state: down mac: 02:42:7c:24:8f:ad 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-7: eth0 state: down mac: b0:3a:f2:b6:05:9f 
           IF-ID-8: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.195/12 scope: global broadcast: 10.255.255.255 
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
           v: kernel bus-ID: 1-13.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zpool1 type: zfs status: ONLINE level: linear size: 928 GiB free: 926 GiB 
           allocated: 2.08 GiB 
           Components: Online: N/A 
           Device-2: zpool2 type: zfs status: ONLINE level: linear size: 14.5 TiB free: 14.5 TiB 
           allocated: 3.27 GiB 
           Components: Online: N/A 
           Device-3: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 505 GiB 
           allocated: 383 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 16.34 TiB usable: 32.61 TiB used: 309.58 GiB (0.9%) 
           ID-1: /dev/nvme0n1 vendor: Samsung model: SSD 970 EVO Plus 1TB size: 931.51 GiB 
           speed: 31.6 Gb/s lanes: 4 rotation: SSD serial: S4EWNX0R513894H rev: 2B2QEXM7 
           temp: 24.9 C scheme: GPT 
           ID-2: /dev/sda vendor: Samsung model: MZ7LH960HAJR-00005 size: 894.25 GiB 
           speed: 6.0 Gb/s rotation: SSD serial: S45NNA0N901002 rev: 404Q scheme: GPT 
           ID-3: /dev/sdb vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           speed: 6.0 Gb/s rotation: 7200 rpm serial: VRJXEZ3K rev: 0A85 scheme: GPT 
           ID-4: /dev/sdc vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           speed: 6.0 Gb/s rotation: 7200 rpm serial: VRJ0MZ7K rev: 0A85 scheme: GPT 
Partition: ID-1: / size: 572.83 GiB used: 96.25 GiB (16.8%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 303.1 MiB (60.7%) fs: vfat dev: /dev/sda1 
           ID-3: /tmp size: 476.66 GiB used: 84.9 MiB (0.0%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 567 
           Uptime: 14:24:38  up 21 days  0:39,  0 users,  load average: 0.24, 0.25, 0.20 
           wakeups: 0 Init: systemd v: 249 target: multi-user.target Compilers: gcc: 10.3.0 
           Packages: nix-sys: 467 Client: Sudo v: 1.9.7p2 inxi: 3.3.04 
```
