# yasmin

```
System:    Host: yasmin Kernel: 5.10.145 aarch64 bits: 64 compiler: gcc v: 9.3.0 
           parameters: BOOT_IMAGE=(hd3,gpt1)//kernels/ksaahqlpgwmnfx4zzjmdh0ypv5bikppa-linux-5.10.145-Image 
           init=/nix/store/s783cs1ql8643c6s9lcmh6w2qpsy8z70-nixos-system-yasmin-22.05.20220926.8237988/init 
           console=ttyS0,115200n8 console=tty0 console=ttyS0,115200n8 console=ttyAMA0,115200n8 
           console=tty0 panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Server System: GIGABYTE product: R181-T90-00 v: 0100 serial: GLG4NN012A0002 
           Chassis: type: 23 v: 1.0 serial: 01234567890123456789AB 
           Mobo: GIGABYTE model: MT91-FS1-00 v: 00030101 serial: JH6N6700014 UEFI: GIGABYTE v: F34 
           date: 08/13/2020 
Memory:    RAM: total: 251.27 GiB used: 32.13 GiB (12.8%) 
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
           Speed: 4294967 MHz min/max: 1000/2000 MHz base/boost: 2000/2500 boost: disabled 
           volts: 0.8 V ext-clock: 33 MHz Core speeds (MHz): 1: 4294967 2: 4294967 3: 4294967 
           4: 1900 5: 1350 6: 1000 7: 1050 8: 4294967 9: 4294967 10: 1010 11: 4294967 12: 1440 
           13: 1040 14: 1040 15: 1000 16: 1000 17: 4294967 18: 4294967 19: 1220 20: 4294967 
           21: 1040 22: 4294967 23: 4294967 24: 1100 25: 4294967 26: 1000 27: 4294967 28: 4294967 
           29: 1820 30: 4294967 31: 4294967 32: 1210 33: 4294967 34: 1000 35: 1020 36: 1040 
           37: 1020 38: 4294967 39: 1350 40: 1000 41: 1020 42: 1710 43: 4294967 44: 1020 
           45: 4294967 46: 4294967 47: 4294967 48: 4294967 49: 4294967 50: 1220 51: 4294967 
           52: 1040 53: 4294967 54: 4294967 55: 1100 56: 1000 57: 4294967 58: 1910 59: 4294967 
           60: 1820 61: 4294967 62: 4294967 63: 1210 64: 4294967 65: 1000 66: 1020 67: 1020 
           68: 4294967 69: 1900 70: 1350 71: 1000 72: 1020 73: 1710 74: 4294967 75: 1020 
           76: 4294967 77: 4294967 78: 4294967 79: 4294967 80: 1350 81: 1220 82: 4294967 83: 1040 
           84: 4294967 85: 4294967 86: 1100 87: 1000 88: 4294967 89: 4294967 90: 1820 91: 1000 
           92: 4294967 93: 4294967 94: 1210 95: 4294967 96: 1000 97: 1020 98: 1020 99: 4294967 
           100: 1350 101: 1000 102: 1050 103: 1020 104: 1710 105: 4294967 106: 1020 107: 4294967 
           108: 4294967 109: 4294967 110: 4294967 111: 1220 112: 4294967 113: 4294967 114: 4294967 
           115: 1040 116: 4294967 117: 4294967 118: 1100 119: 1000 120: 4294967 121: 4294967 
           122: 1820 123: 4294967 124: 4294967 125: 4294967 126: 1210 127: 4294967 128: 1000 
           129: 1020 130: 1020 131: 4294967 132: 1350 133: 1000 134: 1020 135: 1710 136: 1010 
           137: 4294967 138: 1020 139: 4294967 140: 4294967 141: 4294967 142: 1440 143: 1040 
           144: 1000 145: 1000 146: 4294967 147: 4294967 148: 4294967 149: 4294967 150: 4294967 
           151: 4294967 152: 4294967 153: 4294967 154: 4294967 155: 1070 156: 4294967 157: 4294967 
           158: 1040 159: 4294967 160: 4294967 161: 1040 162: 4294967 163: 1910 164: 1900 
           165: 1350 166: 1000 167: 1050 168: 4294967 169: 4294967 170: 4294967 171: 1010 
           172: 4294967 173: 1440 174: 1040 175: 1000 176: 1000 177: 4294967 178: 4294967 
           179: 4294967 180: 4294967 181: 4294967 182: 4294967 183: 4294967 184: 4294967 
           185: 4294967 186: 1070 187: 4294967 188: 4294967 189: 1040 190: 4294967 191: 1040 
           192: 4294967 193: 4294967 194: 1910 195: 1900 196: 1350 197: 1000 198: 1050 
           199: 4294967 200: 4294967 201: 1010 202: 4294967 203: 1070 204: 1440 205: 1040 
           206: 1000 207: 1000 208: 4294967 209: 4294967 210: 4294967 211: 4294967 212: 4294967 
           213: 4294967 214: 4294967 215: 4294967 216: 4294967 217: 1070 218: 4294967 219: 4294967 
           220: 1040 221: 4294967 222: 1040 223: 4294967 224: 1910 
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
           Sound Server-1: ALSA v: k5.10.145 running: yes 
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
           IF-ID-1: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:ad:a4:d2:00 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:adff:fea4:d200/64 scope: link 
           IF-ID-2: eno2 state: down mac: b4:2e:99:3f:74:7d 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:9b18:d5e7:d945:ccf8:829e/12 scope: global 
           IF-ID-4: veth91e39bd state: up speed: 10000 Mbps duplex: full mac: 56:c6:53:fd:f5:79 
           WAN IP: 131.159.102.7 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 742 GiB 
           allocated: 146 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: 1.78 TiB used: 896.67 GiB (49.1%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: SSD 970 EVO Plus 1TB 
           size: 931.51 GiB block-size: physical: 512 B logical: 512 B speed: 31.6 Gb/s lanes: 4 
           rotation: SSD serial: S4EWNX0R514087T rev: 2B2QEXM7 temp: 28.9 C 
           SMART: yes health: PASSED on: 68d 13h cycles: 5 read-units: 228 [116 MB] 
           written-units: 562,568 [288 GB] 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ7LH960HAJR-00005 
           family: based SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B 
           sata: 3.2 speed: 6.0 Gb/s rotation: SSD serial: S45NNC0R216725 rev: 904Q temp: 20 C 
           scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 88d 2h cycles: 20 read: 10.7 TiB 
           written: 19.17 TiB 
Partition: ID-1: / raw-size: N/A size: 780.79 GiB used: 66.87 GiB (8.6%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 194.4 MiB (38.9%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /home raw-size: N/A size: 896.51 GiB used: 368.48 GiB (41.1%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 713.92 GiB used: 384 KiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 35.4 C mobo: 33.8 C 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 2492 
           Uptime: 17:25:31  up 30 days  5:47,  0 users,  load average: 39.14, 36.68, 36.38 
           Init: systemd v: 250 target: multi-user.target tool: systemctl Compilers: gcc: 9.3.0 
           Packages: nix-default: 0 nix-sys: 446 lib: 66 nix-usr: 0 Client: Sudo v: 1.9.10 
           inxi: 3.3.04 
```
![hardware topology](yasmin.lstopo.svg)
