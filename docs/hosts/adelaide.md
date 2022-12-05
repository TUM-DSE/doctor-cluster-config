# adelaide

```
System:    Host: adelaide Kernel: 5.15.80 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: initrd=\efi\nixos\g7j4kbdrc545l81gkqwb8f8qd9p8d40p-initrd-linux-5.15.80-initrd.efi 
           init=/nix/store/39gfbs7rd21w97mnalkslw3ka1n0gsdx-nixos-system-adelaide-22.11.20221130.59557d4/init 
           intel_iommu=on console=ttyS1,115200n8 console=tty1 panic=1 boot.panic_on_fail 
           nohibernate loglevel=4 
           Console: N/A Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100634 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50540 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002614 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 995.21 GiB used: 12.18 GiB (1.2%) 
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
           Speed: 2219 MHz min/max: 800/3600 MHz base/boost: 3000/4500 volts: 1.6 V 
           ext-clock: 100 MHz Core speeds (MHz): 1: 2219 2: 3531 3: 873 4: 3578 5: 881 6: 3537 
           7: 2408 8: 3596 9: 3459 10: 1797 11: 3537 12: 3567 13: 2865 14: 2204 15: 3507 16: 3579 
           17: 3567 18: 1643 19: 2563 20: 1455 21: 2795 22: 1762 23: 3485 24: 1307 
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
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ad:f2 
           IP v4: 169.254.209.2/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:adf2/64 scope: link 
           Device-2: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel port: 0780 
           bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ad:f3 
           IP v4: 169.254.211.203/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:adf3/64 scope: link 
           Device-3: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7020 
           bus-ID: 18:00.0 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:7b:ec 
           IP v4: 131.159.102.13/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::13/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::21b:21ff:fec3:7bec/64 scope: link 
           Device-4: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7000 
           bus-ID: 18:00.1 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f1 state: down mac: 00:1b:21:c3:7b:ee 
           IF-ID-1: docker0 state: down mac: 02:42:6d:69:ac:b5 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:b79b:e658:22f8:3a00:fc74/16 scope: global 
           IF-ID-3: usb0 state: unknown speed: -1 duplex: half mac: 36:a3:0c:6b:5e:43 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::34a3:cff:fe6b:5e43/64 scope: link 
           WAN IP: 131.159.102.13 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.717.02.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.43 TiB 
           allocated: 313 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 4.95 TiB usable: 6.68 TiB used: 851.74 GiB (12.5%) 
           ID-1: /dev/nvme0n1 maj-min: 259:1 vendor: Dell model: Ent NVMe AGN MU AIC 1.6TB 
           size: 1.46 TiB block-size: physical: 512 B logical: 512 B rotation: SSD 
           serial: S61ANA0R501123 rev: 2.0.2 temp: 26 Celsius C 
           SMART: yes health: PASSED on: 1y 52d 17h cycles: 26 read-units: 205,674,983 [105 TB] 
           written-units: 310,839,980 [159 TB] 
           ID-2: /dev/sda maj-min: 8:0 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 29 C scheme: GPT 
           SMART: yes state: enabled 
           ID-3: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 26 C 
           SMART: yes state: enabled 
Partition: ID-1: / raw-size: N/A size: 1.68 TiB used: 313.1 GiB (18.2%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 129.8 MiB (12.7%) fs: vfat 
           block-size: 512 B dev: /dev/sda1 maj-min: 8:1 
           ID-3: /home raw-size: N/A size: 880.51 GiB used: 538.51 GiB (61.2%) fs: nfs4 
           remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 51.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 411 Uptime: N/A wakeups: 0 Init: systemd v: 251 target: multi-user.target 
           tool: systemctl Compilers: gcc: 11.3.0 Packages: nix-default: 0 nix-sys: 438 lib: 62 
           nix-usr: 0 Client: Sudo v: 1.9.12p1 inxi: 3.3.04 
```
![hardware topology](adelaide.lstopo.svg)
