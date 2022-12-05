# yasmin

```
System:    Host: yasmin Kernel: 5.15.79 aarch64 bits: 64 compiler: gcc v: 9.3.0 
           parameters: BOOT_IMAGE=(hd3,gpt1)//kernels/1irf7fw7in9xzkznjn67dj3sl63kk65m-linux-5.15.79-Image 
           init=/nix/store/81djs8vafmamnz2hry2hgdsknn8w6399-nixos-system-yasmin-22.05.20221121.41c6fb2/init 
           console=ttyS0,115200n8 console=tty0 console=ttyS0,115200n8 console=ttyAMA0,115200n8 
           console=tty0 panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Server System: GIGABYTE product: R181-T90-00 v: 0100 serial: GLG4NN012A0002 
           Chassis: type: 23 v: 1.0 serial: 01234567890123456789AB 
           Mobo: GIGABYTE model: MT91-FS1-00 v: 00030101 serial: JH6N6700014 UEFI: GIGABYTE v: F34 
           date: 08/13/2020 
Memory:    RAM: total: 251.27 GiB used: 34.78 GiB (13.8%) 
           Array-1: capacity: 2 TiB slots: 12 EC: Multi-bit ECC max-module-size: 170.67 GiB 
           note: est. 
           Device-1: DIMM_P0_A0 size: 64 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: registered (buffered) bus-width: 64 bits total: 72 bits manufacturer: Samsung 
           part-no: M393A8G40AB2-CWE serial: 1158043522 
           Device-2: DIMM_P0_B0 size: 64 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: registered (buffered) bus-width: 64 bits total: 72 bits manufacturer: Samsung 
           part-no: M393A8G40AB2-CWE serial: 1158043450 
           Array-2: capacity: 2 TiB slots: 12 EC: Multi-bit ECC max-module-size: 170.67 GiB 
           note: est. 
           Device-1: DIMM_P1_I0 size: 64 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: registered (buffered) bus-width: 64 bits total: 72 bits manufacturer: Samsung 
           part-no: M393A8G40AB2-CWE serial: 1158043569 
           Device-2: DIMM_P1_J0 size: 64 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: registered (buffered) bus-width: 64 bits total: 72 bits manufacturer: Samsung 
           part-no: M393A8G40AB2-CWE serial: 27077680 
PCI Slots: Slot: 0 type: x16 PCI Express 3 OCP_1_x16 status: Available length: Short 
           Slot: 4 type: x8 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x8 status: Available 
           length: Short 
           Slot: 6 type: x4 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x4 status: In Use 
           length: Short 
           Slot: 7 type: x4 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x4 status: Available 
           length: Short 
           Slot: 8 type: x8 PCI Express 3 PCIE SLOT2_2_x8 status: Available length: Short 
           Slot: 10 type: x4 PCI Express 3 LoM QL41102 status: In Use length: Short 
           Slot: 12 type: x8 PCI Express 3 LSI 3008 status: In Use length: Short 
           Slot: 14 type: x16 PCI Express 3 OCP_2_x16 status: Available length: Long 
           Slot: 18 type: x16 PCI Express 3 PCIE SLOT3_1_x16 status: Available length: Long 
           Slot: 26 type: x8 PCI Express 3 PCIE SLOT3_2_x8 status: Available length: Short 
           Slot: 22 type: x16 PCI Express 3 PCIE SLOT4_x16 status: Available length: Long 
CPU:       Info: 224-Core (2-Die) model: N/A bits: 64 type: MCP MCM arch: ARMv8 family: 8 
           model-id: 1 stepping: 2 
           features: Use -f option to see features bogomips: 89600 
           Speed: 1950 MHz min/max: 1000/2000 MHz base/boost: 2000/2500 boost: disabled 
           volts: 0.8 V ext-clock: 33 MHz Core speeds (MHz): 1: 1230 2: 1050 3: 1900 4: 1120 
           5: 1000 6: 1150 7: 1130 8: 1000 9: 1130 10: 1190 11: 1380 12: 1160 13: 1060 14: 1350 
           15: 1220 16: 1140 17: 1510 18: 1030 19: 1040 20: 1460 21: 1890 22: 1030 23: 1780 
           24: 1100 25: 1070 26: 1000 27: 1950 28: 1070 29: 1700 30: 1940 31: 1010 32: 1610 
           33: 1190 34: 1080 35: 1610 36: 1920 37: 1630 38: 1000 39: 1660 40: 1330 41: 1010 
           42: 1110 43: 1580 44: 1950 45: 1000 46: 1000 47: 1900 48: 1510 49: 1030 50: 1040 
           51: 1460 52: 1890 53: 1030 54: 1780 55: 1100 56: 1000 57: 1950 58: 1200 59: 1070 
           60: 1700 61: 1940 62: 1010 63: 1610 64: 1190 65: 1080 66: 1610 67: 1630 68: 1000 
           69: 1120 70: 1660 71: 1330 72: 1010 73: 1110 74: 1580 75: 1950 76: 1000 77: 1000 
           78: 1510 79: 1030 80: 1000 81: 1040 82: 1460 83: 1890 84: 1030 85: 1780 86: 1100 
           87: 1000 88: 1950 89: 1070 90: 1700 91: 1280 92: 1940 93: 1010 94: 1610 95: 1190 
           96: 1080 97: 1610 98: 1630 99: 1000 100: 1660 101: 1330 102: 1130 103: 1010 104: 1110 
           105: 1580 106: 1950 107: 1000 108: 1000 109: 1510 110: 1030 111: 1040 112: 1460 
           113: 1840 114: 1000 115: 1890 116: 1030 117: 1780 118: 1100 119: 1000 120: 1950 
           121: 1070 122: 1700 123: 1940 124: 1010 125: 1130 126: 1610 127: 1190 128: 1080 
           129: 1610 130: 1630 131: 1000 132: 1660 133: 1330 134: 1010 135: 1110 136: 1190 
           137: 1580 138: 1950 139: 1000 140: 1000 141: 1380 142: 1160 143: 1060 144: 1220 
           145: 1140 146: 1230 147: 1050 148: 1130 149: 1840 150: 1130 151: 1150 152: 1040 
           153: 1400 154: 1110 155: 1260 156: 1090 157: 1900 158: 1350 159: 1150 160: 1070 
           161: 1920 162: 1900 163: 1200 164: 1120 165: 1000 166: 1280 167: 1130 168: 1000 
           169: 1130 170: 1040 171: 1190 172: 1380 173: 1160 174: 1060 175: 1220 176: 1140 
           177: 1230 178: 1050 179: 1840 180: 1130 181: 1400 182: 1150 183: 1040 184: 1400 
           185: 1110 186: 1260 187: 1090 188: 1900 189: 1350 190: 1070 191: 1920 192: 1110 
           193: 1900 194: 1200 195: 1120 196: 1000 197: 1280 198: 1130 199: 1000 200: 1130 
           201: 1190 202: 1380 203: 1260 204: 1160 205: 1060 206: 1220 207: 1140 208: 1230 
           209: 1050 210: 1840 211: 1130 212: 1150 213: 1040 214: 1090 215: 1400 216: 1110 
           217: 1260 218: 1090 219: 1900 220: 1350 221: 1070 222: 1920 223: 1900 224: 1200 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data status: Not affected 
           Type: retbleed status: Not affected 
           Type: spec_store_bypass status: Vulnerable 
           Type: spectre_v1 mitigation: __user pointer sanitization 
           Type: spectre_v2 status: Vulnerable 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family driver: ast v: kernel bus-ID: 0e:00.0 
           chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
           Sound Server-1: ALSA v: k5.15.79 running: yes 
Network:   Device-1: QLogic FastLinQ QL41000 Series 10/25/40/50GbE vendor: Gigabyte driver: qede 
           v: kernel port: N/A bus-ID: 0b:00.0 chip-ID: 1077:8070 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: b4:2e:99:3f:74:7c 
           IP v4: 131.159.102.7/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::7/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::b62e:99ff:fe3f:747c/64 scope: link 
           Device-2: QLogic FastLinQ QL41000 Series 10/25/40/50GbE vendor: Gigabyte driver: qede 
           v: kernel port: N/A bus-ID: 0b:00.1 chip-ID: 1077:8070 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: b4:2e:99:3f:74:7c 
           IP v4: 131.159.102.7/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::7/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::b62e:99ff:fe3f:747c/64 scope: link 
           Device-3: American Megatrends Virtual Ethernet type: USB driver: cdc_ether 
           bus-ID: 3-1.3:5 chip-ID: 046b:ffb0 class-ID: 0a00 serial: 1234567890 
           IF: enp0s15f1u1u3c2 state: unknown speed: -1 duplex: half mac: 16:d4:72:2c:21:77 
           IP v4: 169.254.252.174/16 scope: link 
           IP v6: fe80::14d4:72ff:fe2c:2177/64 scope: link 
           IF-ID-1: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:ed:14:01:af 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:edff:fe14:1af/64 scope: link 
           IF-ID-2: eno2 state: down mac: b4:2e:99:3f:74:7d 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:9b18:d5e7:d945:ccf8:829e/16 scope: global 
           IF-ID-4: vethd3a5080 state: up speed: 10000 Mbps duplex: full mac: f6:8e:53:d3:dd:49 
           WAN IP: 131.159.102.7 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 733 GiB 
           allocated: 155 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: 1.78 TiB used: 1.26 TiB (70.6%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: SSD 970 EVO Plus 1TB 
           size: 931.51 GiB block-size: physical: 512 B logical: 512 B speed: 31.6 Gb/s lanes: 4 
           rotation: SSD serial: S4EWNX0R514087T rev: 2B2QEXM7 temp: 29 Celsius C 
           SMART: yes health: PASSED on: 68d 13h cycles: 6 read-units: 246 [125 MB] 
           written-units: 562,571 [288 GB] 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ7LH960HAJR-00005 
           family: based SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B 
           sata: 3.2 speed: 6.0 Gb/s rotation: SSD serial: S45NNC0R216725 rev: 904Q temp: 20 C 
           scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 126d 22h cycles: 21 read: 11.63 TiB 
           written: 21.01 TiB 
Partition: ID-1: / raw-size: N/A size: 776.43 GiB used: 71.88 GiB (9.3%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 267.1 MiB (53.5%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /home raw-size: N/A size: 880.51 GiB used: 538.51 GiB (61.2%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 704.58 GiB used: 28.6 MiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 34.9 C mobo: 33.8 C 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 2738 
           Uptime: 13:51:23  up 13 days  0:51,  1 user,  load average: 35.23, 31.74, 31.40 
           Init: systemd v: 251 target: multi-user.target tool: systemctl Compilers: gcc: 9.5.0 
           Packages: nix-default: 0 nix-sys: 427 lib: 60 nix-usr: 0 Client: Sudo v: 1.9.12p1 
           inxi: 3.3.04 
```
![hardware topology](yasmin.lstopo.svg)
