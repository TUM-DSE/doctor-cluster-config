# sauron.r

```
System:    Host: sauron Kernel: 5.15.12 x86_64 bits: 64 compiler: gcc v: 10.3.0 Console: N/A 
           Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Desktop System: ASUS product: N/A v: N/A serial: N/A 
           Mobo: ASUSTeK model: PRIME Z490-A v: Rev 1.xx serial: 200367367503004 
           UEFI: American Megatrends v: 0607 date: 05/29/2020 
Memory:    RAM: total: 62.52 GiB used: 22.83 GiB (36.5%) 
           Array-1: capacity: 64 GiB slots: 4 EC: None max-module-size: 16 GiB note: est. 
           Device-1: ChannelA-DIMM1 size: 16 GiB speed: 3000 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Corsair part-no: CMK64GX4M4D3000C16 
           serial: N/A 
           Device-2: ChannelA-DIMM2 size: 16 GiB speed: 3000 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Corsair part-no: CMK64GX4M4D3000C16 
           serial: N/A 
           Device-3: ChannelB-DIMM1 size: 16 GiB speed: 3000 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Corsair part-no: CMK64GX4M4D3000C16 
           serial: N/A 
           Device-4: ChannelB-DIMM2 size: 16 GiB speed: 3000 MT/s type: DDR4 detail: synchronous 
           bus-width: 64 bits total: 64 bits manufacturer: Corsair part-no: CMK64GX4M4D3000C16 
           serial: N/A 
PCI Slots: Slot: 0 type: x1 PCI Express PCIEX1_1 status: Available length: Short 
           Slot: 1 type: x16 PCI Express PCIEX16_1 status: Available length: Long 
           Slot: 2 type: x1 PCI Express PCIEX1_2 status: Available length: Short 
           Slot: 3 type: x8 PCI Express PCIEX16_2 status: In Use length: Long 
           Slot: 4 type: x1 PCI Express PCIEX1_3 status: Available length: Short 
           Slot: 5 type: x8 PCI Express PCIEX16_3 status: In Use length: Long 
CPU:       Info: 10-Core model: Intel Core i9-10900K bits: 64 type: MT MCP arch: Comet Lake rev: 5 
           cache: L1: 640 KiB L2: 20 MiB L3: 20 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 147994 
           Speed: 5088 MHz min/max: 800/5300 MHz volts: 1.0 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 5088 2: 5112 3: 5099 4: 5086 5: 5114 6: 5098 7: 5082 8: 5134 
           9: 5112 10: 5107 11: 5127 12: 5110 13: 5120 14: 5128 15: 5119 16: 5076 17: 5108 
           18: 5093 19: 5095 20: 5095 
Graphics:  Device-1: Intel CometLake-S GT2 [UHD Graphics 630] vendor: ASUSTeK driver: i915 
           v: kernel bus-ID: 00:02.0 chip-ID: 8086:9bc5 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Comet Lake PCH cAVS vendor: ASUSTeK driver: snd_hda_intel v: kernel 
           bus-ID: 00:1f.3 chip-ID: 8086:06c8 class-ID: 0403 
           Sound Server-1: ALSA v: k5.15.12 running: yes 
Network:   Device-1: Intel Ethernet XL710 for 40GbE QSFP+ driver: i40e v: kernel port: efa0 
           bus-ID: 02:00.0 chip-ID: 8086:1583 class-ID: 0200 
           IF: enp2s0f0 state: up speed: 40000 Mbps duplex: full mac: 9c:69:b4:60:b8:18 
           IP v4: 192.168.161.194/24 type: dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:4417:fc7c:feac:fd00/64 type: temporary dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:9e37:d798:34de:c405/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:1c0d:e771:edf:8ad6/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:1c3:bb73:d3a2:3a81/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:43aa:5b7f:f914:77f/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:4262:c90d:f768:a4ff/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:9ca7:d635:ba1:67f9/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:9e69:b4ff:fe60:b818/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80:942d:18ab:a4c9::7/64 scope: link 
           Message: Output throttled. IPs: 11; Limit: 10; Override: --limit [1-x;-1 all] 
           Device-2: Intel Ethernet XL710 for 40GbE QSFP+ driver: i40e v: kernel port: efa0 
           bus-ID: 02:00.1 chip-ID: 8086:1583 class-ID: 0200 
           IF: enp2s0f1 state: up speed: 40000 Mbps duplex: full mac: 9c:69:b4:60:b8:19 
           IP v4: 192.168.161.17/24 type: dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:1485:3085:9e8a:f70/64 type: temporary dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:a2a0:b925:90a8:9315/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:7989:8f29:16c5:1cb4/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:4afc:f66e:8917:4bb4/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:e74e:2712:5f46:6943/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:1f79:fc4c:e82b:61ce/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:19b4:f87e:ba03:1548/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:9e69:b4ff:fe60:b819/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80::9e69:b4ff:fe60:b819/64 scope: link 
           Device-3: Intel Ethernet I225-V vendor: ASUSTeK driver: igc v: kernel port: efa0 
           bus-ID: 06:00.0 chip-ID: 8086:15f3 class-ID: 0200 
           IF: enp6s0 state: up speed: 1000 Mbps duplex: full mac: d4:5d:64:b0:e8:a8 
           IP v4: 129.215.165.75/23 type: dynamic scope: global 
           IP v6: 2001:630:3c1:164:d9c6:9fb8:b6ab:74e7/64 type: temporary dynamic scope: global 
           IP v6: 2001:630:3c1:164:9cc8:8e57:a2d0:2a0d/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: 2001:630:3c1:164:9f1f:1162:19e3:403e/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: 2001:630:3c1:164:e7b5:43ab:6511:8efe/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: 2001:630:3c1:164:a431:dde7:36a2:e719/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: 2001:630:3c1:164:2066:fd70:ab1d:28ff/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: 2001:630:3c1:164:4c6a:d3c7:ee52:1b84/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: 2001:630:3c1:164:d65d:64ff:feb0:e8a8/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80:942d:18ab:a4c9::7/64 scope: link 
           Message: Output throttled. IPs: 11; Limit: 10; Override: --limit [1-x;-1 all] 
           IF-ID-1: docker0 state: down mac: 02:42:3b:93:16:0a 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.194/12 scope: global broadcast: 10.255.255.255 
           IP v6: 42:0:3c46:7f53:34b:ca31:16c2:da58/12 scope: global 
           IP v6: fe80::345e:e204:5580:d02f/64 virtual: stable-privacy scope: link 
           WAN IP: 129.215.165.75 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 928 GiB free: 573 GiB 
           allocated: 355 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 2.37 TiB usable: 3.27 TiB used: 644.9 GiB (19.3%) 
           ID-1: /dev/nvme0n1 vendor: Intel model: SSDPE2KE016T8 size: 1.46 TiB speed: 31.6 Gb/s 
           lanes: 4 rotation: SSD serial: PHLN003300DM1P6AGN rev: VDV10152 
           ID-2: /dev/sda vendor: Samsung model: SSD 860 EVO 1TB size: 931.51 GiB speed: 6.0 Gb/s 
           rotation: SSD serial: S3Z9NA0MC01825B rev: 4B6Q scheme: GPT 
Partition: ID-1: / size: 848.66 GiB used: 305.28 GiB (36.0%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 1022 MiB used: 481.6 MiB (47.1%) fs: vfat dev: /dev/sda1 
           ID-3: /home size: 721.65 GiB used: 339.15 GiB (47.0%) fs: nfs4 
           remote: [fd9a:5371:cd3f::1]:/home 
           ID-4: /tmp size: 543.38 GiB used: 256 KiB (0.0%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 326 
           Uptime: 14:47:11  up 21 days  0:41,  0 users,  load average: 0.01, 0.00, 0.00 
           wakeups: 0 Init: systemd v: 249 target: multi-user.target Compilers: gcc: 10.3.0 
           Packages: nix-sys: 456 Client: Sudo v: 1.9.7p2 inxi: 3.3.04 
```
