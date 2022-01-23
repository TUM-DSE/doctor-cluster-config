# clara.r

```
System:    Host: clara Kernel: 5.15.14 x86_64 bits: 64 compiler: gcc v: 10.3.0 Console: N/A 
           Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Desktop System: NOVATECH product: PC-BX20469 v: V1.0 serial: 7460986-002 Chassis: 
           type: 3 v: 1.0 serial: 7460986-002 
           Mobo: Gigabyte model: Z390 AORUS PRO-CF v: x.x serial: N/A UEFI: American Megatrends 
           v: F11 date: 10/15/2019 
Memory:    RAM: total: 62.56 GiB used: 7.1 GiB (11.4%) 
           Array-1: capacity: 64 GiB slots: 4 EC: None max-module-size: 16 GiB note: est. 
           Device-1: ChannelA-DIMM0 size: 16 GiB speed: 2666 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Crucial part-no: CT16G4DFD8266.M16FJ 
           serial: E2FBBE40 
           Device-2: ChannelA-DIMM1 size: 16 GiB speed: 2666 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Crucial part-no: CT16G4DFD8266.M16FJ 
           serial: E2FBC3BF 
           Device-3: ChannelB-DIMM0 size: 16 GiB speed: 2666 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Crucial part-no: CT16G4DFD8266.M16FJ 
           serial: E2FBB89F 
           Device-4: ChannelB-DIMM1 size: 16 GiB speed: 2666 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Crucial part-no: CT16G4DFD8266.M16FJ 
           serial: E2FBBE35 
PCI Slots: Slot: 0 type: x16 PCI Express J6B2 status: In Use length: Long 
           Slot: 1 type: x1 PCI Express J6B1 status: In Use length: Short 
           Slot: 2 type: x1 PCI Express J6D1 status: In Use length: Short 
           Slot: 3 type: x1 PCI Express J7B1 status: In Use length: Short 
           Slot: 4 type: x1 PCI Express J8B4 status: In Use length: Short 
CPU:       Info: 8-Core model: Intel Core i9-9900K bits: 64 type: MT MCP arch: Kaby Lake 
           note: check rev: D cache: L1: 512 KiB L2: 16 MiB L3: 16 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 115200 
           Speed: 4917 MHz min/max: 800/5000 MHz volts: 1.2 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 4917 2: 4910 3: 4894 4: 4782 5: 4920 6: 4903 7: 4936 8: 5009 
           9: 5001 10: 5002 11: 4833 12: 4857 13: 4998 14: 5013 15: 4856 16: 5009 
Graphics:  Device-1: Intel CoffeeLake-S GT2 [UHD Graphics 630] vendor: Gigabyte driver: i915 
           v: kernel bus-ID: 00:02.0 chip-ID: 8086:3e98 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Cannon Lake PCH cAVS vendor: Gigabyte driver: snd_hda_intel v: kernel 
           bus-ID: 00:1f.3 chip-ID: 8086:a348 class-ID: 0403 
           Sound Server-1: ALSA v: k5.15.14 running: yes 
Network:   Device-1: Intel Ethernet I219-V vendor: Gigabyte driver: e1000e v: kernel port: efa0 
           bus-ID: 00:1f.6 chip-ID: 8086:15bc class-ID: 0200 
           IF: eno1 state: up speed: 1000 Mbps duplex: full mac: b4:2e:99:3d:70:f2 
           IP v4: 129.215.165.58/23 type: dynamic scope: global 
           IP v6: 2001:630:3c1:164:b62e:99ff:fe3d:70f2/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80::b62e:99ff:fe3d:70f2/64 scope: link 
           Device-2: Intel Ethernet XL710 for 40GbE QSFP+ driver: i40e v: kernel port: efa0 
           bus-ID: 02:00.0 chip-ID: 8086:1583 class-ID: 0200 
           IF: enp2s0f0 state: up speed: 40000 Mbps duplex: full mac: 9c:69:b4:60:b8:6c 
           IP v4: 192.168.161.253/24 type: dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:9e69:b4ff:fe60:b86c/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80::9e69:b4ff:fe60:b86c/64 scope: link 
           Device-3: Intel Ethernet XL710 for 40GbE QSFP+ driver: i40e v: kernel port: efa0 
           bus-ID: 02:00.1 chip-ID: 8086:1583 class-ID: 0200 
           IF: enp2s0f1 state: up speed: 40000 Mbps duplex: full mac: 9c:69:b4:60:b8:6d 
           IP v4: 192.168.161.162/24 type: dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:9e69:b4ff:fe60:b86d/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80::9e69:b4ff:fe60:b86d/64 scope: link 
           IF-ID-1: docker0 state: down mac: 02:42:1b:12:20:89 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.182/12 scope: global broadcast: 10.255.255.255 
           IP v6: 42:0:3c46:e4e9:7814:459b:3f23:f455/12 scope: global 
           IP v6: fe80::150e:563b:7301:607b/64 virtual: stable-privacy scope: link 
           WAN IP: 129.215.165.58 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 782 GiB 
           allocated: 106 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 2.33 TiB usable: 3.2 TiB used: 418.21 GiB (12.8%) 
           ID-1: /dev/nvme0n1 vendor: Samsung model: MZPLL1T6HAJQ-00005 size: 1.46 TiB 
           rotation: SSD serial: S4CBNA0M904931 rev: GPJA2B3Q 
           ID-2: /dev/sda vendor: Kingston model: SA400S37960G size: 894.25 GiB speed: 6.0 Gb/s 
           rotation: SSD serial: 50026B7682C2E2D4 rev: 61F1 scheme: GPT 
Partition: ID-1: / size: 833.56 GiB used: 78.93 GiB (9.5%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 499.7 MiB used: 127.4 MiB (25.5%) fs: vfat dev: /dev/sda1 
           ID-3: /home size: 721.7 GiB used: 339.15 GiB (47.0%) fs: nfs4 
           remote: [fd9a:5371:cd3f::1]:/home 
           ID-4: /tmp size: 754.62 GiB used: 256 KiB (0.0%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 299 
           Uptime: 14:44:52  up 1 day  5:02,  0 users,  load average: 0.09, 0.02, 0.01 wakeups: 0 
           Init: systemd v: 249 target: multi-user.target Compilers: gcc: 10.3.0 Packages: 
           nix-sys: 456 Client: Sudo v: 1.9.7p2 inxi: 3.3.04 
```
