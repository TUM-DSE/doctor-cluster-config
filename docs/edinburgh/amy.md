# amy.r

```
System:    Host: amy Kernel: 5.15.12 x86_64 bits: 64 compiler: gcc v: 10.3.0 Console: N/A 
           Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Desktop System: NOVATECH product: PC-BX20469 v: V1.0 serial: 7460986-001 Chassis: 
           type: 3 v: 1.0 serial: 7460986-001 
           Mobo: Gigabyte model: Z390 AORUS PRO-CF v: x.x serial: N/A UEFI: American Megatrends 
           v: F11 date: 10/15/2019 
Memory:    RAM: total: 62.55 GiB used: 53.58 GiB (85.7%) 
           Array-1: capacity: 64 GiB slots: 4 EC: None max-module-size: 16 GiB note: est. 
           Device-1: ChannelA-DIMM0 size: 16 GiB speed: 2666 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Crucial part-no: CT16G4DFD8266.M16FJ 
           serial: E2FBC3C0 
           Device-2: ChannelA-DIMM1 size: 16 GiB speed: 2666 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Crucial part-no: CT16G4DFD8266.M16FJ 
           serial: E2FBBE1A 
           Device-3: ChannelB-DIMM0 size: 16 GiB speed: 2666 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Crucial part-no: CT16G4DFD8266.M16FJ 
           serial: E2FBBE31 
           Device-4: ChannelB-DIMM1 size: 16 GiB speed: 2666 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Crucial part-no: CT16G4DFD8266.M16FJ 
           serial: E2FBBE52 
PCI Slots: Slot: 0 type: x16 PCI Express J6B2 status: In Use length: Long 
           Slot: 1 type: x1 PCI Express J6B1 status: In Use length: Short 
           Slot: 2 type: x1 PCI Express J6D1 status: In Use length: Short 
           Slot: 3 type: x1 PCI Express J7B1 status: In Use length: Short 
           Slot: 4 type: x1 PCI Express J8B4 status: In Use length: Short 
CPU:       Info: 8-Core model: Intel Core i9-9900K bits: 64 type: MT MCP arch: Kaby Lake 
           note: check rev: D cache: L1: 512 KiB L2: 16 MiB L3: 16 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 115200 
           Speed: 5012 MHz min/max: 800/5000 MHz volts: 1.2 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 5012 2: 4963 3: 3755 4: 1972 5: 4944 6: 5010 7: 5000 8: 5007 
           9: 5001 10: 5006 11: 5001 12: 4343 13: 4999 14: 5005 15: 5013 16: 5004 
Graphics:  Device-1: Intel CoffeeLake-S GT2 [UHD Graphics 630] vendor: Gigabyte driver: i915 
           v: kernel bus-ID: 00:02.0 chip-ID: 8086:3e98 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Cannon Lake PCH cAVS vendor: Gigabyte driver: snd_hda_intel v: kernel 
           bus-ID: 00:1f.3 chip-ID: 8086:a348 class-ID: 0403 
           Sound Server-1: ALSA v: k5.15.12 running: yes 
Network:   Device-1: Intel Ethernet I219-V vendor: Gigabyte driver: e1000e v: kernel port: efa0 
           bus-ID: 00:1f.6 chip-ID: 8086:15bc class-ID: 0200 
           IF: eno1 state: up speed: 1000 Mbps duplex: full mac: b4:2e:99:3e:d3:69 
           IP v4: 129.215.165.57/23 type: dynamic scope: global 
           IP v6: 2001:630:3c1:164:b62e:99ff:fe3e:d369/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80:942d:18ab:a4c9::1/64 scope: link 
           IP v6: fe80::b62e:99ff:fe3e:d369/64 scope: link 
           Device-2: Intel Ethernet XL710 for 40GbE QSFP+ driver: i40e v: kernel port: efa0 
           bus-ID: 02:00.0 chip-ID: 8086:1583 class-ID: 0200 
           IF: enp2s0f0 state: up speed: 40000 Mbps duplex: full mac: 9c:69:b4:60:ba:cc 
           IP v4: 192.168.161.1/24 scope: global broadcast: 192.168.161.255 
           IP v6: fd9a:5371:cd3f::1/64 scope: global 
           IP v6: fe80::9e69:b4ff:fe60:bacc/64 scope: link 
           Device-3: Intel Ethernet XL710 for 40GbE QSFP+ driver: igb_uio v: kernel port: efa0 
           bus-ID: 02:00.1 chip-ID: 8086:1583 class-ID: 0200 
           IF-ID-1: br-67214bd56291 state: down mac: 02:42:2e:01:63:bc 
           IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255 
           IF-ID-2: br-6f19172222d3 state: down mac: 02:42:e3:6e:86:d0 
           IP v4: 172.24.0.1/16 scope: global broadcast: 172.24.255.255 
           IF-ID-3: br-7f4d19a9954a state: down mac: 02:42:3e:0d:70:2c 
           IP v4: 192.168.0.1/20 scope: global broadcast: 192.168.15.255 
           IF-ID-4: br-bcdb1b31d8a4 state: down mac: 02:42:49:4d:55:62 
           IP v4: 172.19.0.1/16 scope: global broadcast: 172.19.255.255 
           IF-ID-5: docker0 state: down mac: 02:42:8b:53:34:89 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-6: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.181/12 scope: global broadcast: 10.255.255.255 
           IP v6: 42:0:3c46:1551:1906:bc7c:801f:3c4/12 scope: global 
           IP v6: fe80::f67c:db3a:3e62:4ac2/64 virtual: stable-privacy scope: link 
           WAN IP: 129.215.165.57 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 410 GiB 
           allocated: 478 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 2.33 TiB usable: 3.2 TiB used: 435.84 GiB (13.3%) 
           ID-1: /dev/nvme0n1 vendor: Samsung model: MZPLL1T6HAJQ-00005 size: 1.46 TiB 
           rotation: SSD serial: S4CBNA0M904915 rev: GPJA2B3Q 
           ID-2: /dev/sda vendor: Kingston model: SA400S37960G size: 894.25 GiB speed: 6.0 Gb/s 
           rotation: SSD serial: 50026B7682C2E29E rev: 61F1 scheme: GPT 
Partition: ID-1: / size: 478.65 GiB used: 96.11 GiB (20.1%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 353.2 MiB (70.7%) fs: vfat dev: /dev/sda1 
           ID-3: /home size: 721.7 GiB used: 339.15 GiB (47.0%) fs: zfs logical: zroot/root/home 
           ID-4: /tmp size: 382.79 GiB used: 251.1 MiB (0.1%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 333 
           Uptime: 14:45:40  up 15 days 14:28,  2 users,  load average: 0.08, 0.02, 0.01 
           wakeups: 0 Init: systemd v: 249 target: multi-user.target Compilers: gcc: 10.3.0 
           Packages: nix-sys: 474 Client: Sudo v: 1.9.7p2 inxi: 3.3.04 
```
