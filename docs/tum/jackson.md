# jackson

```
System:    Host: jackson Kernel: 5.10.115 x86_64 bits: 64 compiler: gcc v: 10.3.0 Console: N/A 
           Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100679 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50442 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002384 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 995.21 GiB used: 15.55 GiB (1.6%) 
           Array-1: capacity: 12 TiB note: check slots: 8 EC: Single-bit ECC 
           max-module-size: 1.50 TiB note: est. 
           Device-1: DIMMA1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249F76 
           Device-2: DIMMB1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000F14 
           Device-3: DIMMC1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FB7 
           Device-4: DIMMD1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000FD6 
           Device-5: DIMME1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249EF7 
           Device-6: DIMMF1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000F18 
           Device-7: DIMMG1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FB9 
           Device-8: DIMMH1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000E15 
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
           Speed: 2557 MHz min/max: 800/3600 MHz boost: enabled volts: 1.6 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 2557 2: 1964 3: 2605 4: 2189 5: 1716 6: 3249 7: 1788 8: 2302 
           9: 2210 10: 2291 11: 2786 12: 2371 13: 1407 14: 2472 15: 2802 16: 3224 17: 1553 
           18: 3211 19: 1958 20: 1759 21: 2745 22: 2270 23: 1768 24: 2753 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno1 state: down mac: 3c:ec:ef:62:ac:26 
           Device-2: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: down mac: 3c:ec:ef:62:ac:27 
           Device-3: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7020 
           bus-ID: 18:00.0 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:85:9c 
           IP v4: 131.159.102.3/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::3/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::21b:21ff:fec3:859c/64 scope: link 
           Device-4: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7000 
           bus-ID: 18:00.1 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f1 state: down mac: 00:1b:21:c3:85:9e 
           Device-5: Intel Ethernet E810-C for QSFP driver: N/A port: 7000 bus-ID: 51:00.0 
           chip-ID: 8086:1592 class-ID: 0200 
           Device-6: Intel Ethernet E810-C for QSFP driver: N/A port: 7000 bus-ID: 51:00.1 
           chip-ID: 8086:1592 class-ID: 0200 
           IF-ID-1: docker0 state: down mac: 02:42:f4:29:eb:29 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:d295:dc35:5ec7:5a2d:c4a1/12 scope: global 
           IP v6: fe80::661:ad1e:99df:45e5/64 virtual: stable-privacy scope: link 
           IF-ID-3: usb0 state: unknown speed: N/A duplex: N/A mac: 46:c9:35:e3:c8:da 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::44c9:35ff:fee3:c8da/64 scope: link 
           WAN IP: 131.159.102.3 
Bluetooth: Device-1: Linux 5.1.3-2965b36-dirty-17921c0 with aspeed_vhub RNDIS/Ethernet Gadget 
           type: USB driver: rndis_host v: kernel bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee 
           class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.714.04.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.73 TiB 
           allocated: 9.16 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 5.22 TiB used: 411.07 GiB (7.7%) 
           ID-1: /dev/sda vendor: Samsung model: MZ1L21T9 size: 1.75 TiB speed: <unknown> 
           serial: N/A rev: 102Q scheme: GPT 
           ID-2: /dev/sdb vendor: Samsung model: MZ1L21T9 size: 1.75 TiB speed: <unknown> 
           serial: N/A rev: 102Q 
Partition: ID-1: / size: 1.68 TiB used: 9.15 GiB (0.5%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 1022 MiB used: 154.8 MiB (15.2%) fs: vfat dev: /dev/sda1 
           ID-3: /home size: 655.62 GiB used: 251.46 GiB (38.4%) fs: nfs4 remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 380 
           Uptime: 09:17:01  up 13 days 21:37,  0 users,  load average: 0.15, 0.12, 0.09 
           wakeups: 0 Init: systemd v: 250 target: multi-user.target Compilers: gcc: 11.3.0 
           Packages: nix-sys: 450 Client: Sudo v: 1.9.10 inxi: 3.3.04 
```
![hardware topology](jackson.lstopo.svg)
