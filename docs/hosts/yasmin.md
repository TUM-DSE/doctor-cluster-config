# yasmin

```
System:    Host: yasmin Kernel: 6.2.16 aarch64 bits: 64 compiler: gcc v: 9.5.0 
           parameters: BOOT_IMAGE=(hd3,gpt1)//kernels/q0yfmrxvbji2lq4bwmjvgxhzhmp4hj96-linux-6.2.16-Image 
           init=/nix/store/9ibmv3x4nacvcrjrslkv8ddhnkbqp8zn-nixos-system-yasmin-22.11.20230523.fc06fd7/init 
           console=tty0 console=ttyAMA0,115200 console=ttyS0,115200 console=ttyS0,115200n8 
           console=ttyAMA0,115200n8 console=tty0 nohibernate loglevel=4 
           Console: N/A Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: Server System: GIGABYTE product: R181-T90-00 v: 0100 serial: GLG4NN012A0002 
           Chassis: type: 23 v: 1.0 serial: 01234567890123456789AB 
           Mobo: GIGABYTE model: MT91-FS1-00 v: 00030101 serial: JH6N6700014 UEFI: GIGABYTE v: F34 
           date: 08/13/2020 
Memory:    RAM: total: 251.26 GiB used: 69.87 GiB (27.8%) 
           Array-1: capacity: 2 TiB slots: 12 EC: Multi-bit ECC max-module-size: 170.67 GiB 
           note: est. 
           Device-1: DIMM_P0_A0 size: 64 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: registered (buffered) bus-width: 64 bits total: 72 bits manufacturer: Samsung 
           part-no: M393A8G40AB2-CWE serial: 1158043522 
           Device-2: DIMM_P0_B0 size: 64 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: registered (buffered) bus-width: 64 bits total: 72 bits manufacturer: Samsung 
           part-no: M393A8G40AB2-CWE serial: 1158043450 
           Array-2: capacity: 2 TiB slots: 12 EC: Multi-bit ECC max-module-size: 170.67 GiB 
           note: est. 
           Device-1: DIMM_P1_I0 size: 64 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: registered (buffered) bus-width: 64 bits total: 72 bits manufacturer: Samsung 
           part-no: M393A8G40AB2-CWE serial: 1158043569 
           Device-2: DIMM_P1_J0 size: 64 GiB speed: spec: 3200 MT/s actual: 2666 MT/s type: DDR4 
           detail: registered (buffered) bus-width: 64 bits total: 72 bits manufacturer: Samsung 
           part-no: M393A8G40AB2-CWE serial: 27077680 
PCI Slots: Slot: 0 type: x16 PCI Express 3 OCP_1_x16 status: Available length: Short 
           Slot: 4 type: x8 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x8 status: Available 
           length: Short 
           Slot: 6 type: x4 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x4 status: In Use 
           length: Short 
           Slot: 7 type: x4 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x4 status: Available 
           length: Short 
           Slot: 8 type: x8 PCI Express 3 PCIE SLOT2_2_x8 status: Available length: Short 
           Slot: 10 type: x4 PCI Express 3 LoM QL41102 status: In Use length: Short 
           Slot: 12 type: x8 PCI Express 3 LSI 3008 status: In Use length: Short 
           Slot: 14 type: x16 PCI Express 3 OCP_2_x16 status: Available length: Long 
           Slot: 18 type: x16 PCI Express 3 PCIE SLOT3_1_x16 status: Available length: Long 
           Slot: 26 type: x8 PCI Express 3 PCIE SLOT3_2_x8 status: Available length: Short 
           Slot: 22 type: x16 PCI Express 3 PCIE SLOT4_x16 status: Available length: Long 
CPU:       Info: 224-Core (2-Die) model: N/A bits: 64 type: MCP MCM arch: ARMv8 family: 8 
           model-id: 1 stepping: 2 
           features: Use -f option to see features bogomips: 89600 
           Speed: N/A min/max: N/A base/boost: 2000/2500 volts: 0.8 V ext-clock: 33 MHz 
           Core speeds (MHz): No per core speed data found. 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data status: Not affected 
           Type: retbleed status: Not affected 
           Type: spec_store_bypass status: Vulnerable 
           Type: spectre_v1 mitigation: __user pointer sanitization 
           Type: spectre_v2 status: Vulnerable 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family driver: ast v: kernel bus-ID: 0e:00.0 
           chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Message: No device data found. 
           Sound Server-1: ALSA v: k6.2.16 running: yes 
Network:   Device-1: QLogic FastLinQ QL41000 Series 10/25/40/50GbE vendor: Gigabyte driver: qede 
           v: kernel port: N/A bus-ID: 0b:00.0 chip-ID: 1077:8070 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: b4:2e:99:3f:74:7c 
           IP v4: 131.159.102.7/24 type: dynamic scope: global broadcast: 131.159.102.255 
           IP v6: 2a09:80c0:102::7/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::b62e:99ff:fe3f:747c/64 scope: link 
           Device-2: QLogic FastLinQ QL41000 Series 10/25/40/50GbE vendor: Gigabyte driver: qede 
           v: kernel port: N/A bus-ID: 0b:00.1 chip-ID: 1077:8070 class-ID: 0200 
           IF: eno1 state: up speed: 10000 Mbps duplex: full mac: b4:2e:99:3f:74:7c 
           IP v4: 131.159.102.7/24 type: dynamic scope: global broadcast: 131.159.102.255 
           IP v6: 2a09:80c0:102::7/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::b62e:99ff:fe3f:747c/64 scope: link 
           Device-3: American Megatrends Virtual Ethernet type: USB driver: cdc_ether 
           bus-ID: 3-1.3:5 chip-ID: 046b:ffb0 class-ID: 0a00 serial: 1234567890 
           IF: enp0s15f1u1u3c2 state: unknown speed: -1 duplex: half mac: 16:d4:72:2c:21:77 
           IP v4: 169.254.252.174/16 scope: link 
           IP v6: fe80::14d4:72ff:fe2c:2177/64 scope: link 
           IF-ID-1: docker0 state: up speed: 10000 Mbps duplex: unknown mac: 02:42:c6:bd:59:63 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IP v6: fe80::42:c6ff:febd:5963/64 scope: link 
           IF-ID-2: eno2 state: down mac: b4:2e:99:3f:74:7d 
           IF-ID-3: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:9b18:d5e7:d945:ccf8:829e/16 scope: global 
           IF-ID-4: veth3df5c1d state: up speed: 10000 Mbps duplex: full mac: 22:d4:8b:08:64:f7 
           WAN IP: 131.159.102.7 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 672 GiB 
           allocated: 216 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: 1.78 TiB used: 1.72 TiB (96.5%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: SSD 970 EVO Plus 1TB 
           size: 931.51 GiB block-size: physical: 512 B logical: 512 B speed: 31.6 Gb/s lanes: 4 
           rotation: SSD serial: S4EWNX0R514087T rev: 2B2QEXM7 temp: 31 Celsius C 
           SMART: yes health: PASSED on: 68d 14h cycles: 6 read-units: 316 [161 MB] 
           written-units: 562,574 [288 GB] 
           ID-2: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ7LH960HAJR-00005 
           family: based SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B 
           sata: 3.2 speed: 6.0 Gb/s rotation: SSD serial: S45NNC0R216725 rev: 904Q temp: 22 C 
           scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 312d 23h cycles: 21 read: 16.68 TiB 
           written: 30.94 TiB 
Partition: ID-1: / raw-size: N/A size: 730.19 GiB used: 86.64 GiB (11.9%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 87.4 MiB (17.5%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /home raw-size: N/A size: 680.07 GiB used: 529.25 GiB (77.8%) fs: nfs4 
           remote: nfs:/export/home 
           ID-4: /tmp raw-size: N/A size: 643.95 GiB used: 403.8 MiB (0.1%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 37.7 C mobo: 36.6 C 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 2313 
           Uptime: 15:02:10  up 12 days 14:45,  1 user,  load average: 0.17, 0.06, 0.01 
           Init: systemd v: 251 target: multi-user.target tool: systemctl Compilers: gcc: 9.5.0 
           Packages: nix-default: 0 nix-sys: 373 lib: 59 nix-usr: 0 Client: Sudo v: 1.9.13p3 
           inxi: 3.3.04 
```
![hardware topology](yasmin.lstopo.svg)
