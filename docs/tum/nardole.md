# nardole

```
System:    Host: nardole Kernel: 5.10.96 x86_64 bits: 64 compiler: gcc v: 10.3.0 Console: N/A 
           Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Desktop System: sysGen www.sysgen.de product: Super Server v: 0123456789 
           serial: 0123456789 Chassis: type: 3 v: 0123456789 serial: 0123456789 
           Mobo: Supermicro model: X12SCZ-TLN4F v: 1.01A serial: UM20BS000427 
           UEFI: American Megatrends v: 1.0a date: 01/11/2021 
Memory:    RAM: total: 125.7 GiB used: 22.31 GiB (17.7%) 
           Array-1: capacity: 128 GiB note: est. slots: 4 EC: None max-module-size: 32 GiB 
           note: est. 
           Device-1: DIMMA1 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 825151A9 
           Device-2: DIMMA2 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 735150BB 
           Device-3: DIMMB1 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 735171CE 
           Device-4: DIMMB2 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 041171D8 
PCI Slots: Slot: 4 type: x4 PCI Express 3 x8 PCH SLOT4 PCI-E 3.0 X4 (IN X8) status: In Use 
           length: Short 
           Slot: 6 type: x16 PCI Express 3 x16 CPU SLOT6 PCI-E 3.0 X16 status: In Use length: Long 
           Slot: 7 type: x4 PCI Express 3 x4 PCH SLOT7 PCI-E 3.0 X4 status: Available 
           length: Short 
           Slot: N/A type: x4 M.2 Socket 3 PCI-E M.2-M1 status: Available length: Short 
           Slot: N/A type: x1 M.2 Socket 1-SD PCI-E M.2-E1 status: Available length: Short 
CPU:       Info: 10-Core model: Intel Core i9-10900K bits: 64 type: MT MCP arch: Comet Lake rev: 5 
           cache: L1: 640 KiB L2: 20 MiB L3: 20 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 147994 
           Speed: 5009 MHz min/max: 800/5300 MHz volts: 1.0 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 5009 2: 4989 3: 5002 4: 1893 5: 5012 6: 3982 7: 5000 8: 4503 
           9: 5000 10: 4999 11: 3539 12: 5004 13: 5006 14: 3306 15: 2507 16: 3065 17: 4230 
           18: 5003 19: 4735 20: 1989 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 05:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Comet Lake PCH cAVS vendor: Super Micro driver: snd_hda_intel v: kernel 
           bus-ID: 00:1f.3 chip-ID: 8086:06c8 class-ID: 0403 
           Sound Server-1: ALSA v: k5.10.96 running: yes 
Network:   Device-1: Intel Ethernet I219-LM vendor: Super Micro driver: e1000e v: kernel 
           port: efa0 bus-ID: 00:1f.6 chip-ID: 8086:0d4c class-ID: 0200 
           IF: eno1 state: down mac: 3c:ec:ef:2c:f5:14 
           Device-2: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: 5.0-0 port: efa0 
           bus-ID: 02:00.0 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave0 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           Device-3: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: 5.0-0 port: efa0 
           bus-ID: 02:00.1 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave1 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           Device-4: Intel I210 Gigabit Network vendor: Super Micro driver: igb v: kernel 
           port: 4000 bus-ID: 03:00.0 chip-ID: 8086:1533 class-ID: 0200 
           IF: eno2 state: down mac: 3c:ec:ef:2c:f5:15 
           Device-5: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 3000 bus-ID: 06:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno3 state: down mac: 3c:ec:ef:30:36:1a 
           Device-6: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 3000 bus-ID: 06:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno4 state: down mac: 3c:ec:ef:30:36:1b 
           IF-ID-1: bond0 state: down mac: ba:ca:51:9d:bc:13 
           IF-ID-2: bond1 state: up speed: 20000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           IP v4: 131.159.102.2/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::f000:0/64 scope: global 
           IP v6: 2a09:80c0:102::2/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::bace:f6ff:fe0b:ee74/64 scope: link 
           IF-ID-3: bonding_masters state: N/A speed: N/A duplex: N/A mac: N/A 
           IF-ID-4: cni0 state: up speed: 10000 Mbps duplex: unknown mac: 32:7f:09:05:12:70 
           IP v4: 10.42.1.1/24 scope: global broadcast: 10.42.1.255 
           IP v6: fe80::307f:9ff:fe05:1270/64 scope: link 
           IF-ID-5: docker0 state: down mac: 02:42:5b:df:81:66 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-6: eth0 state: down mac: b0:3a:f2:b6:05:9f 
           IF-ID-7: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:362d:a9aa:4996:c78e:839a/12 scope: global 
           IP v6: fe80::9eea:2071:f3b2:7e9b/64 virtual: stable-privacy scope: link 
           IF-ID-8: veth0657d0b7 state: up speed: 10000 Mbps duplex: full mac: f6:04:7b:a9:9e:7f 
           IF-ID-9: veth14c35a13 state: up speed: 10000 Mbps duplex: full mac: 62:ac:a1:73:7f:23 
           IF-ID-10: veth64e0e1ef state: up speed: 10000 Mbps duplex: full mac: f6:92:97:85:5f:9b 
           IF-ID-11: veth69a6bf45 state: up speed: 10000 Mbps duplex: full mac: 02:33:2e:fb:00:7c 
           IF-ID-12: veth77cfbc0f state: up speed: 10000 Mbps duplex: full mac: d2:9b:5a:60:63:18 
           IF-ID-13: veth8154da34 state: up speed: 10000 Mbps duplex: full mac: e6:68:54:1a:63:49 
           IF-ID-14: veth8cab6a54 state: up speed: 10000 Mbps duplex: full mac: da:37:ca:cf:60:66 
           IF-ID-15: vethfe59fbac state: up speed: 10000 Mbps duplex: full mac: 6a:a0:57:e3:36:17 
           WAN IP: 131.159.102.2 
Bluetooth: Device-1: Linux 3.18.0 with ast_vhub RNDIS/Ethernet Gadget type: USB driver: rndis_host 
           v: kernel bus-ID: 1-13.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zpool1 type: zfs status: ONLINE level: linear size: 928 GiB free: 446 GiB 
           allocated: 482 GiB 
           Components: Online: N/A 
           Device-2: zpool2 type: zfs status: ONLINE level: linear size: 14.5 TiB free: 14.4 TiB 
           allocated: 150 GiB 
           Components: Online: N/A 
           Device-3: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 772 GiB 
           allocated: 116 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 23.62 TiB usable: 39.89 TiB used: 713.58 GiB (1.7%) 
           ID-1: /dev/nvme0n1 vendor: Samsung model: SSD 970 EVO Plus 1TB size: 931.51 GiB 
           speed: 31.6 Gb/s lanes: 4 rotation: SSD serial: S4EWNX0R410276D rev: 2B2QEXM7 
           temp: 51.9 C scheme: GPT 
           ID-2: /dev/sda vendor: Samsung model: MZ7LH960HAJR-00005 size: 894.25 GiB 
           speed: 6.0 Gb/s rotation: SSD serial: S45NNA0N900985 rev: 404Q scheme: GPT 
           ID-3: /dev/sdb vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           speed: 6.0 Gb/s rotation: 7200 rpm serial: VRJ0RM2K rev: 0A85 scheme: GPT 
           ID-4: /dev/sdc vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           speed: 6.0 Gb/s rotation: 7200 rpm serial: VRHZGW5K rev: 0A85 scheme: GPT 
           ID-5: /dev/sdd vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           speed: 6.0 Gb/s rotation: 7200 rpm serial: VRJ0HPEK rev: 0A85 scheme: GPT 
Partition: ID-1: / size: 825.94 GiB used: 82.05 GiB (9.9%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 150.1 MiB (30.0%) fs: vfat dev: /dev/sda1 
           ID-3: /tmp size: 743.96 GiB used: 74.6 MiB (0.0%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 578 Uptime: 5h 39m wakeups: 0 Init: systemd v: 249 target: multi-user.target 
           Compilers: gcc: 10.3.0 Packages: nix-sys: 496 Client: Sudo v: 1.9.7p2 inxi: 3.3.04 
```
![hardware topology](nardole.lstopo.svg)
