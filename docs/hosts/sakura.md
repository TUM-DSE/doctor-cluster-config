System:    Host: sakura Kernel: 5.8.0-55-generic x86_64 bits: 64 compiler: N/A 
           parameters: BOOT_IMAGE=/boot/vmlinuz-5.8.0-55-generic root=UUID=8ccd9c9c-af0f-4239-944c-8c8ed36d7868 ro 
           intel_iommu=igfx_off quiet splash vt.handoff=7 
           Console: N/A dm: LightDM 1.30.0 Distro: Ubuntu 20.04.3 LTS (Focal Fossa) 
Machine:   Type: Kvm System: Supermicro product: SYS-5019P-WTR v: 0123456789 serial: E263776X1501304 Chassis: type: 1 
           v: 0123456789 serial: C8150LK12P20098 
           Mobo: Supermicro model: X11SPW-TF v: 1.03 serial: OM213S005322 UEFI [Legacy]: American Megatrends v: 3.4a 
           date: 03/09/2021 
Memory:    RAM: total: 251.38 GiB used: 7.37 GiB (2.9%) 
           Array-1: capacity: 2.30 TiB note: check slots: 3 EC: Single-bit ECC max module size: 768 GiB note: est. 
           Device-1: DIMMA1 size: 64 GiB speed: 2933 MT/s type: DDR4 detail: synchronous registered (buffered) 
           bus width: 64 bits total: 72 bits manufacturer: Samsung part-no: M393A8G40MB2-CVF serial: 23F48E10 
           Device-2: DIMMB1 size: 64 GiB speed: 2933 MT/s type: DDR4 detail: synchronous registered (buffered) 
           bus width: 64 bits total: 72 bits manufacturer: Samsung part-no: M393A8G40MB2-CVF serial: 23F48E20 
           Device-3: DIMMC1 size: No Module Installed 
           Array-2: capacity: 2.30 TiB note: check slots: 3 EC: Single-bit ECC max module size: 768 GiB note: est. 
           Device-1: DIMMD1 size: 64 GiB speed: 2933 MT/s type: DDR4 detail: synchronous registered (buffered) 
           bus width: 64 bits total: 72 bits manufacturer: Samsung part-no: M393A8G40MB2-CVF serial: 23F48DB4 
           Device-2: DIMME1 size: 64 GiB speed: 2933 MT/s type: DDR4 detail: synchronous registered (buffered) 
           bus width: 64 bits total: 72 bits manufacturer: Samsung part-no: M393A8G40MB2-CVF serial: 23F48C09 
           Device-3: DIMMF1 size: No Module Installed 
PCI Slots: Slot: N/A type: x4 M.2 Socket 2 M.2 PCI-E 3.0 X4 status: Available length: Short 
           Slot: 1 type: x16 PCI Express 3 x16 RSC-R1UW-2E16 SLOT1 PCI-E X16 status: In Use length: Long 
           Slot: 2 type: x16 PCI Express 3 x16 RSC-R1UW-2E16 SLOT2 PCI-E X16 status: In Use length: Long 
           Slot: 1 type: x8 PCI Express 3 x8 RSC-R1UW-E8R SLOT1 PCI-E X8 status: Available length: Short 
CPU:       Topology: 28-Core model: Intel Xeon Gold 6238R bits: 64 type: MT MCP arch: Cascade Lake family: 6 model-id: 55 (85) 
           stepping: 7 microcode: 5003102 L1 cache: 1792 KiB L2 cache: 38.5 MiB L3 cache: 38.5 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 246400 
           Speed: 1006 MHz min/max: 1000/4000 MHz Core speeds (MHz): 1: 1400 2: 1012 3: 1056 4: 2598 5: 1247 6: 1001 7: 1000 
           8: 1001 9: 1340 10: 1001 11: 1162 12: 1076 13: 1000 14: 1001 15: 1000 16: 2032 17: 1531 18: 1499 19: 1340 20: 1000 
           21: 1000 22: 1214 23: 1073 24: 1001 25: 1001 26: 1001 27: 1049 28: 1001 29: 1362 30: 1666 31: 1000 32: 1399 
           33: 1043 34: 1515 35: 1001 36: 1162 37: 1001 38: 1000 39: 1000 40: 1097 41: 1000 42: 1248 43: 1142 44: 1000 
           45: 1001 46: 1001 47: 1380 48: 1249 49: 1308 50: 1045 51: 1000 52: 1000 53: 1248 54: 1306 55: 1001 56: 1251 
           Vulnerabilities: Type: itlb_multihit status: KVM: VMX disabled 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl and seccomp 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 mitigation: Enhanced IBRS, IBPB: conditional, RSB filling 
           Type: srbds status: Not affected 
           Type: tsx_async_abort mitigation: TSX disabled 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel bus ID: 03:00.0 chip ID: 1a03:2000 
           Display: server: X.org 1.20.13 driver: modesetting unloaded: fbdev,vesa tty: 141x67 
           Message: Advanced graphics data unavailable for root. 
