# wilfred

```
System:    Host: wilfred Kernel: 6.3.5 x86_64 bits: 64 compiler: gcc v: 11.3.0 
           parameters: initrd=\efi\nixos\4dnp8cm346458ri2pksmlnr3amy70pmk-initrd-linux-6.3.5-initrd.efi 
           init=/nix/store/g9ki34fdy2awhx88yz90yphbi8y7kgpx-nixos-system-wilfred-22.11.20230613.14ff5cd/init 
           intel_iommu=on console=ttyS1,115200n8 console=tty1 console=tty0 console=ttyS0,115200 
           default_hugepagesz=1GB hugepagesz=1GB hugepages=8 nohibernate loglevel=4 
           Console: N/A Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Kvm System: Supermicro product: SYS-110P-WTR v: 0123456789 
           serial: E424030X2100628 Chassis: type: 1 v: 0123456789 serial: C1160LK21P50530 
           Mobo: Supermicro model: X12SPW-TF v: 2.00 serial: OM21AS002397 
           UEFI: American Megatrends LLC. v: 1.1c date: 11/08/2021 
Memory:    RAM: total: 251.21 GiB used: 64.01 GiB (25.5%) 
           Array-1: capacity: 12 TiB note: check slots: 8 EC: Single-bit ECC 
           max-module-size: 1.50 TiB note: est. 
           Device-1: DIMMA1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FB6 
           Device-2: DIMMB1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000EC3 
           Device-3: DIMMC1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249FBC 
           Device-4: DIMMD1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000ECF 
           Device-5: DIMME1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249F53 
           Device-6: DIMMF1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000EB6 
           Device-7: DIMMG1 size: 64 GiB speed: spec: 3200 MT/s actual: 2933 MT/s type: DDR4 
           detail: synchronous registered (buffered) bus-width: 64 bits total: 72 bits 
           manufacturer: Samsung part-no: M393A8G40AB2-CWE serial: H1KX00014148249F54 
           Device-8: DIMMH1 size: 256 GiB speed: spec: 3200 MT/s actual: 2933 MT/s 
           type: Logical non-volatile device detail: synchronous non-volatile lrdimm 
           bus-width: 64 bits total: 72 bits manufacturer: Intel part-no: NMB1XXD256GPS 
           serial: 214400000E9B 
PCI Slots: Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short 
           Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use 
           length: Long 
           Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use 
           length: Long 
CPU:       Info: 12-Core model: Intel Xeon Gold 5317 socket: LGA4189 bits: 64 type: MT MCP 
           arch: Ice Lake family: 6 model-id: 6A (106) stepping: 6 microcode: D000390 cache: 
           L1: 960 KiB L2: 18 MiB L3: 18 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 144000 
           Speed: 3600 MHz min/max: 800/3600 MHz base/boost: 3000/4500 volts: 1.6 V 
           ext-clock: 100 MHz Core speeds (MHz): 1: 3600 2: 3600 3: 3600 4: 3600 5: 3600 6: 3600 
           7: 3600 8: 3600 9: 3600 10: 3600 11: 3600 12: 3600 13: 3600 14: 3600 15: 3600 16: 3600 
           17: 3600 18: 3600 19: 3600 20: 3600 21: 3600 22: 3600 23: 3600 24: 3600 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data mitigation: Clear CPU buffers; SMT vulnerable 
           Type: retbleed status: Not affected 
           Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 mitigation: Enhanced / Automatic IBRS, IBPB: conditional, RSB filling, 
           PBRSB-eIBRS: SW sequence 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 04:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
Network:   Device-1: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel port: 0780 
           bus-ID: 01:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ac:40 
           IP v4: 169.254.100.47/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:ac40/64 scope: link 
           Device-2: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel port: 0780 
           bus-ID: 01:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno2 state: up speed: 10000 Mbps duplex: full mac: 3c:ec:ef:62:ac:41 
           IP v4: 169.254.239.76/16 scope: link 
           IP v6: fe80::3eec:efff:fe62:ac41/64 scope: link 
           Device-3: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7020 
           bus-ID: 18:00.0 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f0 state: up speed: 10000 Mbps duplex: full mac: 00:1b:21:c3:82:2c 
           Device-4: Intel 82599ES 10-Gigabit SFI/SFP+ Network driver: ixgbe v: kernel port: 7000 
           bus-ID: 18:00.1 chip-ID: 8086:10fb class-ID: 0200 
           IF: enp24s0f1 state: down mac: 00:1b:21:c3:82:2e 
           Device-5: Intel Ethernet E810-C for QSFP driver: vfio-pci v: N/A modules: ice 
           port: 7000 bus-ID: 51:00.0 chip-ID: 8086:1592 class-ID: 0200 
           IF-ID-1: docker0 state: down mac: 02:42:3f:48:ba:c0 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: doctor-bridge state: up speed: 10000 Mbps duplex: unknown 
           mac: 00:1b:21:c3:82:2c 
           IP v4: 131.159.102.15/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::15/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::21b:21ff:fec3:822c/64 scope: link 
           IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:6dcc:65aa:4cb4:c1a9:9548/16 scope: global 
           IF-ID-4: usb0 state: unknown speed: -1 duplex: half mac: be:3a:f2:b6:05:9f 
           IP v4: 169.254.3.1/24 type: dynamic scope: global 
           IP v6: fe80::bc3a:f2ff:feb6:59f/64 scope: link 
           WAN IP: 131.159.102.15 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 1-11.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Hardware-1: Broadcom / LSI MegaRAID Tri-Mode SAS3408 driver: megaraid_sas 
           v: 07.725.01.00-rc1 port: d000 bus-ID: 8a:00.0 chip-ID: 1000.0017 rev: 01 
           class-ID: 0104 
           Device-1: zroot type: zfs status: ONLINE level: linear size: 1.73 TiB free: 1.35 TiB 
           allocated: 393 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 3.49 TiB usable: 5.22 TiB used: 1.72 TiB (32.8%) 
           ID-1: /dev/sda maj-min: 8:0 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 28 C scheme: GPT 
           SMART: yes state: enabled 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ1L21T9 size: 1.75 TiB block-size: 
           physical: 512 B logical: 512 B speed: <unknown> rotation: SSD serial: N/A rev: 102Q 
           temp: 28 C 
           SMART: yes state: enabled 
Partition: ID-1: / raw-size: N/A size: 1.66 TiB used: 391.13 GiB (23.0%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 104.9 MiB (10.3%) fs: vfat 
           block-size: 512 B dev: /dev/sda1 maj-min: 8:1 
           ID-3: /home raw-size: N/A size: 667.57 GiB used: 516.52 GiB (77.4%) fs: nfs4 
           remote: nfs:/export/home 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 52.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 454 
           Uptime: 13:11:53  up 7 days  0:46,  28 users,  load average: 0.10, 0.11, 0.09 
           wakeups: 0 Init: systemd v: 251 target: multi-user.target tool: systemctl Compilers: 
           gcc: 11.3.0 Packages: nix-default: 0 nix-sys: 406 lib: 70 nix-usr: 0 Client: Sudo 
           v: 1.9.13p3 inxi: 3.3.04 
```
![hardware topology](wilfred.lstopo.svg)
