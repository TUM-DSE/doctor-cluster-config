# donna

```
System:    Host: donna Kernel: 6.2.0-asahi aarch64 bits: 64 compiler: gcc v: 9.5.0 
           parameters: initrd=\efi\nixos\d6rbbk4yv9wnvwi9hl77iibnav59d1h6-initrd-linux-6.2.0-asahi-initrd.efi 
           init=/nix/store/j338qixbmm2paha8b3r8cdrwjl9jn60z-nixos-system-donna-22.11.20230417.a52af07/init 
           earlycon console=ttySAC0,1500000 console=tty0 boot.shell_on_fail 
           nvme_apple.flush_interval=0 console=tty0 console=ttyAMA0,115200 console=ttyS0,115200 
           nohibernate loglevel=4 
           Console: N/A Distro: NixOS 22.11 (Raccoon) 
Machine:   Type: ARM Device System: Apple Mac mini (M1, 2020) details: N/A serial: C07FG1NTQ6P0 
Memory:    RAM: total: 15.19 GiB used: 1.48 GiB (9.7%) 
           RAM Report: unknown-error: Unknown dmidecode error. Unable to generate data. 
PCI Slots: ARM: No ARM data found for this feature. 
CPU:       Info: 8-Core model: N/A variant-1: icestorm variant-2: firestorm bits: 64 type: MCP 
           arch: ARMv8 family: 8 model-id: 1 stepping: 1 
           features: Use -f option to see features bogomips: 0 
           Speed: 1956 MHz min/max: 600/2064:2988 MHz Core speeds (MHz): 1: 600 2: 600 3: 600 
           4: 600 5: 1956 6: 1956 7: 1956 8: 1956 
           Vulnerabilities: Type: itlb_multihit status: Not affected 
           Type: l1tf status: Not affected 
           Type: mds status: Not affected 
           Type: meltdown status: Not affected 
           Type: mmio_stale_data status: Not affected 
           Type: retbleed status: Not affected 
           Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl 
           Type: spectre_v1 mitigation: __user pointer sanitization 
           Type: spectre_v2 status: Not affected 
           Type: srbds status: Not affected 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: agx-t8103 driver: N/A bus-ID: N/A chip-ID: apple:206400000 class-ID: gpu 
           Device-2: display-subsystem driver: N/A bus-ID: N/A chip-ID: apple:soc 
           class-ID: display-subsystem 
           Display: server: No display server data found. Headless machine? tty: N/A 
           Message: Advanced graphics data unavailable in console for root. 
Audio:     Device-1: j274-macaudio driver: snd_soc_macaudio v: kernel bus-ID: N/A 
           chip-ID: apple:sound class-ID: sound 
           Sound Server-1: ALSA v: k6.2.0-asahi running: yes 
Network:   Device-1: Broadcom BRCM4378 Wireless Network Adapter vendor: Apple driver: N/A 
           modules: brcmfmac bus-ID: 01:00.0 chip-ID: 14e4:4425 class-ID: 0280 
           Device-2: Broadcom BRCM4378 Bluetooth vendor: Apple driver: N/A modules: hci_bcm4377 
           port: N/A bus-ID: 01:00.1 chip-ID: 14e4:5f69 class-ID: 0280 
           Device-3: Broadcom NetXtreme BCM57762 Gigabit Ethernet PCIe driver: tg3 v: kernel 
           port: N/A bus-ID: 03:00.0 chip-ID: 14e4:1682 class-ID: 0200 
           IF: enp3s0 state: up speed: 1000 Mbps duplex: full mac: 14:98:77:34:31:7a 
           IP v4: 131.159.38.222/23 type: dynamic scope: global 
           IP v6: 2a09:80c0:38::222/128 type: dynamic noprefixroute scope: global 
           IP v6: fe80::1698:77ff:fe34:317a/64 scope: link 
           IF-ID-1: docker0 state: down mac: 02:42:cd:06:de:f6 
           IP v4: 172.17.0.1/16 scope: global broadcast: 172.17.255.255 
           IF-ID-2: tinc.retiolum state: unknown speed: 10000 Mbps duplex: full mac: N/A 
           IP v6: 42:0:3c46:7f2f:ed62:c6fd:9f1b:9900/16 scope: global 
           WAN IP: 131.159.38.222 
RAID:      Device-1: zroot type: zfs status: ONLINE level: linear size: 728 GiB free: 706 GiB 
           allocated: 21.6 GiB 
           Components: Online: N/A 
Drives:    Local Storage: total: raw: 931.97 GiB usable: 1.62 TiB used: 21.81 GiB (1.3%) 
           ID-1: /dev/nvme0n1 maj-min: 259:0 vendor: Apple model: SSD AP1024Q size: 931.84 GiB 
           block-size: physical: 4096 B logical: 4096 B rotation: SSD serial: 0ba01279e344f43c 
           rev: 387.120. temp: 30 Celsius C scheme: GPT 
           SMART: yes health: PASSED on: 4d 18h cycles: 142 read-units: 3,541,076 [1.81 TB] 
           written-units: 4,531,936 [2.32 TB] 
           ID-2: /dev/nvme0n2 maj-min: 259:7 vendor: Apple model: SSD AP1024Q size: 3 MiB 
           block-size: physical: 4096 B logical: 4096 B rotation: SSD serial: 0ba01279e344f43c 
           rev: 387.120. temp: 30 Celsius C 
           SMART: yes health: PASSED on: 4d 18h cycles: 142 read-units: 3,541,076 [1.81 TB] 
           written-units: 4,531,936 [2.32 TB] 
           ID-3: /dev/nvme0n3 maj-min: 259:8 vendor: Apple model: SSD AP1024Q size: 128 MiB 
           block-size: physical: 4096 B logical: 4096 B rotation: SSD serial: 0ba01279e344f43c 
           rev: 387.120. temp: 29 Celsius C 
           SMART: yes health: PASSED on: 4d 18h cycles: 142 read-units: 3,541,076 [1.81 TB] 
           written-units: 4,531,936 [2.32 TB] 
Partition: ID-1: / raw-size: N/A size: 705.36 GiB used: 21.62 GiB (3.1%) fs: zfs 
           logical: zroot/root/nixos 
           ID-2: /boot raw-size: 477 MiB size: 475.9 MiB (99.78%) used: 192.7 MiB (40.5%) fs: vfat 
           block-size: 4096 B dev: /dev/nvme0n1p4 maj-min: 259:4 
           ID-3: /tmp raw-size: N/A size: 683.74 GiB used: 384 KiB (0.0%) fs: zfs 
           logical: zroot/root/tmp 
Swap:      Alert: No swap data was found. 
Sensors:   Message: No sensor data found. Is lm-sensors configured? 
Info:      Processes: 223 Uptime: N/A Init: systemd v: 251 target: multi-user.target 
           tool: systemctl Compilers: gcc: 9.5.0 Packages: 712 nix-default: 146 lib: 2 
           nix-sys: 420 lib: 61 nix-usr: 146 lib: 26 Client: Sudo v: 1.9.13p3 inxi: 3.3.04 
```
![hardware topology](donna.lstopo.svg)
