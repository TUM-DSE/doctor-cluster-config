# christina

```
System:    Host: christina Kernel: 5.15.79 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: initrd=\efi\nixos\axqvrwn0x4d3fcj4dy844gcsf1838q0y-initrd-linux-5.15.79-initrd.efi 
           init=/nix/store/kbclz2if71vl6q4qkql36i98nwiiyxba-nixos-system-christina-22.05.20221121.41c6fb2/init 
           intel_iommu=on console=ttyS1,115200n8 console=tty1 default_hugepagesz=1GB 
           hugepagesz=1GB hugepages=8 panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100644 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50535 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002555 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 251.21 GiB used: 86.24 GiB (34.3%) 
           Array-1: capacity: 12 TiB note: check slots: 8 EC: Single-bit ECC 
           max-module-size: 1.50 TiB note: est. 
           Device-1: DIMMA1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FB2 
           Device-2: DIMMB1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000F0A 
           Device-3: DIMMC1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FBA 
           Device-4: DIMMD1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000F09 
           Device-5: DIMME1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249F6D 
           Device-6: DIMMF1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 21440000101C 
           Device-7: DIMMG1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX0001414824A04C 
           Device-8: DIMMH1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000EF9 
PCI Slots: Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short 
           Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
CPU:       Info: 12-Core model: Intel Xeon Gold 5317 socket: LGA4189 bits: 64 type: MT MCP 
           arch: Ice Lake family: 6 model-id: 6A (106) stepping: 6 microcode: D000375 cache: 
           L1: 960 KiB L2: 18 MiB L3: 18 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 144000 
           Speed: 2978 MHz min/max: 800/3000 MHz base/boost: 3000/4500 volts: 1.6 V 
           ext-clock: 100 MHz Core speeds (MHz): 1: 2978 2: 2402 3: 3000 4: 1989 5: 2809 6: 3000 
           7: 1996 8: 2161 9: 2928 10: 2396 11: 3009 12: 3000 13: 3000 14: 3000 15: 3005 16: 3000 
           17: 3001 18: 2974 19: 3000 20: 3000 21: 3000 22: 3000 23: 3000 24: 3000 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable 
           Type: retbleed status: Not affected 
           Type: spec_store_bypass 
           mitigation: Speculative Store Bypass disabled via prctl and seccomp 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 
           mitigation: Enhanced IBRS, IBPB: conditional, RSB filling, PBRSB-eIBRS: SW sequence 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel port: 0780 
           bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ad:7c 
           IP v4: 169.254.168.73/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:ad7c/64 scope: link 
           Device-2: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel port: 0780 
           bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ad:7d 
           IP v4: 169.254.10.67/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:ad7d/64 scope: link 
           Device-3: Intel Ethernet E810-C for QSFP driver: vfio-pci v: N/A modules: ice 
           port: 3000 bus-ID: 18:00.0 chip-ID: 8086:1592 class-ID: 0200 
           Device-4: Intel Ethernet E810-C for QSFP driver: vfio-pci v: N/A modules: ice 
           port: 3000 bus-ID: 18:00.1 chip-ID: 8086:1592 class-ID: 0200 
           Device-5: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: a020 
           bus-ID: 51:00.0 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp81s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:85:e0 
           IP v4: 131.159.102.14/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::14/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::21b:21ff:fec3:85e0/64 scope: link 
           Device-6: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: a000 
           bus-ID: 51:00.1 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp81s0f1 state: down mac: 00:1b:21:c3:85:e2 
           IF-ID-1: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:6c:58:03:0f 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:6cff:fe58:30f/64 scope: link 
           IF-ID-2: docker_gwbridge state: down mac: 02:42:08:7c:f7:cf 
           IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:9a2d:93c6:b09e:fc2:92a9/16 scope: global 
           IF-ID-4: usb0 state: unknown speed: -1 duplex: half mac: 3a:76:85:87:6b:e8 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::3876:85ff:fe87:6be8/64 scope: link 
           IF-ID-5: vethfb93683 state: up speed: 10000 Mbps duplex: full mac: 5a:4c:ff:54:cb:18 
           IF-ID-6: virbr0 state: down mac: e2:75:80:f8:59:ec 
           IP v4: 172.44.0.1/24 scope: global 
           IP v6: fe80::e075:80ff:fef8:59ec/64 scope: link 
           WAN IP: 131.159.102.14 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.717.02.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.41 TiB 
           allocated: 332 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 5.22 TiB used: 1.23 TiB (23.6%) 
           ID-1: /dev/sda maj-min: 8:0 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 26 C 
           SMART: yes state: enabled 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 26 C scheme: GPT 
           SMART: yes state: enabled 
Partition: ID-1: / raw-size: N/A size: 1.59 TiB used: 243.09 GiB (14.9%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 129.9 MiB (12.7%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /home raw-size: N/A size: 880.51 GiB used: 538.51 GiB (61.2%) fs: nfs4 
           remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 54.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 446 
           Uptime: 13:51:09  up 8 days 13:41,  1 user,  load average: 0.38, 0.35, 0.23 wakeups: 0 
           Init: systemd v: 251 target: multi-user.target tool: systemctl Compilers: gcc: 11.3.0 
           Packages: nix-default: 0 nix-sys: 440 lib: 63 nix-usr: 0 Client: Sudo v: 1.9.12p1 
           inxi: 3.3.04 
```
![hardware topology](christina.lstopo.svg)
