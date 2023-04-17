# jack

```
System:    Host: jack Kernel: 6.2.11 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: init=/nix/store/8qdcgg11h70mnlrmzrwcssigyq3xdm36-nixos-system-jack-22.11.20230417.a52af07/init 
           console=ttyS1,115200n8 console=tty1 console=tty0 console=ttyS0,115200 
           default_hugepagesz=2MB hugepagesz=2MB hugepages=1000 nohibernate loglevel=4 
           nvidia.NVreg_OpenRmEnableUnsupportedGpus=1 
           Console: N/A Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Kvm System: Supermicro product: SYS-120U-TNR v: 0123456789 
           serial: E411764X2300334 Chassis: type: 1 v: 0123456789 serial: C119UAK12P20190 
           Mobo: Supermicro model: X12DPU-6 v: 1.02A serial: HM218S018239 
           UEFI: American Megatrends LLC. v: 1.2 date: 02/15/2022 
Memory:    RAM: total: 125.51 GiB used: 83 GiB (66.1%) 
           Array-1: capacity: 12 TiB slots: 32 EC: Single-bit ECC max-module-size: 384 GiB 
           note: est. 
           Device-1: P1-DIMMA1 size: 256 GiB speed: 3200 MT/s type: Logical non-volatile device 
           detail: synchronous non-volatile lrdimm bus-width: 64 bits total: 72 bits 
           manufacturer: Intel part-no: NMB1XXD256GPS serial: 214400000DE6 
           Device-2: P1-DIMMA2 size: No Module Installed 
           Device-3: P1-DIMMB1 size: 16 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN serial: 80AD01214836234FBF 
           Device-4: P1-DIMMB2 size: No Module Installed 
           Device-5: P1-DIMMC1 size: 256 GiB speed: 3200 MT/s type: Logical non-volatile device 
           detail: synchronous non-volatile lrdimm bus-width: 64 bits total: 72 bits 
           manufacturer: Intel part-no: NMB1XXD256GPS serial: 214400000F3B 
           Device-6: P1-DIMMC2 size: No Module Installed 
           Device-7: P1-DIMMD1 size: 16 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN serial: 80AD01214836234FBE 
           Device-8: P1-DIMMD2 size: No Module Installed 
           Device-9: P1-DIMME1 size: 256 GiB speed: 3200 MT/s type: Logical non-volatile device 
           detail: synchronous non-volatile lrdimm bus-width: 64 bits total: 72 bits 
           manufacturer: Intel part-no: NMB1XXD256GPS serial: 214400000CE1 
           Device-10: P1-DIMME2 size: No Module Installed 
           Device-11: P1-DIMMF1 size: 16 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN serial: 80AD01214836235013 
           Device-12: P1-DIMMF2 size: No Module Installed 
           Device-13: P1-DIMMG1 size: 256 GiB speed: 3200 MT/s type: Logical non-volatile device 
           detail: synchronous non-volatile lrdimm bus-width: 64 bits total: 72 bits 
           manufacturer: Intel part-no: NMB1XXD256GPS serial: 214400000CDD 
           Device-14: P1-DIMMG2 size: No Module Installed 
           Device-15: P1-DIMMH1 size: 16 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN serial: 80AD01214836235007 
           Device-16: P1-DIMMH2 size: No Module Installed 
           Device-17: P2-DIMMA1 size: 256 GiB speed: 3200 MT/s type: Logical non-volatile device 
           detail: synchronous non-volatile lrdimm bus-width: 64 bits total: 72 bits 
           manufacturer: Intel part-no: NMB1XXD256GPS serial: 214400000FD1 
           Device-18: P2-DIMMA2 size: No Module Installed 
           Device-19: P2-DIMMB1 size: 16 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN serial: 80AD01214836235011 
           Device-20: P2-DIMMB2 size: No Module Installed 
           Device-21: P2-DIMMC1 size: 256 GiB speed: 3200 MT/s type: Logical non-volatile device 
           detail: synchronous non-volatile lrdimm bus-width: 64 bits total: 72 bits 
           manufacturer: Intel part-no: NMB1XXD256GPS serial: 214400000EAF 
           Device-22: P2-DIMMC2 size: No Module Installed 
           Device-23: P2-DIMMD1 size: 16 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN serial: 80AD01214836234FC4 
           Device-24: P2-DIMMD2 size: No Module Installed 
           Device-25: P2-DIMME1 size: 256 GiB speed: 3200 MT/s type: Logical non-volatile device 
           detail: synchronous non-volatile lrdimm bus-width: 64 bits total: 72 bits 
           manufacturer: Intel part-no: NMB1XXD256GPS serial: 214400000EAE 
           Device-26: P2-DIMME2 size: No Module Installed 
           Device-27: P2-DIMMF1 size: 16 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN serial: 80AD012148362350AF 
           Device-28: P2-DIMMF2 size: No Module Installed 
           Device-29: P2-DIMMG1 size: 256 GiB speed: 3200 MT/s type: Logical non-volatile device 
           detail: synchronous non-volatile lrdimm bus-width: 64 bits total: 72 bits 
           manufacturer: Intel part-no: NMB1XXD256GPS serial: 214400000FF1 
           Device-30: P2-DIMMG2 size: No Module Installed 
           Device-31: P2-DIMMH1 size: 16 GiB speed: 3200 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: SK Hynix part-no: HMA82GR7DJR8N-XN serial: 80AD01214836234FBD 
           Device-32: P2-DIMMH2 size: No Module Installed 
PCI Slots: Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: Available 
           length: Long 
           Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: Available 
           length: Long 
           Slot: N/A type: SXB3 status: In Use length: Other 
           Slot: 1 type: x16 PCI Express 4 x16 AOC-URG4N4-i4XTS Slot1:PCIe Gen4 X16 
           status: Available length: Long 
CPU:       Info: 2x 16-Core model: Intel Xeon Gold 6326 socket: LGA4189 bits: 64 type: MT MCP SMP 
           arch: Ice Lake family: 6 model-id: 6A (106) stepping: 6 microcode: D000389 cache: 
           L1: 5 MiB L2: 48 MiB L3: 96 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 371439 
           Speed: 3500 MHz min/max: 800/3500 MHz base/boost: 2900/4500 volts: 1.6 V 
           ext-clock: 100 MHz Core speeds (MHz): 1: 3500 2: 3500 3: 3500 4: 3500 5: 3500 6: 3500 
           7: 3500 8: 3500 9: 3500 10: 3500 11: 3500 12: 3500 13: 3500 14: 3500 15: 3500 16: 3500 
           17: 3500 18: 3500 19: 2853 20: 3500 21: 3500 22: 3500 23: 3500 24: 3500 25: 3500 
           26: 3500 27: 3500 28: 3500 29: 3500 30: 3500 31: 3500 32: 3500 33: 3500 34: 3500 
           35: 3500 36: 3500 37: 3500 38: 3500 39: 3500 40: 3500 41: 3500 42: 3500 43: 3500 
           44: 3500 45: 3500 46: 3500 47: 3500 48: 3500 49: 3500 50: 3500 51: 3500 52: 3500 
           53: 3500 54: 3500 55: 3500 56: 3500 57: 3500 58: 2321 59: 3500 60: 3500 61: 3500 
           62: 3500 63: 3500 64: 3500 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable 
           Type: retbleed status: Not affected 
           Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 
           mitigation: Enhanced IBRS, IBPB: conditional, RSB filling, PBRSB-eIBRS: SW sequence 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Device-2: NVIDIA GA102GL [A40] driver: nvidia v: 525.105.17 
           alternate: nvidiafb,nouveau,nvidia_drm bus-ID: ca:00.0 chip-ID: 10de:2235 
           class-ID: 0302 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel 
           port: 3000 bus-ID: 19:00.0 chip-ID: 8086:15ff class-ID: 0200 
           IF: enp25s0f0 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:fb:5c:78 
           IP v4: 169.254.11.8/16 scope: link 
           IP v6: fe80::3eec:efff:fefb:5c78/64 scope: link 
           Device-2: Intel Ethernet X710 for 10GBASE-T vendor: Super Micro driver: i40e v: kernel 
           port: 3000 bus-ID: 19:00.1 chip-ID: 8086:15ff class-ID: 0200 
           IF: enp25s0f1 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:fb:5c:79 
           IP v4: 169.254.132.85/16 scope: link 
           IP v6: fe80::3eec:efff:fefb:5c79/64 scope: link 
           Device-3: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e 
           v: kernel port: 3000 bus-ID: 19:00.2 chip-ID: 8086:104e class-ID: 0200 
           IF: enp25s0f2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:fb:5c:7a 
           IP v4: 131.159.102.17/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::17/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::3eec:efff:fefb:5c7a/64 scope: link 
           Device-4: Intel Ethernet X710 for 10 Gigabit SFP+ vendor: Super Micro driver: i40e 
           v: kernel port: 3000 bus-ID: 19:00.3 chip-ID: 8086:104e class-ID: 0200 
           IF: enp25s0f3 state: down mac: 3c:ec:ef:fb:5c:7b 
           IF-ID-1: br-e4440d730bbd state: up speed: 10000 Mbps duplex: unknown 
           mac: 02:42:e4:c3:39:bd 
           IP v4: 172.20.0.1/16 scope: global broadcast: 172.20.255.255 
           IP v6: fe80::42:e4ff:fec3:39bd/64 scope: link 
           IF-ID-2: docker0 state: down mac: 02:42:67:7d:62:96 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-3: enp0s20f0u7u2c2 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::bc3a:f2ff:feb6:59f/64 scope: link 
           IF-ID-4: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:43ea:3161:1159:e7e6:ff78/16 scope: global 
           IF-ID-5: veth73a211d state: up speed: 10000 Mbps duplex: full mac: 96:a6:ad:8d:c0:ae 
           WAN IP: 131.159.102.17 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 1-7.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 593 GiB 
           allocated: 295 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: 894.25 GiB used: 1.33 TiB (152.7%) 
           ID-1: /dev/sda maj-min: 8:0 vendor: Intel model: SSDSC2KB960G8 
           family: S4510/S4610/S4500/S4600 Series SSDs size: 894.25 GiB block-size: 
           physical: 4096 B logical: 512 B sata: 3.2 speed: 6.0 Gb/s rotation: SSD 
           serial: PHYF152302UG960CGN rev: 0132 temp: 18 C scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 342d 18h cycles: 24 read: 7.05 TiB 
           written: 9.72 TiB 
Partition: ID-1: / raw-size: N/A size: 799.88 GiB used: 234.69 GiB (29.3%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 163.9 MiB (16.0%) fs: vfat 
           block-size: 512 B dev: /dev/sda1 maj-min: 8:1 
           ID-3: /home raw-size: N/A size: 860.78 GiB used: 504.95 GiB (58.7%) fs: nfs4 
           remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 42.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 825 Uptime: 1h 42m wakeups: 0 Init: systemd v: 251 target: multi-user.target 
           tool: systemctl Compilers: gcc: 11.3.0 Packages: nix-default: 0 nix-sys: 497 lib: 94 
           nix-usr: 0 Client: Sudo v: 1.9.13p3 inxi: 3.3.04 
```
![hardware topology](jack.lstopo.svg)
