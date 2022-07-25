# hinoki

```
System:    Host: hinoki Kernel: 5.8.0-55-generic x86_64 bits: 64 compiler: N/A Console: N/A 
           dm: LXDM Distro: Ubuntu 20.04.3 LTS (Focal Fossa) 
Machine:   Type: Kvm System: Supermicro product: SYS-5019P-WTR v: 0123456789 
           serial: E263776X1501344 Chassis: type: 1 v: 0123456789 serial: C8150LK12P20129 
           Mobo: Supermicro model: X11SPW-TF v: 1.03 serial: OM213S005647 
           UEFI [Legacy]: American Megatrends v: 3.4a date: 03/09/2021 
Memory:    RAM: total: 251.38 GiB used: 10.90 GiB (4.3%) 
           Array-1: capacity: 2.30 TiB note: check slots: 3 EC: Single-bit ECC 
           max module size: 768 GiB note: est. 
           Device-1: DIMMA1 size: 64 GiB speed: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40MB2-CVF serial: 23F48F28 
           Device-2: DIMMB1 size: 64 GiB speed: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40MB2-CVF serial: 23F48F2E 
           Device-3: DIMMC1 size: No Module Installed 
           Array-2: capacity: 2.30 TiB note: check slots: 3 EC: Single-bit ECC 
           max module size: 768 GiB note: est. 
           Device-1: DIMMD1 size: 64 GiB speed: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40MB2-CVF serial: 23F48E12 
           Device-2: DIMME1 size: 64 GiB speed: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40MB2-CVF serial: 23F48F21 
           Device-3: DIMMF1 size: No Module Installed 
PCI Slots: Slot: N/A type: x4 M.2 Socket 2 M.2 PCI-E 3.0 X4 status: Available length: Short 
           Slot: 1 type: x16 PCI Express 3 x16 RSC-R1UW-2E16 SLOT1 PCI-E X16 status: In Use 
           length: Long 
           Slot: 2 type: x16 PCI Express 3 x16 RSC-R1UW-2E16 SLOT2 PCI-E X16 status: In Use 
           length: Long 
           Slot: 1 type: x8 PCI Express 3 x8 RSC-R1UW-E8R SLOT1 PCI-E X8 status: Available 
           length: Short 
CPU:       Topology: 28-Core model: Intel Xeon Gold 6238R bits: 64 type: MT MCP arch: Cascade Lake 
           rev: 7 L1 cache: 1792 KiB L2 cache: 38.5 MiB L3 cache: 38.5 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 246400 
           Speed: 1698 MHz max: 2200 MHz Core speeds (MHz): 1: 1698 2: 1780 3: 1503 4: 1820 
           5: 1373 6: 2035 7: 1812 8: 1608 9: 1928 10: 2008 11: 2060 12: 1321 13: 2115 14: 1417 
           15: 1394 16: 1226 17: 1417 18: 1514 19: 1466 20: 1583 21: 1551 22: 1546 23: 1678 
           24: 1925 25: 1678 26: 1333 27: 1654 28: 2009 29: 1776 30: 1771 31: 2004 32: 1928 
           33: 1725 34: 1501 35: 1762 36: 2019 37: 1820 38: 1289 39: 2156 40: 1394 41: 1478 
           42: 1821 43: 1406 44: 1414 45: 1919 46: 1976 47: 1283 48: 2168 49: 1381 50: 1811 
           51: 2021 52: 1430 53: 1653 54: 2088 55: 1350 56: 1729 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus ID: 03:00.0 chip ID: 1a03:2000 
           Display: server: N/A driver: fbdev,modesetting,vesa tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No Device data found. 
Network:   Device-1: Intel Ethernet X722 for 10GBASE-T vendor: Super Micro driver: i40e 
           v: 2.8.20-k port: 3000 bus ID: 19:00.0 chip ID: 8086:37d2 
           IF: eno1 state: up speed: 1000 Mbps duplex: full mac: 3c:ec:ef:5e:20:c8 
           IP v4: 131.159.102.6/24 scope: global 
           IP v6: fe80::3eec:efff:fe5e:20c8/64 scope: link 
           Device-2: Intel Ethernet X722 for 10GBASE-T vendor: Super Micro driver: i40e 
           v: 2.8.20-k port: 3000 bus ID: 19:00.1 chip ID: 8086:37d2 
           IF: eno2 state: down mac: 3c:ec:ef:5e:20:c9 
           Device-3: Intel Ethernet E810-C for QSFP driver: ice v: 0.8.2-k port: 3000 
           bus ID: 65:00.0 chip ID: 8086:1592 
           IF: ens2f0 state: down mac: b4:96:91:aa:95:68 
           Device-4: Intel Ethernet E810-C for QSFP driver: ice v: 0.8.2-k port: 3000 
           bus ID: 65:00.1 chip ID: 8086:1592 
           IF: ens2f1 state: up speed: 100000 Mbps duplex: full mac: b4:96:91:aa:95:69 
           IP v4: 10.10.10.2/24 scope: global 
           IP v6: fe80::b696:91ff:feaa:9569/64 scope: link 
           IF-ID-1: cni0 state: up speed: 10000 Mbps duplex: unknown mac: 9a:08:a1:32:84:ee 
           IP v4: 10.42.0.1/24 scope: global broadcast: 10.42.0.255 
           IP v6: fe80::9808:a1ff:fe32:84ee/64 scope: link 
           IF-ID-2: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:01:a9:57:ad 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:1ff:fea9:57ad/64 scope: link 
           IF-ID-3: flannel.1 state: unknown speed: 1000 Mbps duplex: full mac: ca:14:ad:12:64:20 
           IP v4: 10.42.0.0/32 scope: global 
           IP v6: fe80::c814:adff:fe12:6420/64 scope: link 
           IF-ID-4: tap0 state: down mac: 62:c5:18:30:13:6b 
           IP v4: 10.0.0.1/24 scope: global 
           IP v6: fe80::60c5:18ff:fe30:136b/64 scope: link 
           IF-ID-5: tap1 state: down mac: ce:18:f9:74:0d:49 
           IP v6: fe80::cc18:f9ff:fe74:d49/64 scope: link 
           IF-ID-6: tap100 state: down mac: 12:a9:31:3c:96:99 
           IP v4: 10.0.0.1/24 scope: global 
           IP v6: fe80::10a9:31ff:fe3c:9699/64 scope: link 
           IF-ID-7: veth025c6d12 state: up speed: 10000 Mbps duplex: full mac: e2:17:10:70:be:e5 
           IF-ID-8: veth0d73ca7e state: up speed: 10000 Mbps duplex: full mac: 42:f8:8b:0e:d6:d3 
           IF-ID-9: veth22c3afa state: up speed: 10000 Mbps duplex: full mac: a2:b0:07:27:df:36 
           IF-ID-10: veth48c88c29 state: up speed: 10000 Mbps duplex: full mac: 5e:fa:b1:02:79:14 
           IF-ID-11: veth4b57e8f9 state: up speed: 10000 Mbps duplex: full mac: 3e:8b:cb:f4:32:9b 
           IF-ID-12: veth5535a175 state: up speed: 10000 Mbps duplex: full mac: 0e:01:40:5e:1f:ba 
           IF-ID-13: veth72b37f8e state: up speed: 10000 Mbps duplex: full mac: 02:69:60:bf:40:42 
           IF-ID-14: veth8dcfe6e6 state: up speed: 10000 Mbps duplex: full mac: d6:23:4d:0c:3d:d9 
           IF-ID-15: veth8fbd14ac state: up speed: 10000 Mbps duplex: full mac: 0a:89:6c:f7:59:ce 
           IF-ID-16: veth97605e59 state: up speed: 10000 Mbps duplex: full mac: c2:b7:a4:29:9e:e6 
           IF-ID-17: veth9b4f46c6 state: up speed: 10000 Mbps duplex: full mac: ce:04:1a:24:ba:2d 
           IF-ID-18: vethb7b426ff state: up speed: 10000 Mbps duplex: full mac: 02:b7:d8:25:3d:f2 
           IF-ID-19: vethbbdd0cef state: up speed: 10000 Mbps duplex: full mac: 66:26:cc:85:16:dc 
           IF-ID-20: vethc7cc6253 state: up speed: 10000 Mbps duplex: full mac: ea:b5:cf:34:8b:a9 
           IF-ID-21: vethe066348a state: up speed: 10000 Mbps duplex: full mac: b6:b0:76:00:dd:4e 
           IF-ID-22: vethe30b04d2 state: up speed: 10000 Mbps duplex: full mac: ca:1f:b0:04:fd:18 
           IF-ID-23: vethe5416751 state: up speed: 10000 Mbps duplex: full mac: 12:d1:ae:6c:b6:73 
           IF-ID-24: vethe91b0701 state: up speed: 10000 Mbps duplex: full mac: 96:5a:3e:14:fe:f5 
           IF-ID-25: vethece35745 state: up speed: 10000 Mbps duplex: full mac: ee:70:20:ee:03:66 
           IF-ID-26: vethf3792191 state: up speed: 10000 Mbps duplex: full mac: 7a:aa:ac:f5:d9:d7 
           IF-ID-27: vethfe8653ce state: up speed: 10000 Mbps duplex: full mac: d2:7b:78:3a:1a:29 
           IF-ID-28: virbr0 state: down mac: 52:54:00:2e:1a:4e 
           IP v4: 192.168.122.1/24 scope: global broadcast: 192.168.122.255 
           IF-ID-29: virbr0-nic state: down mac: 52:54:00:2e:1a:4e 
           WAN IP: No WAN IP data found. Connected to the web? SSL issues? 
Drives:    Local Storage: total: 894.25 GiB used: 774.67 GiB (86.6%) 
           ID-1: /dev/sda vendor: Samsung model: MZ7LH960HAJR-00005 size: 894.25 GiB 
           speed: 6.0 Gb/s serial: S45NNC0R412270 rev: 904Q temp: 24 C scheme: MBR 
Partition: ID-1: / size: 878.70 GiB used: 387.34 GiB (44.1%) fs: ext4 dev: /dev/sda5 
Sensors:   Message: No ipmi sensors data was found. 
           System Temperatures: lm-sensors cpu: 41.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
           Voltages: lm-sensors 12v: 0.00 5v: N/A 3.3v: N/A vbat: N/A 
Info:      Processes: 938 Uptime: 111d 48m Init: systemd v: 245 runlevel: 5 Compilers: gcc: 9.3.0 
           alt: 9 clang: 10.0.0-4ubuntu1 Client: Sudo v: 1.8.31 inxi: 3.0.38 
```
