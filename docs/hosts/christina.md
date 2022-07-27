# christina

```
System:    Host: christina Kernel: 5.15.49 x86_64 bits: 64 compiler: gcc v: 11.3.0 Console: N/A 
           Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100644 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50535 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002555 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 251.21 GiB used: 54.28 GiB (21.6%) 
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
           Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: N/A type: x16 <OUT OF SPEC> RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
CPU:       Info: 12-Core model: Intel Xeon Gold 5317 bits: 64 type: MT MCP arch: Ice Lake rev: 6 
           cache: L1: 960 KiB L2: 18 MiB L3: 18 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 144000 
           Speed: 3421 MHz min/max: 800/3600 MHz volts: 1.6 V ext-clock: 100 MHz 
           Core speeds (MHz): 1: 3421 2: 3467 3: 3428 4: 3500 5: 3500 6: 3500 7: 3500 8: 3500 
           9: 3403 10: 3407 11: 3400 12: 3432 13: 3500 14: 3463 15: 3400 16: 3400 17: 3470 
           18: 3420 19: 3400 20: 3419 21: 3495 22: 3450 23: 3454 24: 3410 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Unable to show advanced data. Required tool glxinfo missing. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno1 state: down mac: 3c:ec:ef:62:ad:7c 
           Device-2: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: down mac: 3c:ec:ef:62:ad:7d 
           Device-3: Intel Ethernet E810-C for QSFP driver: ice v: kernel port: 3000 
           bus-ID: 18:00.0 chip-ID: 8086:1592 class-ID: 0200 
           IF: enp24s0f0 state: up speed: 100000 Mbps duplex: full mac: b4:96:91:aa:a1:c0 
           IP v4: 192.168.1.105/24 type: dynamic scope: global 
           IP v6: fe80::b696:91ff:feaa:a1c0/64 scope: link 
           Device-4: Intel Ethernet E810-C for QSFP driver: ice v: kernel port: 3000 
           bus-ID: 18:00.1 chip-ID: 8086:1592 class-ID: 0200 
           IF: enp24s0f1 state: down mac: b4:96:91:aa:a1:c1 
           Device-5: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: a020 
           bus-ID: 51:00.0 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp81s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:85:e0 
           IP v4: 131.159.102.14/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::14/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::21b:21ff:fec3:85e0/64 scope: link 
           Device-6: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: a000 
           bus-ID: 51:00.1 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp81s0f1 state: down mac: 00:1b:21:c3:85:e2 
           IF-ID-1: docker0 state: down mac: 02:42:88:aa:e4:e4 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:88ff:feaa:e4e4/64 scope: link 
           IF-ID-2: docker_gwbridge state: up speed: 10000 Mbps duplex: unknown 
           mac: 02:42:8a:2f:7c:5d 
           IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255 
           IP v6: fe80::42:8aff:fe2f:7c5d/64 scope: link 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:9a2d:93c6:b09e:fc2:92a9/12 scope: global 
           IP v6: fe80::ed4f:37d7:aa3c:4b1f/64 virtual: stable-privacy scope: link 
           IF-ID-4: usb0 state: unknown speed: -1 duplex: half mac: 3a:76:85:87:6b:e8 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::3876:85ff:fe87:6be8/64 scope: link 
           IF-ID-5: veth1157715 state: up speed: 10000 Mbps duplex: full mac: 52:b0:46:2b:13:38 
           IF-ID-6: veth263dfa1 state: up speed: 10000 Mbps duplex: full mac: 32:fe:ea:25:d4:f0 
           IF-ID-7: veth591c7e1 state: up speed: 10000 Mbps duplex: full mac: c2:41:97:33:f8:bc 
           IF-ID-8: veth652e8f4 state: up speed: 10000 Mbps duplex: full mac: 7e:17:e6:cb:4a:b9 
           IF-ID-9: veth70e83f4 state: up speed: 10000 Mbps duplex: full mac: a2:98:9e:77:cb:ff 
           IF-ID-10: veth8a78a08 state: up speed: 10000 Mbps duplex: full mac: ce:a9:be:bd:3c:60 
           IF-ID-11: veth91bebe8 state: up speed: 10000 Mbps duplex: full mac: 7e:bd:8b:5e:ab:71 
           IF-ID-12: veth9370ada state: up speed: 10000 Mbps duplex: full mac: e2:68:67:4b:d6:dc 
           IF-ID-13: vetha4ded21 state: up speed: 10000 Mbps duplex: full mac: 52:d1:ab:e2:08:e6 
           IF-ID-14: vethc15e94e state: up speed: 10000 Mbps duplex: full mac: 1a:2b:ae:be:99:93 
           IF-ID-15: vethe5d0ff1 state: up speed: 10000 Mbps duplex: full mac: 76:31:90:1e:00:d4 
           IF-ID-16: vethf5dfe47 state: up speed: 10000 Mbps duplex: full mac: 3e:15:e7:a6:88:f2 
           WAN IP: 131.159.102.14 
Bluetooth: Device-1: Linux 5.1.3-2965b36-dirty-17921c0 with aspeed_vhub RNDIS/Ethernet Gadget 
           type: USB driver: rndis_host v: kernel bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee 
           class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.717.02.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.63 TiB 
           allocated: 104 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 5.22 TiB used: 523.38 GiB (9.8%) 
           ID-1: /dev/sda vendor: Samsung model: MZ1L21T9 size: 1.75 TiB speed: <unknown> 
           serial: N/A rev: 102Q 
           ID-2: /dev/sdb vendor: Samsung model: MZ1L21T9 size: 1.75 TiB speed: <unknown> 
           serial: N/A rev: 102Q scheme: GPT 
Partition: ID-1: / size: 1.64 TiB used: 65.66 GiB (3.9%) fs: zfs logical: zroot/root/nixos 
           ID-2: /boot size: 1022 MiB used: 106.9 MiB (10.5%) fs: vfat dev: /dev/sdb1 
           ID-3: /home size: 889.11 GiB used: 297.82 GiB (33.5%) fs: nfs4 remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           Missing: Required tool sensors not installed. Check --recommends 
Info:      Processes: 421 
           Uptime: 12:46:17  up 27 days  5:24,  0 users,  load average: 0.11, 0.20, 0.25 
           wakeups: 0 Init: systemd v: 250 target: multi-user.target Compilers: gcc: 11.3.0 
           Packages: nix-sys: 456 Client: Sudo v: 1.9.10 inxi: 3.3.04 
```
![hardware topology](christina.lstopo.svg)
