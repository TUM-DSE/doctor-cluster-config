# bill

```
System:    Host: bill Kernel: 6.8.12 x86_64 bits: 64 compiler: gcc v: 13.2.0 
           parameters: initrd=\EFI\nixos\l0vyhjxfvrj9hx3kywkfaax364kp82gh-initrd-linux-6.8.12-initrd.efi 
           init=/nix/store/7293rs8ykdqjfmjshcgi1liqds0cq3m4-nixos-system-bill-24.05.20240709.249fbde/init 
           console=ttyS0,115200 console=tty0 console=ttyS1,115200n8 console=tty1 nohibernate 
           loglevel=4 
           Console: N/A Distro: NixOS 24.05 (Uakari) 
Machine:   Type: Desktop System: sysGen www.sysgen.de product: Super Server v: 0123456789 
           serial: 0123456789 Chassis: type: 3 v: 0123456789 serial: 0123456789 
           Mobo: Supermicro model: X12SCZ-TLN4F v: 1.01A serial: UM20BS000421 
           UEFI: American Megatrends v: 1.0a date: 01/11/2021 
Memory:    RAM: total: 125.66 GiB used: 25.73 GiB (20.5%) 
           Array-1: capacity: 128 GiB note: est. slots: 4 EC: None max-module-size: 32 GiB 
           note: est. 
           Device-1: DIMMA1 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 735171F0 
           Device-2: DIMMA2 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 041229CA 
           Device-3: DIMMB1 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 7C516948 
           Device-4: DIMMB2 size: 32 GiB speed: 2400 MT/s type: DDR4 
           detail: synchronous unbuffered (unregistered) bus-width: 64 bits total: 64 bits 
           manufacturer: Kingston part-no: KHX3200C16D4/32GX serial: 735211C0 
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
           Speed: 800 MHz min/max: 800/5300 MHz base/boost: 3600/3700 volts: 0.9 V 
           ext-clock: 100 MHz Core speeds (MHz): 1: 800 2: 800 3: 800 4: 800 5: 800 6: 5087 7: 800 
           8: 800 9: 800 10: 800 11: 800 12: 5100 13: 800 14: 800 15: 800 16: 800 17: 800 18: 800 
           19: 800 20: 800 
           Vulnerabilities: Type: gather_data_sampling status: Vulnerable: No microcode 
           Type: itlb_multihit status: KVM: VMX disabled 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data 
           status: Vulnerable: Clear CPU buffers attempted, no microcode; SMT vulnerable 
           Type: reg_file_data_sampling status: Not affected 
           Type: retbleed mitigation: Enhanced IBRS 
           Type: spec_rstack_overflow status: Not affected 
           Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 mitigation: Enhanced / Automatic IBRS; IBPB: conditional; RSB filling; 
           PBRSB-eIBRS: SW sequence; BHI: SW loop, KVM: SW loop 
           Type: srbds status: Vulnerable: No microcode 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: ASPEED Graphics Family vendor: Super Micro driver: ast v: kernel 
           bus-ID: 05:00.0 chip-ID: 1a03:2000 class-ID: 0300 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Device-1: Intel Comet Lake PCH cAVS vendor: Super Micro driver: snd_hda_intel v: kernel 
           alternate: snd_soc_skl,snd_sof_pci_intel_cnl bus-ID: 00:1f.3 chip-ID: 8086:06c8 
           class-ID: 0403 
           Sound Server-1: ALSA v: k6.8.12 running: yes 
Network:   Device-1: Intel Ethernet I219-LM vendor: Super Micro driver: e1000e v: kernel 
           port: efa0 bus-ID: 00:1f.6 chip-ID: 8086:0d4c class-ID: 0200 
           IF: eno1 state: down mac: 3c:ec:ef:2c:f5:54 
           Device-2: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: kernel 
           port: efa0 bus-ID: 02:00.0 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave0 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           Device-3: Mellanox MT27710 Family [ConnectX-4 Lx] driver: mlx5_core v: kernel 
           port: efa0 bus-ID: 02:00.1 chip-ID: 15b3:1015 class-ID: 0200 
           IF: slave1 state: up speed: 10000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           Device-4: Intel I210 Gigabit Network vendor: Super Micro driver: igb v: kernel 
           port: 4000 bus-ID: 03:00.0 chip-ID: 8086:1533 class-ID: 0200 
           IF: eno2 state: down mac: 3c:ec:ef:2c:f5:55 
           Device-5: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 3000 bus-ID: 06:00.0 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno3 state: down mac: 3c:ec:ef:30:36:5a 
           Device-6: Intel Ethernet 10G X550T vendor: Super Micro driver: ixgbe v: kernel 
           port: 3000 bus-ID: 06:00.1 chip-ID: 8086:1563 class-ID: 0200 
           IF: eno4 state: down mac: 3c:ec:ef:30:36:5b 
           IF-ID-1: bond1 state: up speed: 20000 Mbps duplex: full mac: b8:ce:f6:0b:ee:64 
           IP v4: 131.159.102.1/24 type: dynamic scope: global 
           IP v6: 2a09:80c0:102::1/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::bace:f6ff:fe0b:ee64/64 scope: link 
           IF-ID-2: bonding_masters state: N/A speed: N/A duplex: N/A mac: N/A 
           IF-ID-3: br-9445ed3d463d state: down mac: 02:42:8d:c0:12:5a 
           IP v4: 192.168.49.1/24 scope: global broadcast: 192.168.49.255 
           IF-ID-4: docker0 state: down mac: 02:42:6c:85:d4:a1 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-5: eth0 state: down mac: b0:3a:f2:b6:05:9f 
           IF-ID-6: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:87ed:6232:1016:7553:939c/16 scope: global 
           WAN IP: 131.159.102.1 
Bluetooth: Device-1: Insyde RNDIS/Ethernet Gadget type: USB driver: rndis_host v: kernel 
           bus-ID: 1-13.2:4 chip-ID: 0b1f:03ee class-ID: 0a00 
           Report: This feature requires one of these tools: hciconfig/bt-adapter 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 888 GiB free: 723 GiB 
           allocated: 165 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 18.92 TiB usable: 19.79 TiB used: 108.49 GiB (0.5%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Samsung model: MZ1L23T8HBLA-00A07 
           size: 3.49 TiB block-size: physical: 4096 B logical: 512 B speed: 63.2 Gb/s lanes: 4 
           rotation: SSD serial: S667NJ0T748763 rev: GDC7302Q temp: 47 ° (320 K) C scheme: GPT 
           SMART: yes health: PASSED on: 366d 2h cycles: 9 read-units: 135,679,804 [69.4 TB] 
           written-units: 38,021,268 [19.4 TB] 
           ID-2: /dev/sda maj-min: 8:0 vendor: Western Digital model: WD80EFBX-68AZZN0 
           size: 7.28 TiB block-size: physical: 4096 B logical: 512 B sata: 3.2 speed: 6.0 Gb/s 
           rotation: 7200 rpm serial: VRJ0MZ7K rev: 0A85 temp: 42 C scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 2y 261d 10h cycles: 9 
           ID-3: /dev/sdb maj-min: 8:16 vendor: Samsung model: MZ7LH960HAJR-00005 
           family: based SSDs size: 894.25 GiB block-size: physical: 4096 B logical: 512 B 
           sata: 3.2 speed: 6.0 Gb/s rotation: SSD serial: S45NNA0N901002 rev: 404Q temp: 41 C 
           scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 3y 123d 23h cycles: 44 read: 36.45 TiB 
           written: 66.8 TiB 
           ID-4: /dev/sdc maj-min: 8:32 vendor: Western Digital model: WD80EFBX-68AZZN0 
           size: 7.28 TiB block-size: physical: 4096 B logical: 512 B sata: 3.2 speed: 6.0 Gb/s 
           rotation: 7200 rpm serial: VRJXEZ3K rev: 0A85 temp: 43 C scheme: GPT 
           SMART: yes state: enabled health: PASSED on: 2y 261d 10h cycles: 9 
Partition: ID-1: / raw-size: N/A size: 802.73 GiB used: 108.43 GiB (13.5%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 500 MiB size: 499.7 MiB (99.95%) used: 56.9 MiB (11.4%) fs: vfat 
           block-size: 512 B dev: /dev/sdb1 maj-min: 8:17 
           ID-3: /tmp raw-size: N/A size: 694.3 GiB used: 2.4 MiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No ipmi sensor data found. 
           System Temperatures: lm-sensors cpu: 52.0 C mobo: N/A 
           Fan Speeds (RPM): lm-sensors N/A 
Info:      Processes: 431 
           Uptime: 14:54:17  up 3 days 14:32,  1 user,  load average: 0.00, 0.00, 0.00 wakeups: 0 
           Init: systemd v: 255 target: multi-user.target tool: systemctl Compilers: gcc: 10.3.0 
           Packages: nix-default: 0 nix-sys: 595 lib: 135 nix-usr: 0 Client: Sudo v: 1.9.15p5 
           inxi: 3.3.04 
```
![hardware topology](bill.lstopo.svg)
