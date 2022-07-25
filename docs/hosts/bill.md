# bill

```
System:    Host: bill Kernel: 5.15.49 x86_64 bits: 64 compiler: gcc v: 11.3.0 Console: N/A 
           Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Desktop System: sysGen www.sysgen.de product: Super Server v: 0123456789 
           serial: 0123456789 Chassis: type: 3 v: 0123456789 serial: 0123456789 
           Mobo: Supermicro model: X12SCZ-TLN4F v: 1.01A serial: UM20BS000421 
           UEFI: American Megatrends v: 1.0a date: 01/11/2021 
Memory:    RAM: total: 125.68 GiB used: 26.23 GiB (20.9%) 
           Array-1: capacity: 128 GiB note: est. slots: 4 EC: None max-module-size: 32 GiB 
           note: est. 
           Device-1: DIMMA1 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 735171F0 
           Device-2: DIMMA2 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 041229CA 
           Device-3: DIMMB1 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 7C516948 
           Device-4: DIMMB2 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 735211C0 
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
           Speed: 5104 MHz min/max: 800/5300 MHz volts: 1.0 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 5104 2: 5118 3: 5102 4: 5105 5: 5106 6: 5102 7: 5310 8: 5141 
           9: 5108 10: 5118 11: 5106 12: 5107 13: 1538 14: 5112 15: 5312 16: 5297 17: 5103 
           18: 5097 19: 1070 20: 5100 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 05:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Comet Lake PCH cAVS vendor: Super Micro driver: snd_hda_intel v: kernel 
           bus-ID: 00:1f.3 chip-ID: 8086:06c8 class-ID: 0403 
           Sound Server-1: ALSA v: k5.15.49 running: yes 
Network:   Device-1: Intel Ethernet I219-LM vendor: Super Micro driver: e1000e v: kernel 
           port: efa0 bus-ID: 00:1f.6 chip-ID: 8086:0d4c class-ID: 0200 
           IF: eno1 state: down mac: 3c:ec:ef:2c:f5:54 
           Device-2: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: kernel 
           port: efa0 bus-ID: 02:00.0 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave0 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           Device-3: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: kernel 
           port: efa0 bus-ID: 02:00.1 chip-ID: 15b3:1015 class-ID: 0200 
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
           IF-ID-1: bond1 state: up speed: 20000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           IP v4: 131.159.102.1/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::f000:1/64 scope: global 
           IP v6: 2a09:80c0:102::1/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::bace:f6ff:fe0b:ee64/64 scope: link 
           IF-ID-2: bonding_masters state: N/A speed: N/A duplex: N/A mac: N/A 
           IF-ID-3: br-9445ed3d463d state: down mac: 02:42:8d:10:7f:16 
           IP v4: 192.168.49.1/24 scope: global broadcast: 192.168.49.255 
           IF-ID-4: docker0 state: down mac: 02:42:66:f8:4a:20 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:66ff:fef8:4a20/64 scope: link 
           IF-ID-5: eth0 state: down mac: b0:3a:f2:b6:05:9f 
           IF-ID-6: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:87ed:6232:1016:7553:939c/12 scope: global 
           IP v6: fe80::9dbd:ed04:89bb:b567/64 virtual: stable-privacy scope: link 
           WAN IP: 131.159.102.1 
Bluetooth: Device-1: Linux 3.18.0 with ast_vhub RNDIS/Ethernet Gadget type: USB driver: rndis_host 
           v: kernel bus-ID: 1-13.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zpool1 type: zfs status: ONLINE level: linear size: 928 GiB free: 518 GiB 
           allocated: 410 GiB 
           Components: Online: N/A 
           Device-2: zpool2 type: zfs status: ONLINE level: linear size: 14.5 TiB free: 14.3 TiB 
           allocated: 206 GiB 
           Components: Online: N/A 
           Device-3: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 745 GiB 
           allocated: 143 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 16.34 TiB usable: 32.61 TiB used: 92.86 GiB (0.3%) 
           ID-1: /dev/nvme0n1 vendor: Samsung model: SSD 970 EVO Plus 1TB size: 931.51 GiB 
           speed: 31.6 Gb/s lanes: 4 rotation: SSD serial: S4EWNX0R513894H rev: 2B2QEXM7 
           scheme: GPT 
           ID-2: /dev/sda vendor: Samsung model: MZ7LH960HAJR-00005 size: 894.25 GiB 
           speed: 6.0 Gb/s rotation: SSD serial: S45NNA0N901002 rev: 404Q scheme: GPT 
           ID-3: /dev/sdb vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           speed: 6.0 Gb/s rotation: 7200 rpm serial: VRJXEZ3K rev: 0A85 scheme: GPT 
           ID-4: /dev/sdc vendor: Western Digital model: WD80EFBX-68AZZN0 size: 7.28 TiB 
           speed: 6.0 Gb/s rotation: 7200 rpm serial: VRJ0MZ7K rev: 0A85 scheme: GPT 
Partition: ID-1: / size: 808.99 GiB used: 92.52 GiB (11.4%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 109.1 MiB (21.8%) fs: vfat dev: /dev/sda1 
           ID-3: /tmp size: 716.7 GiB used: 236 MiB (0.0%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 523 
           Uptime: 09:25:11  up 24 days  1:10,  0 users,  load average: 0.17, 0.04, 0.01 
           wakeups: 0 Init: systemd v: 250 target: multi-user.target Compilers: gcc: 11.3.0 
           Packages: nix-sys: 454 Client: Sudo v: 1.9.10 inxi: 3.3.04 
```
![hardware topology](bill.lstopo.svg)
