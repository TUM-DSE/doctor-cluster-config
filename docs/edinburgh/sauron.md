# sauron

```
System:    Host: sauron Kernel: 5.15.34 x86_64 bits: 64 compiler: gcc v: 10.3.0 Console: N/A 
           Distro: NixOS 21.11 (Porcupine) 
Machine:   Type: Desktop System: ASUS product: N/A v: N/A serial: N/A 
           Mobo: ASUSTeK model: PRIME Z490-A v: Rev 1.xx serial: 200367367503004 
           UEFI: American Megatrends v: 0607 date: 05/29/2020 
Memory:    RAM: total: 62.52 GiB used: 57.8 GiB (92.5%) 
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
           Speed: 4901 MHz min/max: 800/5300 MHz volts: 1.0 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 4901 2: 4902 3: 4902 4: 4901 5: 4901 6: 4958 7: 5008 8: 4994 
           9: 4999 10: 4919 11: 4999 12: 5010 13: 5008 14: 4617 15: 5005 16: 4964 17: 4997 
           18: 5000 19: 4994 20: 5001 
Graphics:  Device-1: Intel CometLake-S GT2 [UHD Graphics 630] vendor: ASUSTeK driver: i915 
           v: kernel bus-ID: 00:02.0 chip-ID: 8086:9bc5 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Device-1: Intel Comet Lake PCH cAVS vendor: ASUSTeK driver: snd_hda_intel v: kernel 
           bus-ID: 00:1f.3 chip-ID: 8086:06c8 class-ID: 0403 
           Sound Server-1: ALSA v: k5.15.34 running: yes 
Network:   Device-1: Intel Ethernet XL710 for 40GbE QSFP+ driver: i40e v: kernel port: efa0 
           bus-ID: 02:00.0 chip-ID: 8086:1583 class-ID: 0200 
           IF: enp2s0f0 state: up speed: 40000 Mbps duplex: full mac: 9c:69:b4:60:b8:18 
           IP v4: 192.168.161.194/24 type: dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:1be8:4ff7:3cae:7862/64 type: temporary dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:4abb:a2d3:456b:6858/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:d091:8f10:756d:9446/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:9e69:b4ff:fe60:b818/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80::9e69:b4ff:fe60:b818/64 scope: link 
           Device-2: Intel Ethernet XL710 for 40GbE QSFP+ driver: i40e v: kernel port: efa0 
           bus-ID: 02:00.1 chip-ID: 8086:1583 class-ID: 0200 
           IF: enp2s0f1 state: up speed: 40000 Mbps duplex: full mac: 9c:69:b4:60:b8:19 
           IP v4: 192.168.161.17/24 type: dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:99c3:4cd8:5e72:9bb9/64 type: temporary dynamic scope: global 
           IP v6: fd9a:5371:cd3f:0:4951:1617:efe8:6a9d/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:3e72:9749:78d6:a583/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: fd9a:5371:cd3f:0:9e69:b4ff:fe60:b819/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80::9e69:b4ff:fe60:b819/64 scope: link 
           Device-3: Intel Ethernet I225-V vendor: ASUSTeK driver: igc v: kernel port: efa0 
           bus-ID: 06:00.0 chip-ID: 8086:15f3 class-ID: 0200 
           IF: enp6s0 state: up speed: 1000 Mbps duplex: full mac: d4:5d:64:b0:e8:a8 
           IP v4: 129.215.165.75/23 type: dynamic scope: global 
           IP v6: 2001:630:3c1:164:b36d:d959:8c15:5cac/64 type: temporary dynamic scope: global 
           IP v6: 2001:630:3c1:164:6a34:f193:d:7233/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: 2001:630:3c1:164:26fb:40ba:184c:4cb4/64 type: temporary deprecated dynamic 
           scope: global 
           IP v6: 2001:630:3c1:164:d65d:64ff:feb0:e8a8/64 type: dynamic mngtmpaddr noprefixroute 
           scope: global 
           IP v6: fe80::d65d:64ff:feb0:e8a8/64 scope: link 
           IF-ID-1: docker0 state: down mac: 02:42:54:e5:a6:a4 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v4: 10.243.29.194/12 scope: global broadcast: 10.255.255.255 
           IP v6: 42:0:3c46:7f53:34b:ca31:16c2:da58/12 scope: global 
           IP v6: fe80::38e4:a69f:8250:8e66/64 virtual: stable-privacy scope: link 
           WAN IP: 129.215.165.75 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 928 GiB free: 573 GiB 
           allocated: 355 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 2.37 TiB usable: 3.27 TiB used: 654.52 GiB (19.5%) 
           ID-1: /dev/nvme0n1 vendor: Intel model: SSDPE2KE016T8 size: 1.46 TiB speed: 31.6 Gb/s 
           lanes: 4 rotation: SSD serial: PHLN003300DM1P6AGN rev: VDV10152 
           ID-2: /dev/sda vendor: Samsung model: SSD 860 EVO 1TB size: 931.51 GiB speed: 6.0 Gb/s 
           rotation: SSD serial: S3Z9NA0MC01825B rev: 4B6Q scheme: GPT 
Partition: ID-1: / size: 838.23 GiB used: 295.35 GiB (35.2%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 1022 MiB used: 128.6 MiB (12.6%) fs: vfat dev: /dev/sda1 
           ID-3: /home size: 715.56 GiB used: 354.37 GiB (49.5%) fs: nfs4 
           remote: [fd9a:5371:cd3f::1]:/home 
           ID-4: /tmp size: 547.56 GiB used: 4.68 GiB (0.9%) fs: zfs logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 326 
           Uptime: 11:23:50  up 6 days 20:35,  0 users,  load average: 0.00, 0.00, 0.00 wakeups: 0 
           Init: systemd v: 249 target: multi-user.target Compilers: gcc: 10.3.0 Packages: 
           nix-sys: 456 Client: Sudo v: 1.9.7p2 inxi: 3.3.04 
```
![hardware topology](sauron.lstopo.svg)
