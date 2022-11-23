# yasmin

```
System:    Host: yasmin Kernel: 5.15.79 aarch64 bits: 64 compiler: gcc v: 9.3.0 
           parameters: BOOT_IMAGE=(hd3,gpt1)//kernels/1irf7fw7in9xzkznjn67dj3sl63kk65m-linux-5.15.79-Image 
           init=/nix/store/81djs8vafmamnz2hry2hgdsknn8w6399-nixos-system-yasmin-22.05.20221121.41c6fb2/init 
           console=ttyS0,115200n8 console=tty0 console=ttyS0,115200n8 console=ttyAMA0,115200n8 
           console=tty0 panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Server System: GIGABYTE product: R181-T90-00 v: 0100 serial: GLG4NN012A0002 
           Chassis: type: 23 v: 1.0 serial: 01234567890123456789AB 
           Mobo: GIGABYTE model: MT91-FS1-00 v: 00030101 serial: JH6N6700014 UEFI: GIGABYTE v: F34 
           date: 08/13/2020 
Memory:    RAM: total: 251.27 GiB used: 15.29 GiB (6.1%) 
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
           Speed: 2000 MHz min/max: 1000/2000 MHz base/boost: 2000/2500 boost: disabled 
           volts: 0.8 V ext-clock: 33 MHz Core speeds (MHz): 1: 1000 2: 1010 3: 2000 4: 2000 
           5: 2000 6: 2000 7: 2000 8: 2000 9: 2000 10: 2000 11: 2000 12: 2000 13: 2000 14: 2000 
           15: 2000 16: 2000 17: 2000 18: 2000 19: 2000 20: 2000 21: 2000 22: 2000 23: 2000 
           24: 2000 25: 2000 26: 2000 27: 2000 28: 2000 29: 2000 30: 2000 31: 2000 32: 2000 
           33: 2000 34: 2000 35: 2000 36: 2000 37: 2000 38: 2000 39: 2000 40: 2000 41: 2000 
           42: 2000 43: 2000 44: 2000 45: 2000 46: 2000 47: 2000 48: 2000 49: 2000 50: 2000 
           51: 2000 52: 2000 53: 2000 54: 2000 55: 2000 56: 2000 57: 2000 58: 2000 59: 2000 
           60: 2000 61: 2000 62: 2000 63: 2000 64: 2000 65: 2000 66: 2000 67: 2000 68: 2000 
           69: 2000 70: 2000 71: 2000 72: 2000 73: 2000 74: 2000 75: 2000 76: 2000 77: 2000 
           78: 2000 79: 2000 80: 2000 81: 2000 82: 2000 83: 2000 84: 2000 85: 2000 86: 2000 
           87: 2000 88: 2000 89: 2000 90: 2000 91: 2000 92: 2000 93: 2000 94: 2000 95: 2000 
           96: 2000 97: 2000 98: 2000 99: 2000 100: 2000 101: 2000 102: 2000 103: 2000 104: 2000 
           105: 2000 106: 2000 107: 2000 108: 2000 109: 2000 110: 2000 111: 2000 112: 2000 
           113: 2000 114: 2000 115: 2000 116: 2000 117: 2000 118: 2000 119: 2000 120: 2000 
           121: 2000 122: 2000 123: 2000 124: 2000 125: 2000 126: 2000 127: 2000 128: 2000 
           129: 2000 130: 2000 131: 2000 132: 2000 133: 2000 134: 2000 135: 2000 136: 2000 
           137: 2000 138: 2000 139: 2000 140: 2000 141: 2000 142: 2000 143: 2000 144: 2000 
           145: 2000 146: 1360 147: 1100 148: 2000 149: 2000 150: 2000 151: 2000 152: 2000 
           153: 2000 154: 2000 155: 2000 156: 2000 157: 2000 158: 2000 159: 2000 160: 2000 
           161: 2000 162: 2000 163: 2000 164: 2000 165: 2000 166: 2000 167: 2000 168: 2000 
           169: 2000 170: 2000 171: 2000 172: 2000 173: 2000 174: 2000 175: 2000 176: 2000 
           177: 1360 178: 1100 179: 2000 180: 2000 181: 2000 182: 2000 183: 2000 184: 2000 
           185: 2000 186: 2000 187: 2000 188: 2000 189: 2000 190: 2000 191: 2000 192: 2000 
           193: 2000 194: 2000 195: 2000 196: 2000 197: 2000 198: 2000 199: 2000 200: 2000 
           201: 2000 202: 2000 203: 2000 204: 2000 205: 2000 206: 2000 207: 2000 208: 1360 
           209: 1100 210: 2000 211: 2000 212: 2000 213: 2000 214: 2000 215: 2000 216: 2000 
           217: 2000 218: 2000 219: 2000 220: 2000 221: 2000 222: 2000 223: 2000 224: 2000 
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
           IF-ID-1: docker0 state: down mac: 02:42:ed:14:01:af 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:edff:fe14:1af/64 scope: link 
           IF-ID-2: eno2 state: down mac: b4:2e:99:3f:74:7d 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:9b18:d5e7:d945:ccf8:829e/16 scope: global 
           WAN IP: 131.159.102.7 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 737 GiB 
           allocated: 151 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 1.78 TiB usable: 2.65 TiB used: 838.74 GiB (30.9%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: SSD 970 EVO Plus 1TB 
           size: 931.51 GiB block-size: physical: 512 B logical: 512 B speed: 31.6 Gb/s lanes: 4 
           rotation: SSD serial: S4EWNX0R514087T rev: 2B2QEXM7 temp: 29 Celsius C 
           SMART: yes health: PASSED on: 68d 13h cycles: 6 read-units: 245 [125 MB] 
           written-units: 562,571 [288 GB] 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ7LH960HAJR-00005 
           family: based SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B 
           sata: 3.2 speed: 6.0 Gb/s rotation: SSD serial: S45NNC0R216725 rev: 904Q temp: 20 C 
           scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 115d 2h cycles: 21 read: 11.31 TiB 
           written: 20.41 TiB 
Partition: ID-1: / raw-size: N/A size: 777.56 GiB used: 68.67 GiB (8.8%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 205.2 MiB (41.1%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /home raw-size: N/A size: 876.88 GiB used: 516.95 GiB (59.0%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 709.16 GiB used: 275.9 MiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 34.3 C mobo: 33.8 C 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 2385 
           Uptime: 17:49:32  up 1 day  4:50,  1 user,  load average: 0.68, 0.36, 0.25 
           Init: systemd v: 250 target: multi-user.target tool: systemctl Compilers: gcc: 9.3.0 
           Packages: nix-default: 0 nix-sys: 447 lib: 66 nix-usr: 0 Client: Sudo v: 1.9.10 
           inxi: 3.3.04 
```
![hardware topology](yasmin.lstopo.svg)
