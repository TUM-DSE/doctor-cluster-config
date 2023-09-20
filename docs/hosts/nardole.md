# nardole

```
System:    Host: nardole Kernel: 6.4.16 x86_64 bits: 64 compiler: gcc v: 12.2.0 
           parameters: initrd=\efi\nixos\qv3kw6kikqkz7dyqm3sn2qpnm7fmq3yk-initrd-linux-6.4.16-initrd.efi 
           init=/nix/store/cy3qaplwixdl3ak7ngga38ff7rc04jrd-nixos-system-nardole-23.05.20230917.67f6c1e/init 
           console=tty0 console=ttyS0,115200 console=ttyS1,115200n8 console=tty1 nohibernate 
           loglevel=4 
           Console: N/A Distro: NixOS 23.05 (Stoat) 
Machine:   Type: Desktop System: sysGen www.sysgen.de product: Super Server v: 0123456789 
           serial: 0123456789 Chassis: type: 3 v: 0123456789 serial: 0123456789 
           Mobo: Supermicro model: X12SCZ-TLN4F v: 1.01A serial: UM20BS000427 
           UEFI: American Megatrends v: 1.0a date: 01/11/2021 
Memory:    RAM: total: 125.69 GiB used: 7.53 GiB (6.0%) 
           Array-1: capacity: 128 GiB note: est. slots: 4 EC: None max-module-size: 32 GiB 
           note: est. 
           Device-1: DIMMA1 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 825151A9 
           Device-2: DIMMA2 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 735150BB 
           Device-3: DIMMB1 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 735171CE 
           Device-4: DIMMB2 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 041171D8 
PCI Slots: Slot: 4 type: x4 PCI Express 3 x8 PCH SLOT4 PCI-E 3.0 X4 (IN X8) status: In Use 
           length: Short 
           Slot: 6 type: x16 PCI Express 3 x16 CPU SLOT6 PCI-E 3.0 X16 status: Available 
           length: Long 
           Slot: 7 type: x4 PCI Express 3 x4 PCH SLOT7 PCI-E 3.0 X4 status: Available 
           length: Short 
           Slot: N/A type: x4 M.2 Socket 3 PCI-E M.2-M1 status: In Use length: Short 
           Slot: N/A type: x1 M.2 Socket 1-SD PCI-E M.2-E1 status: Available length: Short 
CPU:       Info: 10-Core model: Intel Core i9-10900K bits: 64 type: MT MCP arch: Comet Lake 
           family: 6 model-id: A5 (165) stepping: 5 microcode: E0 cache: L1: 640 KiB L2: 20 MiB 
           L3: 20 MiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 147994 
           Speed: 800 MHz min/max: 800/5300 MHz base/boost: 3600/3700 volts: 1.0 V 
           ext-clock: 100 MHz Core speeds (MHz): 1: 800 2: 800 3: 800 4: 800 5: 800 6: 800 7: 5100 
           8: 800 9: 800 10: 800 11: 800 12: 800 13: 800 14: 801 15: 800 16: 800 17: 4721 18: 800 
           19: 5100 20: 800 
           Vulnerabilities: Type: gather_data_sampling status: Vulnerable: No microcode 
           Type: itlb_multihit status: KVM: VMX disabled 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data 
           status: Vulnerable: Clear CPU buffers attempted, no microcode; SMT vulnerable 
           Type: retbleed mitigation: Enhanced IBRS 
           Type: spec_rstack_overflow status: Not affected 
           Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 mitigation: Enhanced / Automatic IBRS, IBPB: conditional, RSB filling, 
           PBRSB-eIBRS: SW sequence 
           Type: srbds status: Vulnerable: No microcode 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 05:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Device-1: Intel Comet Lake PCH cAVS vendor: Super Micro driver: snd_hda_intel v: kernel 
           alternate: snd_soc_skl,snd_sof_pci_intel_cnl bus-ID: 00:1f.3 chip-ID: 8086:06c8 
           class-ID: 0403 
           Sound Server-1: ALSA v: k6.4.16 running: yes 
Network:   Device-1: Intel Ethernet I219-LM vendor: Super Micro driver: e1000e v: kernel 
           port: efa0 bus-ID: 00:1f.6 chip-ID: 8086:0d4c class-ID: 0200 
           IF: eno1 state: down mac: 3c:ec:ef:2c:f5:14 
           Device-2: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: kernel 
           port: efa0 bus-ID: 02:00.0 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave0 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           Device-3: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: kernel 
           port: efa0 bus-ID: 02:00.1 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave1 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           Device-4: Intel I210 Gigabit Network vendor: Super Micro driver: igb v: kernel 
           port: 4000 bus-ID: 03:00.0 chip-ID: 8086:1533 class-ID: 0200 
           IF: eno2 state: down mac: 3c:ec:ef:2c:f5:15 
           Device-5: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel port: 3000 
           bus-ID: 06:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno3 state: down mac: 3c:ec:ef:30:36:1a 
           Device-6: Intel Ethernet X550 vendor: Super Micro driver: ixgbe v: kernel port: 3000 
           bus-ID: 06:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno4 state: down mac: 3c:ec:ef:30:36:1b 
           IF-ID-1: bond1 state: up speed: 20000 Mbps duplex: full mac: b8:ce:f6:0b:ee:74 
           IP v4: 131.159.102.2/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::2/128 type: dynamic noprefixroute scope: global 
           IP v6: 2a09:80c0:102::f000:1/64 scope: global 
           IP v6: fe80::bace:f6ff:fe0b:ee74/64 scope: link 
           IF-ID-2: bonding_masters state: N/A speed: N/A duplex: N/A mac: N/A 
           IF-ID-3: docker0 state: down mac: 02:42:64:6a:18:01 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-4: eth0 state: down mac: b0:3a:f2:b6:05:9f 
           IF-ID-5: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:362d:a9aa:4996:c78e:839a/16 scope: global 
           WAN IP: 131.159.102.2 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 1-13.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zpool1 type: zfs status: ONLINE level: linear size: 3.48 TiB free: 2.65 TiB 
           allocated: 854 GiB 
           Components: Online: N/A 
           Device-2: zpool2 type: zfs status: ONLINE level: linear size: 14.5 TiB free: 13.5 TiB 
           allocated: 1.02 TiB 
           Components: Online: N/A 
           Device-3: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 731 GiB 
           allocated: 157 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 26.2 TiB usable: 45.05 TiB used: 892.73 GiB (1.9%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: MZ1L23T8HBLA-00A07 
           size: 3.49 TiB block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 
           rotation: SSD serial: S667NE0W503478 rev: GDC7302Q temp: 38 ° (311 K) C scheme: GPT 
           SMART: yes health: PASSED on: 50d 19h cycles: 2 read-units: 11,427,563 [5.85 TB] 
           written-units: 2,317,905 [1.18 TB] 
           ID-2: /dev/sda maj-min: 8:0 vendor: Samsung model: MZ7LH960HAJR-00005 
           family: based SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B 
           sata: 3.2 speed: 6.0 Gb/s rotation: SSD serial: S45NNA0N900985 rev: 404Q temp: 24 C 
           scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 2y 192d 13h cycles: 45 read: 19.44 TiB 
           written: 32.61 TiB 
           ID-3: /dev/sdb maj-min: 8:16 vendor: Western Digital model: WD80EFBX-68AZZN0 
           size: 7.28 TiB block-size: physical: 4096 B logical: 512 B sata: 3.2 speed: 6.0 Gb/s 
           rotation: 7200 rpm serial: VRHZGW5K rev: 0A85 temp: 31 C scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 313d 21h cycles: 4 
           ID-4: /dev/sdc maj-min: 8:32 vendor: Western Digital model: WD80EFBX-68AZZN0 
           size: 7.28 TiB block-size: physical: 4096 B logical: 512 B sata: 3.2 speed: 6.0 Gb/s 
           rotation: 7200 rpm serial: VRJ0RM2K rev: 0A85 temp: 29 C scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 313d 21h cycles: 4 
           ID-5: /dev/sdd maj-min: 8:48 vendor: Western Digital model: WD80EFBX-68AZZN0 
           size: 7.28 TiB block-size: physical: 4096 B logical: 512 B sata: 3.2 speed: 6.0 Gb/s 
           rotation: 7200 rpm serial: VRJ0HPEK rev: 0A85 temp: 28 C scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 1y 313d 21h cycles: 4 
Partition: ID-1: / raw-size: N/A size: 853.35 GiB used: 151.2 GiB (17.7%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 213 MiB (42.6%) fs: vfat 
           block-size: 512 B dev: /dev/sda1 maj-min: 8:1 
           ID-3: /tmp raw-size: N/A size: 702.15 GiB used: 1.1 MiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 48.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 553 
           Uptime: 11:02:05  up 1 day 13:39,  0 users,  load average: 0.06, 0.03, 0.00 wakeups: 0 
           Init: systemd v: 253 target: multi-user.target tool: systemctl Compilers: gcc: 12.2.0 
           Packages: nix-default: 0 nix-sys: 553 lib: 123 nix-usr: 0 Client: Sudo v: 1.9.13p3 
           inxi: 3.3.04 
```
![hardware topology](nardole.lstopo.svg)
