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
Memory:    RAM: total: 251.27 GiB used: 13.77 GiB (5.5%) 
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
           volts: 0.8 V ext-clock: 33 MHz Core speeds (MHz): 1: 1140 2: 1040 3: 1000 4: 1330 
           5: 1500 6: 1510 7: 1120 8: 1330 9: 1290 10: 1200 11: 1230 12: 1510 13: 1150 14: 1190 
           15: 1190 16: 1480 17: 1280 18: 1000 19: 1240 20: 1200 21: 1280 22: 2000 23: 1000 
           24: 1120 25: 1190 26: 1180 27: 1000 28: 1180 29: 1310 30: 1310 31: 1370 32: 1410 
           33: 1330 34: 1120 35: 1210 36: 1370 37: 1340 38: 1340 39: 1000 40: 1350 41: 1040 
           42: 1350 43: 1220 44: 1250 45: 1360 46: 1260 47: 1470 48: 1280 49: 1000 50: 1240 
           51: 1200 52: 1280 53: 2000 54: 1000 55: 1120 56: 1180 57: 1000 58: 1200 59: 1180 
           60: 1310 61: 1310 62: 1370 63: 1410 64: 1330 65: 1120 66: 1210 67: 1340 68: 1340 
           69: 1330 70: 1000 71: 1350 72: 1040 73: 1350 74: 1220 75: 1250 76: 1360 77: 1260 
           78: 1280 79: 1000 80: 1500 81: 1240 82: 1200 83: 1280 84: 2000 85: 1000 86: 1120 
           87: 1180 88: 1000 89: 1180 90: 1310 91: 1510 92: 1310 93: 1370 94: 1410 95: 1330 
           96: 1120 97: 1210 98: 1340 99: 1340 100: 1000 101: 1350 102: 1120 103: 1040 104: 1350 
           105: 1220 106: 1250 107: 1360 108: 1260 109: 1280 110: 1000 111: 1240 112: 1200 
           113: 1640 114: 1330 115: 1280 116: 2000 117: 1000 118: 1120 119: 1180 120: 1000 
           121: 1180 122: 1310 123: 1310 124: 1370 125: 1290 126: 1410 127: 1330 128: 1120 
           129: 1210 130: 1340 131: 1340 132: 1000 133: 1350 134: 1040 135: 1350 136: 1200 
           137: 1220 138: 1250 139: 1360 140: 1260 141: 1230 142: 1510 143: 1150 144: 1190 
           145: 1480 146: 1140 147: 1040 148: 1020 149: 1640 150: 1020 151: 1850 152: 1250 
           153: 1490 154: 1000 155: 1000 156: 1430 157: 1000 158: 1190 159: 1850 160: 1190 
           161: 1370 162: 1470 163: 1200 164: 1330 165: 1500 166: 1510 167: 1120 168: 1330 
           169: 1290 170: 1250 171: 1200 172: 1230 173: 1510 174: 1150 175: 1190 176: 1480 
           177: 1140 178: 1040 179: 1640 180: 1020 181: 1490 182: 1850 183: 1250 184: 1490 
           185: 1000 186: 1000 187: 1430 188: 1000 189: 1190 190: 1190 191: 1370 192: 1000 
           193: 1470 194: 1200 195: 1330 196: 1500 197: 1510 198: 1120 199: 1330 200: 1290 
           201: 1200 202: 1230 203: 1000 204: 1510 205: 1150 206: 1190 207: 1480 208: 1140 
           209: 1040 210: 1640 211: 1020 212: 1850 213: 1250 214: 1430 215: 1490 216: 1000 
           217: 1000 218: 1430 219: 1000 220: 1190 221: 1190 222: 1370 223: 1470 224: 1200 
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
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 738 GiB 
           allocated: 150 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 1.78 TiB usable: 2.65 TiB used: 859.98 GiB (31.7%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: SSD 970 EVO Plus 1TB 
           size: 931.51 GiB block-size: physical: 512 B logical: 512 B speed: 31.6 Gb/s lanes: 4 
           rotation: SSD serial: S4EWNX0R514087T rev: 2B2QEXM7 temp: 27.9 C 
           SMART: yes health: PASSED on: 68d 13h cycles: 5 read-units: 236 [120 MB] 
           written-units: 562,569 [288 GB] 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ7LH960HAJR-00005 
           family: based SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B 
           sata: 3.2 speed: 6.0 Gb/s rotation: SSD serial: S45NNC0R216725 rev: 904Q temp: 21 C 
           scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 91d 19h cycles: 20 read: 10.85 TiB 
           written: 19.35 TiB 
Partition: ID-1: / raw-size: N/A size: 775.35 GiB used: 65.72 GiB (8.5%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 194.5 MiB (38.9%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /home raw-size: N/A size: 896.17 GiB used: 368.79 GiB (41.2%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 709.62 GiB used: 512 KiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 33.2 C mobo: 31.5 C 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 2537 
           Uptime: 10:26:17  up 1 day 10:09,  0 users,  load average: 9.79, 8.27, 7.72 
           Init: systemd v: 250 target: multi-user.target tool: systemctl Compilers: gcc: 9.3.0 
           Packages: nix-default: 0 nix-sys: 446 lib: 66 nix-usr: 0 Client: Sudo v: 1.9.10 
           inxi: 3.3.04 
```
![hardware topology](yasmin.lstopo.svg)
