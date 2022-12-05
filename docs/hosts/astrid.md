# astrid

```
System:    Host: astrid Kernel: 5.15.79 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: initrd=\efi\nixos\f1jgbjv5yx89waa02k1aw9vxj0cix8d3-initrd-linux-5.15.79-initrd.efi 
           init=/nix/store/66l7b8a07x5kjq9xhzld8i14j6hj2w2a-nixos-system-astrid-22.05.20221121.41c6fb2/init 
           console=ttyS0,115200n8 console=tty0 panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Server System: Dell product: PowerEdge R440 v: N/A serial: 2YBVXK3 Chassis: 
           type: 23 serial: 2YBVXK3 
           Mobo: Dell model: 04JN2K v: A09 serial: .2YBVXK3.CNFCP001B301ND. UEFI: Dell v: 2.12.2 
           date: 07/09/2021 
Memory:    RAM: total: 125.53 GiB used: 14.67 GiB (11.7%) 
           Array-1: capacity: 1024 GiB slots: 16 EC: Multi-bit ECC max-module-size: 64 GiB 
           note: est. 
           Device-1: A1 size: 32 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E799A 
           Device-2: A2 size: 32 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E763D 
           Device-3: A3 size: No Module Installed 
           Device-4: A4 size: No Module Installed 
           Device-5: A5 size: No Module Installed 
           Device-6: A6 size: No Module Installed 
           Device-7: A7 size: No Module Installed 
           Device-8: A8 size: No Module Installed 
           Device-9: A9 size: No Module Installed 
           Device-10: A10 size: No Module Installed 
           Device-11: B1 size: 32 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E7639 
           Device-12: B2 size: 32 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: 00CE063200CE part-no: M393A4K40DB3-CWE serial: 206E765F 
           Device-13: B3 size: No Module Installed 
           Device-14: B4 size: No Module Installed 
           Device-15: B5 size: No Module Installed 
           Device-16: B6 size: No Module Installed 
PCI Slots: Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: Available length: Short 
           Slot: 3 type: x16 PCI Express 3 PCIe Slot 3 status: In Use length: Short 
           Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Other 
           Slot: 8 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 8 in Bay 1 
           status: Available length: 2.5" drive form factor 
           Slot: 9 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 9 in Bay 1 status: In Use 
           length: 2.5" drive form factor 
           Slot: 7 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 7 in Bay 1 
           status: Available length: 2.5" drive form factor 
           Slot: 6 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 6 in Bay 1 
           status: Available length: 2.5" drive form factor 
CPU:       Info: 2x 10-Core model: Intel Xeon Gold 5215 socket: LGA2011 bits: 64 type: MT MCP SMP 
           arch: Cascade Lake family: 6 model-id: 55 (85) stepping: 7 microcode: 5003302 cache: 
           L2: 27.5 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 200125 
           Speed: 2500 MHz min/max: N/A base/boost: 2500/4000 volts: 1.8 V ext-clock: 10400 MHz 
           Core speeds (MHz): 1: 2500 2: 2500 3: 2500 4: 2500 5: 2500 6: 2500 7: 2500 8: 2500 
           9: 2500 10: 2500 11: 2500 12: 2500 13: 2500 14: 2500 15: 2500 16: 1000 17: 2500 
           18: 2500 19: 2500 20: 2500 21: 2500 22: 2500 23: 2500 24: 2500 25: 2500 26: 2500 
           27: 2500 28: 2500 29: 2500 30: 2500 31: 2500 32: 2500 33: 2500 34: 2500 35: 2500 
           36: 2500 37: 2500 38: 2500 39: 2500 40: 2500 
           Vulnerabilities: Type: itlb_multihit status: KVM: VMX disabled 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable 
           Type: retbleed mitigation: Enhanced IBRS 
           Type: spec_store_bypass 
           mitigation: Speculative Store Bypass disabled via prctl and seccomp 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 
           mitigation: Enhanced IBRS, IBPB: conditional, RSB filling, PBRSB-eIBRS: SW sequence 
           Type: srbds status: Not affected 
           Type: tsx_async_abort mitigation: TSX disabled 
Graphics:  Device-1: Matrox Systems Integrated Matrox G200eW3 Graphics vendor: Dell 
           driver: mgag200 v: kernel bus-ID: 03:00.0 chip-ID: 102b:0536 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
Network:   Device-1: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 
           v: kernel port: 2000 bus-ID: 04:00.0 chip-ID: 14e4:165f class-ID: 0200 
           IF: eno1 state: down mac: f4:ee:08:0b:9f:86 
           Device-2: Broadcom NetXtreme BCM5720 Gigabit Ethernet PCIe vendor: Dell driver: tg3 
           v: kernel port: 2000 bus-ID: 04:00.1 chip-ID: 14e4:165f class-ID: 0200 
           IF: eno2 state: down mac: f4:ee:08:0b:9f:87 
           Device-3: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell 
           driver: bnxt_en v: kernel port: 2000 bus-ID: 5e:00.0 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp94s0f0np0 state: up speed: 10000 Mbps duplex: full mac: f4:ee:08:0a:ea:05 
           IP v4: 131.159.102.11/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::11/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::f6ee:8ff:fe0a:ea05/64 scope: link 
           Device-4: Broadcom BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet vendor: Dell 
           driver: bnxt_en v: kernel port: 2000 bus-ID: 5e:00.1 chip-ID: 14e4:16d8 class-ID: 0200 
           IF: enp94s0f1np1 state: down mac: f4:ee:08:0a:ea:06 
           IF-ID-1: cni0 state: up speed: 10000 Mbps duplex: unknown mac: e2:5e:fa:59:6c:8c 
           IP v4: 10.42.0.1/24 scope: global broadcast: 10.42.0.255 
           IP v6: fe80::e05e:faff:fe59:6c8c/64 scope: link 
           IF-ID-2: docker0 state: down mac: 02:42:56:a6:4e:24 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:98ac:9c80:4f25:50e3:1d8f/16 scope: global 
           IF-ID-4: veth43a26342 state: up speed: 10000 Mbps duplex: full mac: aa:d0:96:c6:44:fc 
           IF-ID-5: veth5e8c691c state: up speed: 10000 Mbps duplex: full mac: 02:bf:af:05:86:67 
           IF-ID-6: veth63ab3673 state: up speed: 10000 Mbps duplex: full mac: fa:31:42:33:e7:5a 
           IF-ID-7: veth7cf96df6 state: up speed: 10000 Mbps duplex: full mac: be:37:fb:6c:ea:9e 
           IF-ID-8: veth8cd0b68b state: up speed: 10000 Mbps duplex: full mac: 9e:f4:9f:98:c4:91 
           IF-ID-9: veth9a6cf067 state: up speed: 10000 Mbps duplex: full mac: 8a:16:89:21:42:ae 
           IF-ID-10: vethb13470b2 state: up speed: 10000 Mbps duplex: full mac: 32:9b:01:ce:50:f8 
           IF-ID-11: vethd43495e0 state: up speed: 10000 Mbps duplex: full mac: 6e:5b:6c:6b:01:31 
           IF-ID-12: vethdbf1530b state: up speed: 10000 Mbps duplex: full mac: 1e:63:34:e3:89:9e 
           IF-ID-13: vethfc628a5e state: up speed: 10000 Mbps duplex: full mac: ae:d2:30:6f:f2:1d 
           WAN IP: 131.159.102.11 
RAID:      Hardware-1: Broadcom / LSI MegaRAID 12GSAS/PCIe Secure SAS39xx driver: megaraid_sas 
           v: 07.717.02.00-rc1 port: c000 bus-ID: af:00.0 chip-ID: 1000.10e2 rev: class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.45 TiB free: 1.42 TiB 
           allocated: 37.6 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 1.46 TiB usable: 2.91 TiB used: 990.98 GiB (33.3%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Dell model: Ent NVMe P5600 MU U.2 1.6TB 
           size: 1.46 TiB block-size: physical: 512 B logical: 512 B speed: 63.2 Gb/s lanes: 4 
           rotation: SSD serial: PHAB123301411P9SGN rev: 1.1.5 temp: 26 Celsius C scheme: GPT 
           SMART: yes health: PASSED on: 315d 17h cycles: 41 read-units: 3,188,122 [1.63 TB] 
           written-units: 30,641,392 [15.6 TB] 
Partition: ID-1: / raw-size: N/A size: 1.39 TiB used: 22.49 GiB (1.6%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 110.7 MiB (10.8%) fs: vfat 
           block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:1 
           ID-3: /home raw-size: N/A size: 880.51 GiB used: 538.51 GiB (61.2%) fs: nfs4 
           remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 79.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 596 
           Uptime: 13:51:10  up 8 days 13:30,  0 users,  load average: 0.15, 0.13, 0.10 wakeups: 0 
           Init: systemd v: 251 target: multi-user.target tool: systemctl Compilers: gcc: 11.3.0 
           Packages: nix-default: 0 nix-sys: 451 lib: 65 nix-usr: 0 Client: Sudo v: 1.9.12p1 
           inxi: 3.3.04 
```
![hardware topology](astrid.lstopo.svg)
