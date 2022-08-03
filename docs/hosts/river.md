# river

```
System:    Host: river Kernel: 5.15.58 x86_64 bits: 64 compiler: gcc v: 11.3.0 Console: N/A 
           Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100639 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50425 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002408 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 995.21 GiB used: 14.82 GiB (1.5%) 
           Array-1: capacity: 12 TiB note: check slots: 8 EC: Single-bit ECC 
           max-module-size: 1.50 TiB note: est. 
           Device-1: DIMMA1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249F17 
           Device-2: DIMMB1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000EF2 
           Device-3: DIMMC1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FDC 
           Device-4: DIMMD1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000E7F 
           Device-5: DIMME1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249F1D 
           Device-6: DIMMF1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000D60 
           Device-7: DIMMG1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous cache dram registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FDA 
           Device-8: DIMMH1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000F08 
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
           Speed: 2058 MHz min/max: 800/3600 MHz volts: 1.6 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 2058 2: 2114 3: 2383 4: 1832 5: 3561 6: 2151 7: 2200 8: 3603 
           9: 3603 10: 2232 11: 3567 12: 3567 13: 1866 14: 2396 15: 2003 16: 2728 17: 2830 
           18: 1363 19: 3603 20: 1834 21: 1274 22: 3573 23: 3398 24: 2964 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ac:56 
           IP v6: fe80::3eec:efff:fe62:ac56/64 scope: link 
           Device-2: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ac:57 
           IP v6: fe80::3eec:efff:fe62:ac57/64 scope: link 
           Device-3: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7020 
           bus-ID: 18:00.0 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:82:d8 
           IP v4: 131.159.102.16/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::16/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::21b:21ff:fec3:82d8/64 scope: link 
           Device-4: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7000 
           bus-ID: 18:00.1 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f1 state: down mac: 00:1b:21:c3:82:da 
           Device-5: Intel Ethernet E810-C for QSFP driver: N/A port: 7000 bus-ID: 51:00.0 
           chip-ID: 8086:1592 class-ID: 0200 
           IF-ID-1: docker0 state: down mac: 02:42:20:73:1d:af 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:f7cf:5f5a:8ed8:f139:be6d/12 scope: global 
           IP v6: fe80::4fc5:7c7a:9055:ed07/64 virtual: stable-privacy scope: link 
           IF-ID-3: usb0 state: unknown speed: -1 duplex: half mac: 7a:38:1e:58:99:0d 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::7838:1eff:fe58:990d/64 scope: link 
           WAN IP: 131.159.102.16 
Bluetooth: Device-1: Linux 5.1.3-2965b36-dirty-17921c0 with aspeed_vhub RNDIS/Ethernet Gadget 
           type: USB driver: rndis_host v: kernel bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee 
           class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.717.02.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.72 TiB 
           allocated: 9.82 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 5.22 TiB used: 311.79 GiB (5.8%) 
           ID-1: /dev/sda vendor: Samsung model: MZ1L21T9 size: 1.75 TiB speed: <unknown> 
           serial: N/A rev: 102Q scheme: GPT 
           ID-2: /dev/sdb vendor: Samsung model: MZ1L21T9 size: 1.75 TiB speed: <unknown> 
           serial: N/A rev: 102Q 
Partition: ID-1: / size: 1.68 TiB used: 9.77 GiB (0.6%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 1022 MiB used: 126.2 MiB (12.4%) fs: vfat dev: /dev/sda1 
           ID-3: /home size: 891.31 GiB used: 301.89 GiB (33.9%) fs: nfs4 remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 384 Uptime: N/A wakeups: 0 Init: systemd v: 250 target: multi-user.target 
           Compilers: gcc: 11.3.0 Packages: nix-sys: 455 Client: Sudo v: 1.9.10 inxi: 3.3.04 
```
![hardware topology](river.lstopo.svg)
