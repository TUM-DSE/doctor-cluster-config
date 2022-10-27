# river

```
System:    Host: river Kernel: 5.12.14 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: initrd=\efi\nixos\qrfapwz1rk6pyiqdx9isn2wfcbvcsyqq-initrd-linux-5.12.14-initrd.efi 
           init=/nix/store/slifyqjbrxglnx0g2gfc16kngqwlli4d-nixos-system-river-22.05.20220926.8237988/init 
           console=ttyS1,115200n8 console=tty1 default_hugepagesz=1GB hugepagesz=1GB hugepages=8 
           panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100639 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50425 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002408 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 995.21 GiB used: 52.05 GiB (5.2%) 
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
CPU:       Info: 12-Core model: Intel Xeon Gold 5317 bits: 64 type: MT MCP arch: Ice Lake 
           family: 6 model-id: 6A (106) stepping: 6 microcode: D000375 cache: L1: 960 KiB 
           L2: 18 MiB L3: 18 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 144000 
           Speed: 1094 MHz min/max: 800/3600 MHz base/boost: 3000/4500 boost: enabled volts: 1.6 V 
           ext-clock: 100 MHz Core speeds (MHz): 1: 1094 2: 2096 3: 3600 4: 2144 5: 3562 6: 2319 
           7: 3534 8: 1996 9: 1323 10: 2061 11: 3530 12: 1805 13: 3205 14: 1922 15: 2098 16: 2789 
           17: 3503 18: 1853 19: 1981 20: 2015 21: 3557 22: 1275 23: 1775 24: 1714 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: spec_store_bypass 
           mitigation: Speculative Store Bypass disabled via prctl and seccomp 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 mitigation: Enhanced IBRS, IBPB: conditional, RSB filling 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ac:56 
           IP v4: 169.254.10.88/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:ac56/64 scope: link 
           Device-2: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ac:57 
           IP v4: 169.254.227.211/16 scope: link 
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
           Device-5: Intel Ethernet E810-C for QSFP driver: N/A modules: ice port: 7000 
           bus-ID: 51:00.0 chip-ID: 8086:1592 class-ID: 0200 
           IF-ID-1: docker0 state: down mac: 02:42:c5:ed:2a:13 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:f7cf:5f5a:8ed8:f139:be6d/12 scope: global 
           IF-ID-3: usb0 state: unknown speed: N/A duplex: N/A mac: 7a:38:1e:58:99:0d 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::7838:1eff:fe58:990d/64 scope: link 
           WAN IP: 131.159.102.16 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.714.04.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.7 TiB 
           allocated: 37.1 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 5.22 TiB used: 576.72 GiB (10.8%) 
           ID-1: /dev/sda maj-min: 8:0 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 30 C scheme: GPT 
           SMART: yes state: enabled 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 30 C 
           SMART: yes state: enabled 
Partition: ID-1: / raw-size: N/A size: 1.68 TiB used: 37.01 GiB (2.2%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 52.5 MiB (5.1%) fs: vfat 
           block-size: 512 B dev: /dev/sda1 maj-min: 8:1 
           ID-3: /home raw-size: N/A size: 896.51 GiB used: 368.48 GiB (41.1%) fs: nfs4 
           remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 50.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 397 
           Uptime: 17:25:21  up 30 days  5:38,  0 users,  load average: 0.08, 0.10, 0.09 
           wakeups: 0 Init: systemd v: 250 target: multi-user.target tool: systemctl Compilers: 
           gcc: 11.3.0 Packages: nix-default: 0 nix-sys: 455 lib: 68 nix-usr: 0 Client: Sudo 
           v: 1.9.10 inxi: 3.3.04 
```
![hardware topology](river.lstopo.svg)
