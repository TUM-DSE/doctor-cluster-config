# yasmin

```
System:    Host: yasmin Kernel: 5.10.150 aarch64 bits: 64 compiler: gcc v: 9.3.0 
           parameters: BOOT_IMAGE=(hd3,gpt1)//kernels/0bg061379i31ihg1iaql04ak6z2sl8bc-linux-5.10.150-Image 
           init=/nix/store/s92az4nrl1p2ri0flnf48sd3hzhsd3a3-nixos-system-yasmin-22.05.20221028.7269939/init 
           console=ttyS0,115200n8 console=tty0 console=ttyS0,115200n8 console=ttyAMA0,115200n8 
           console=tty0 panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Server System: GIGABYTE product: R181-T90-00 v: 0100 serial: GLG4NN012A0002 
           Chassis: type: 23 v: 1.0 serial: 01234567890123456789AB 
           Mobo: GIGABYTE model: MT91-FS1-00 v: 00030101 serial: JH6N6700014 UEFI: GIGABYTE v: F34 
           date: 08/13/2020 
Memory:    RAM: total: 251.27 GiB used: 33.78 GiB (13.4%) 
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
           Speed: 1850 MHz min/max: 1000/2000 MHz base/boost: 2000/2500 boost: disabled 
           volts: 0.8 V ext-clock: 33 MHz Core speeds (MHz): 1: 1140 2: 1040 3: 1000 4: 1060 
           5: 1100 6: 1070 7: 1320 8: 1240 9: 1090 10: 1010 11: 1030 12: 1010 13: 1000 14: 1010 
           15: 1000 16: 1000 17: 1410 18: 1000 19: 1030 20: 1020 21: 1170 22: 1010 23: 1000 
           24: 1120 25: 1100 26: 1020 27: 1000 28: 1000 29: 1050 30: 1110 31: 1090 32: 1110 
           33: 1190 34: 1040 35: 1400 36: 1200 37: 1000 38: 1020 39: 1000 40: 1000 41: 1490 
           42: 1000 43: 1000 44: 1050 45: 1010 46: 1030 47: 1540 48: 1410 49: 1000 50: 1030 
           51: 1020 52: 1170 53: 1010 54: 1000 55: 1120 56: 1020 57: 1000 58: 1010 59: 1000 
           60: 1050 61: 1110 62: 1090 63: 1110 64: 1190 65: 1040 66: 1400 67: 1000 68: 1020 
           69: 1060 70: 1000 71: 1000 72: 1490 73: 1000 74: 1000 75: 1050 76: 1010 77: 1030 
           78: 1410 79: 1000 80: 1100 81: 1030 82: 1020 83: 1170 84: 1010 85: 1000 86: 1120 
           87: 1020 88: 1000 89: 1000 90: 1050 91: 1070 92: 1110 93: 1090 94: 1110 95: 1190 
           96: 1040 97: 1400 98: 1000 99: 1020 100: 1000 101: 1000 102: 1320 103: 1490 104: 1000 
           105: 1000 106: 1050 107: 1010 108: 1030 109: 1410 110: 1000 111: 1030 112: 1020 
           113: 1410 114: 1240 115: 1170 116: 1010 117: 1000 118: 1120 119: 1020 120: 1000 
           121: 1000 122: 1050 123: 1110 124: 1090 125: 1090 126: 1110 127: 1190 128: 1040 
           129: 1400 130: 1000 131: 1020 132: 1000 133: 1000 134: 1490 135: 1000 136: 1010 
           137: 1000 138: 1050 139: 1010 140: 1030 141: 1030 142: 1010 143: 1000 144: 1000 
           145: 1000 146: 1140 147: 1040 148: 1020 149: 1410 150: 1020 151: 1850 152: 1200 
           153: 1190 154: 1000 155: 1000 156: 1610 157: 1000 158: 1010 159: 1850 160: 1100 
           161: 1200 162: 1540 163: 1010 164: 1060 165: 1100 166: 1070 167: 1320 168: 1240 
           169: 1090 170: 1200 171: 1010 172: 1030 173: 1010 174: 1000 175: 1000 176: 1000 
           177: 1140 178: 1040 179: 1410 180: 1020 181: 1190 182: 1850 183: 1200 184: 1190 
           185: 1000 186: 1000 187: 1610 188: 1000 189: 1010 190: 1100 191: 1200 192: 1000 
           193: 1540 194: 1010 195: 1060 196: 1100 197: 1070 198: 1320 199: 1240 200: 1090 
           201: 1010 202: 1030 203: 1000 204: 1010 205: 1000 206: 1000 207: 1000 208: 1140 
           209: 1040 210: 1410 211: 1020 212: 1850 213: 1200 214: 1610 215: 1190 216: 1000 
           217: 1000 218: 1610 219: 1000 220: 1010 221: 1100 222: 1200 223: 1540 224: 1010 
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
           Sound Server-1: ALSA v: k5.10.150 running: yes 
Network:   Device-1: QLogic FastLinQ QL41000 Series 10/25/40/50GbE vendor: Gigabyte driver: qede 
           v: 8.37.0.20 port: N/A bus-ID: 0b:00.0 chip-ID: 1077:8070 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: b4:2e:99:3f:74:7c 
           IP v4: 131.159.102.7/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::7/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::b62e:99ff:fe3f:747c/64 scope: link 
           Device-2: QLogic FastLinQ QL41000 Series 10/25/40/50GbE vendor: Gigabyte driver: qede 
           v: 8.37.0.20 port: N/A bus-ID: 0b:00.1 chip-ID: 1077:8070 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: b4:2e:99:3f:74:7c 
           IP v4: 131.159.102.7/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::7/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::b62e:99ff:fe3f:747c/64 scope: link 
           Device-3: American Megatrends Virtual Ethernet type: USB driver: cdc_ether 
           bus-ID: 3-1.3:5 chip-ID: 046b:ffb0 class-ID: 0a00 serial: 1234567890 
           IF: enp0s15f1u1u3c2 state: unknown speed: N/A duplex: N/A mac: 16:d4:72:2c:21:77 
           IP v4: 169.254.252.174/16 scope: link 
           IP v6: fe80::14d4:72ff:fe2c:2177/64 scope: link 
           IF-ID-1: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:1b:a3:ec:79 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:1bff:fea3:ec79/64 scope: link 
           IF-ID-2: eno2 state: down mac: b4:2e:99:3f:74:7d 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:9b18:d5e7:d945:ccf8:829e/16 scope: global 
           IF-ID-4: veth0d801e4 state: up speed: 10000 Mbps duplex: full mac: 1e:83:74:ca:52:a1 
           WAN IP: 131.159.102.7 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 734 GiB 
           allocated: 154 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: 1.78 TiB used: 1.16 TiB (64.9%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: SSD 970 EVO Plus 1TB 
           size: 931.51 GiB block-size: physical: 512 B logical: 512 B speed: 31.6 Gb/s lanes: 4 
           rotation: SSD serial: S4EWNX0R514087T rev: 2B2QEXM7 temp: 28.9 C 
           SMART: yes health: PASSED on: 68d 13h cycles: 5 read-units: 237 [121 MB] 
           written-units: 562,569 [288 GB] 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ7LH960HAJR-00005 
           family: based SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B 
           sata: 3.2 speed: 6.0 Gb/s rotation: SSD serial: S45NNC0R216725 rev: 904Q temp: 20 C 
           scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 108d 21h cycles: 20 read: 11.15 TiB 
           written: 20.11 TiB 
Partition: ID-1: / raw-size: N/A size: 772.67 GiB used: 67.21 GiB (8.7%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 142.1 MiB (28.4%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /home raw-size: N/A size: 861.84 GiB used: 454.85 GiB (52.8%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 705.73 GiB used: 277.5 MiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 34.3 C mobo: 33.2 C 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 2685 
           Uptime: 12:35:37  up 18 days 12:18,  0 users,  load average: 32.75, 29.10, 27.81 
           Init: systemd v: 250 target: multi-user.target tool: systemctl Compilers: gcc: 9.3.0 
           Packages: nix-default: 0 nix-sys: 447 lib: 66 nix-usr: 0 Client: Sudo v: 1.9.10 
           inxi: 3.3.04 
```
![hardware topology](yasmin.lstopo.svg)