Audio:     Message: No Device data found. 
Network:   Device-1: Intel Ethernet X722 for 10GBASE-T vendor: Super Micro driver: i40e v: 2.8.20-k port: 3000 bus ID: 19:00.0 
           chip ID: 8086:37d2 
           IF: eno1 state: up speed: 1000 Mbps duplex: full mac: 3c:ec:ef:5e:1e:42 
           IP v4: 131.159.102.5/24 type: noprefixroute scope: global broadcast: 131.159.102.255 
           IP v6: 2a09:80c0:102::5/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::c55f:74d0:83da:39d8/64 type: noprefixroute scope: link 
           Device-2: Intel Ethernet X722 for 10GBASE-T vendor: Super Micro driver: i40e v: 2.8.20-k port: 3000 bus ID: 19:00.1 
           chip ID: 8086:37d2 
           IF: eno2 state: down mac: 3c:ec:ef:5e:1e:43 
           Device-3: Intel Ethernet E810-C for QSFP driver: ice v: 0.8.2-k port: 3000 bus ID: 65:00.0 chip ID: 8086:1592 
           IF: ens2f0 state: up speed: 100000 Mbps duplex: full mac: b4:96:91:aa:97:c0 
           Device-4: Intel Ethernet E810-C for QSFP driver: ice v: 0.8.2-k port: 3000 bus ID: 65:00.1 chip ID: 8086:1592 
           IF: ens2f1 state: down mac: b4:96:91:aa:97:c1 
           IF-ID-1: docker0 state: down mac: 02:42:aa:0c:08:71 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: lxdbr0 state: up speed: 10000 Mbps duplex: unknown mac: 00:16:3e:a1:60:7e 
           IP v4: 10.14.102.1/24 scope: global 
           IP v6: fe80::216:3eff:fea1:607e/64 scope: link 
           IF-ID-3: vethe9f14397 state: up speed: 10000 Mbps duplex: full mac: fa:96:fe:da:2f:99 
           IF-ID-4: virbr0 state: down mac: 52:54:00:e1:cd:c0 
           IP v4: 192.168.122.1/24 scope: global broadcast: 192.168.122.255 
           IF-ID-5: virbr0-nic state: down mac: 52:54:00:e1:cd:c0 
           WAN IP: ;; connection timed out; no servers could be reached 
Drives:    Local Storage: total: 894.25 GiB used: 662.98 GiB (74.1%) 
           SMART Message: Required tool smartctl not installed. Check --recommends 
           ID-1: /dev/sda vendor: Samsung model: MZ7LH960HAJR-00005 size: 894.25 GiB block size: physical: 4096 B 
           logical: 512 B speed: 6.0 Gb/s serial: S45NNC0R412259 rev: 904Q temp: 24 C scheme: MBR 
Partition: ID-1: / raw size: 893.75 GiB size: 878.70 GiB (98.32%) used: 662.98 GiB (75.4%) fs: ext4 block size: 4096 B 
           dev: /dev/sda5 
Sensors:   System Temperatures: ipmi cpu: 44 C mobo: 19 C 
           Fan Speeds (RPM): ipmi fan-1: 4100 fan-2: 3700 fan-4: 3600 fan-5: 3900 fan-7: 3900 
           Voltages: ipmi 12v: 12.11 5v: 5.09 3.3v: 3.40 vbat: N/A dimm-p1: N/A dimm-p2: N/A 
           System Temperatures: lm-sensors cpu: 42.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 960 Uptime: 1d 20h 46m Init: systemd v: 245 runlevel: 5 Compilers: gcc: 9.4.0 alt: 8/9 
           clang: 10.0.0-4ubuntu1 Shell: bash (sudo) v: 5.0.17 running in: sshd (SSH) inxi: 3.0.38 
