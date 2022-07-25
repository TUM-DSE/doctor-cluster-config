# adelaide

```
System:    Host: adelaide Kernel: 5.15.53 x86_64 bits: 64 compiler: gcc v: 11.3.0 Console: N/A 
           Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100634 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50540 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002614 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 995.21 GiB used: 320.95 GiB (32.2%) 
           Array-1: capacity: 12 TiB note: check slots: 8 EC: Single-bit ECC 
           max-module-size: 1.50 TiB note: est. 
           Device-1: DIMMA1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FED 
           Device-2: DIMMB1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000D62 
           Device-3: DIMMC1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FDD 
           Device-4: DIMMD1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000EE2 
           Device-5: DIMME1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249C59 
           Device-6: DIMMF1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000E8D 
           Device-7: DIMMG1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249F0B 
           Device-8: DIMMH1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000D6C 
PCI Slots: Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short 
           Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: N/A type: x16 <OUT OF SPEC> RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
CPU:       Info: 12-Core model: Intel Xeon Gold 5317 bits: 64 type: MT MCP arch: Ice Lake rev: 6 
           cache: L1: 960 KiB L2: 18 MiB L3: 18 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 144000 
           Speed: 1716 MHz min/max: 800/3600 MHz volts: 1.6 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 1716 2: 2091 3: 2025 4: 3574 5: 2159 6: 2206 7: 3585 8: 3344 
           9: 1330 10: 3603 11: 3571 12: 2282 13: 1677 14: 3077 15: 2833 16: 2192 17: 3497 
           18: 1064 19: 3600 20: 1999 21: 3603 22: 3318 23: 3600 24: 2556 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno1 state: down mac: 3c:ec:ef:62:ad:f2 
           Device-2: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: down mac: 3c:ec:ef:62:ad:f3 
           Device-3: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7020 
           bus-ID: 18:00.0 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:7b:ec 
           IP v4: 131.159.102.13/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::13/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::21b:21ff:fec3:7bec/64 scope: link 
           Device-4: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7000 
           bus-ID: 18:00.1 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f1 state: down mac: 00:1b:21:c3:7b:ee 
           Device-5: Intel Ethernet E810-C for QSFP driver: ice v: kernel port: 7000 
           bus-ID: 51:00.0 chip-ID: 8086:1592 class-ID: 0200 
           IF: enp81s0 state: up speed: 100000 Mbps duplex: full mac: b4:96:91:b3:8a:90 
           IP v4: 192.168.1.101/24 type: dynamic scope: global 
           IP v6: fe80::b696:91ff:feb3:8a90/64 scope: link 
           IF-ID-1: docker0 state: down mac: 02:42:60:c6:03:ab 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:b79b:e658:22f8:3a00:fc74/12 scope: global 
           IP v6: fe80::957e:4d8c:b429:fa82/64 virtual: stable-privacy scope: link 
           IF-ID-3: usb0 state: unknown speed: -1 duplex: half mac: 36:a3:0c:6b:5e:43 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::34a3:cff:fe6b:5e43/64 scope: link 
           WAN IP: 131.159.102.13 
Bluetooth: Device-1: Linux 5.1.3-2965b36-dirty-17921c0 with aspeed_vhub RNDIS/Ethernet Gadget 
           type: USB driver: rndis_host v: kernel bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee 
           class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.717.02.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.44 TiB 
           allocated: 300 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 5.22 TiB used: 743.65 GiB (13.9%) 
           ID-1: /dev/sda vendor: Samsung model: MZ1L21T9 size: 1.75 TiB speed: <unknown> 
           serial: N/A rev: 102Q scheme: GPT 
           ID-2: /dev/sdb vendor: Samsung model: MZ1L21T9 size: 1.75 TiB speed: <unknown> 
           serial: N/A rev: 102Q 
Partition: ID-1: / size: 1.68 TiB used: 300.44 GiB (17.5%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 1022 MiB used: 133.3 MiB (13.0%) fs: vfat dev: /dev/sda1 
           ID-3: /home size: 888.34 GiB used: 292.77 GiB (33.0%) fs: nfs4 remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 392 
           Uptime: 09:25:12  up 11 days 19:09,  0 users,  load average: 0.19, 0.11, 0.10 
           wakeups: 0 Init: systemd v: 250 target: multi-user.target Compilers: gcc: 11.3.0 
           Packages: nix-sys: 455 Client: Sudo v: 1.9.10 inxi: 3.3.04 
```
![hardware topology](adelaide.lstopo.svg)
