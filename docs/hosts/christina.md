# christina

```
System:    Host: christina Kernel: 5.10.145 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: initrd=\efi\nixos\1bf85h65zf2g4mwj5gfkpwikx3q4lmr9-initrd-linux-5.10.145-initrd.efi 
           init=/nix/store/5clp9cd6nxhw8miwjmqdwrc24ngsip7a-nixos-system-christina-22.05.20220928.b5b0418/init 
           console=ttyS1,115200n8 console=tty1 default_hugepagesz=2MB hugepagesz=2MB 
           hugepages=1000 panic=1 boot.panic_on_fail loglevel=4 
           Console: N/A Distro: NixOS 22.05 (Quokka) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100644 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50535 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002555 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 251.21 GiB used: 43.05 GiB (17.1%) 
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
CPU:       Info: 12-Core model: Intel Xeon Gold 5317 bits: 64 type: MT MCP arch: Ice Lake 
           family: 6 model-id: 6A (106) stepping: 6 microcode: D000375 cache: L1: 960 KiB 
           L2: 18 MiB L3: 18 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 144000 
           Speed: 1511 MHz min/max: 800/3600 MHz base/boost: 3000/4500 boost: enabled volts: 1.6 V 
           ext-clock: 100 MHz Core speeds (MHz): 1: 1511 2: 1618 3: 2590 4: 2680 5: 2148 6: 2914 
           7: 2606 8: 2158 9: 3184 10: 1692 11: 1499 12: 1389 13: 2691 14: 3153 15: 2207 16: 1487 
           17: 1266 18: 2333 19: 1745 20: 1781 21: 2116 22: 2301 23: 1144 24: 1579 
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
Network:   Device-1: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ad:7c 
           IP v4: 169.254.168.73/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:ad7c/64 scope: link 
           Device-2: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 0780 bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ad:7d 
           IP v4: 169.254.10.67/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:ad7d/64 scope: link 
           Device-3: Intel Ethernet E810-C for QSFP driver: N/A modules: ice port: 3000 
           bus-ID: 18:00.0 chip-ID: 8086:1592 class-ID: 0200 
           Device-4: Intel Ethernet E810-C for QSFP driver: N/A modules: ice port: 3000 
           bus-ID: 18:00.1 chip-ID: 8086:1592 class-ID: 0200 
           Device-5: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: a020 
           bus-ID: 51:00.0 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp81s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:85:e0 
           IP v4: 131.159.102.14/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::14/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::21b:21ff:fec3:85e0/64 scope: link 
           Device-6: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: a000 
           bus-ID: 51:00.1 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp81s0f1 state: down mac: 00:1b:21:c3:85:e2 
           IF-ID-1: docker0 state: down mac: 02:42:6b:57:be:37 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: docker_gwbridge state: down mac: 02:42:fd:cc:af:90 
           IP v4: 172.18.0.1/16 scope: global broadcast: 172.18.255.255 
           IF-ID-3: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:9a2d:93c6:b09e:fc2:92a9/16 scope: global 
           IF-ID-4: usb0 state: unknown speed: N/A duplex: N/A mac: 3a:76:85:87:6b:e8 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::3876:85ff:fe87:6be8/64 scope: link 
           WAN IP: 131.159.102.14 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.714.04.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.49 TiB 
           allocated: 246 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 5.22 TiB used: 769.62 GiB (14.4%) 
           ID-1: /dev/sda maj-min: 8:0 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 27 C 
           SMART: yes state: enabled 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 27 C scheme: GPT 
           SMART: yes state: enabled 
Partition: ID-1: / raw-size: N/A size: 1.62 TiB used: 182.22 GiB (11.0%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 79.4 MiB (7.8%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /home raw-size: N/A size: 896.51 GiB used: 368.48 GiB (41.1%) fs: nfs4 
           remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 41.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 405 
           Uptime: 17:25:21  up 20 days 23:28,  3 users,  load average: 0.15, 0.13, 0.11 
           wakeups: 0 Init: systemd v: 250 target: multi-user.target tool: systemctl Compilers: 
           gcc: 11.3.0 Packages: nix-default: 0 nix-sys: 456 lib: 68 nix-usr: 0 Client: Sudo 
           v: 1.9.10 inxi: 3.3.04 
```
![hardware topology](christina.lstopo.svg)
