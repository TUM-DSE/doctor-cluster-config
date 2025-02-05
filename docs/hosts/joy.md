# joy

Currently in Teofil's office.

```
System:
  Host: joy Kernel: 5.10.216 arch: aarch64 bits: 64 compiler: gcc v: 13.3.0
    clocksource: arch_sys_counter
    parameters: BOOT_IMAGE=(hd0,gpt1)//kernels/fn72n2p8vbkgb7m0a14aqyf9qg1agi3m-linux-5.10.216-Image
    init=/nix/store/lyzsln57x6pxdcvms90qq5vvkjf13l08-nixos-system-joy-24.11.20250120.643e964/init
    console=ttyS0,115200 console=ttyAMA0,115200 console=tty0 nvidia.rm_firmware_active=all
    console=tty0 console=ttyTCU0,115200 nohibernate root=fstab loglevel=4
  Console: pty pts/0 DM: LightDM v: 1.32.0 Distro: NixOS 24.11 (Vicuna)
Machine:
  Type: Other-vm? System: NVIDIA product: Jetson AGX Orin Developer Kit v: N/A
    serial: 1424924383233 Chassis: type: 1 serial: N/A
  Mobo: NVIDIA model: Jetson serial: 1424924383233 UEFI: EDK II v: 35.6.0 date: 01/01/1980
Memory:
  System RAM: total: 64 GiB note: est. available: 61.3 GiB used: 2.35 GiB (3.8%)
  Array-1: capacity: 64 GiB use: Unknown slots: 0 modules: 0 EC: None
PCI Slots:
  Message: No ARM data found for this feature.
CPU:
  Info: model: ARMv8 v8l variant: armv8 bits: 64 type: MCP SMP arch: v8l family: 8 model-id: 0
    stepping: 1
  Topology: cpus: 3x cores: 4 smt: <unsupported> cache: L1: 3x 512 KiB (1.5 MiB)
    desc: d-4x64 KiB; i-4x64 KiB L2: 3x 1024 KiB (3 MiB) desc: 4x256 KiB L3: 3x 2 MiB (6 MiB)
    desc: 1x2 MiB
  Speed (MHz): avg: 780 high: 1344 min/max: 115/2202 base/boost: 2000/2000 scaling:
    driver: tegra194 governor: schedutil ext-clock: 31 MHz cores: 1: 1344 2: 1344 3: 1344 4: 1344
    5: 730 6: 730 7: 730 8: 730 9: 269 10: 269 11: 334 12: 192 bogomips: 750
  Features: Use -f option to see features
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow status: Not affected
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl
  Type: spectre_v1 mitigation: __user pointer sanitization
  Type: spectre_v2 mitigation: CSV2, BHB
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: tegra234-display driver: nv_platform v: N/A bus-ID: N/A chip-ID: nvidia:13800000
    class-ID: display
  Display: unspecified server: X.org v: 1.21.1.14 driver: N/A tty: 80x40
  API: EGL v: 1.5 hw: drv: nvidia platforms: surfaceless: drv: nvidia inactive: wayland,x11
  API: OpenGL v: 4.6.0 vendor: nvidia v: 35.5.0 note: console (EGL sourced) renderer: NVIDIA
    Tegra Orin (nvgpu)/integrated
Audio:
  Device-1: tegra186-ape driver: tegra_asoc: bus-ID: N/A chip-ID: nvidia:sound class-ID: sound
  API: ALSA v: k5.10.216 status: kernel-api tools: N/A
  Server-1: PipeWire v: 1.2.7 status: off with: 1: pipewire-pulse status: off 2: wireplumber
    status: off 3: pipewire-alsa type: plugin tools: pw-cat,pw-cli,wpctl
Network:
  Device-1: Realtek RTL8822CE 802.11ac PCIe Wireless Network Adapter vendor: AzureWave
    driver: rtw_8822ce v: N/A modules: rtw88_8822ce,rtl8822ce port: 1000 bus-ID: 0001:01:00.0
    chip-ID: 10ec:c822 class-ID: 0280
  IF: wlP1p1s0 state: down mac: 60:ff:9e:77:57:47
  Device-2: nvmgbe driver: nvethernet v: N/A port: N/A bus-ID: N/A chip-ID: nvidia:6810000
    class-ID: ethernet
  IF: eth0 state: up speed: 1000 Mbps duplex: full mac: 3c:6d:66:17:63:0c
  IP v4: 131.159.38.93/23 type: dynamic scope: global
  IP v6: 2a09:80c0:38::93/128 type: dynamic noprefixroute scope: global
  IP v6: fe80::3e6d:66ff:fe17:630c/64 scope: link
  IF-ID-1: can0 state: down mac: N/A
  IF-ID-2: can1 state: down mac: N/A
  IF-ID-3: dummy0 state: unknown speed: N/A duplex: N/A mac: 66:d6:6a:6c:6a:3c
  IP v4: 169.254.205.46/16 scope: link
  IP v6: fe80::64d6:6aff:fe6c:6a3c/64 scope: link
  IF-ID-4: tinc.retiolum state: unknown speed: 10 Mbps duplex: full mac: N/A
  IP v6: 42:0:3c46:abac:b113:405b:6f91:14b2/16 scope: global
  Info: services: sshd, systemd-networkd, systemd-timesyncd
  WAN IP: 131.159.38.93
Bluetooth:
  Device-1: IMC Networks Bluetooth Radio driver: rtk_btusb v: 3.1 type: USB rev: 1.0 speed: 12 Mb/s
    lanes: 1 mode: 1.1 bus-ID: 1-3:2 chip-ID: 13d3:3549 class-ID: e001 serial: 00e04c000001
  Report: hciconfig ID: hci0 rfk-id: 0 state: up address: 60:FF:9E:77:57:46 bt-v: 5.1 lmp-v: 10
    sub-v: cbc9 hci-v: 10 rev: 9a8
  Info: acl-mtu: 1021:6 sco-mtu: 255:12 link-policy: rswitch hold sniff park
    link-mode: peripheral accept
RAID:
  Device-1: zroot type: zfs status: ONLINE level: linear raw: size: 1.81 TiB free: 1.43 TiB
    allocated: 391 GiB zfs-fs: size: 1.76 TiB free: 1.37 TiB
  Components: Online:
  1: nvme0n1p2 maj-min: 259:2 size: 1.82 TiB
Drives:
  Local Storage: total: raw: 1.88 TiB usable: 1.82 TiB used: 318.82 GiB (17.2%)
  ID-1: /dev/mmcblk0 maj-min: 179:0 model: DG4064 size: 59.22 GiB block-size: physical: 512 B
    logical: 512 B tech: SSD serial: 0xb7596632 fw-rev: 0x8 scheme: GPT
  SMART Message: Unknown smartctl error. Unable to generate data.
  ID-2: /dev/nvme0n1 maj-min: 259:0 vendor: Seagate model: WDS200T1X0E-00AFY0 size: 1.82 TiB
    block-size: physical: 512 B logical: 512 B speed: 63.2 Gb/s lanes: 4 tech: SSD
    serial: 213328800075 fw-rev: 613000WD temp: 49.9 C scheme: GPT
  SMART: yes health: PASSED on: 56d 16h cycles: 3,227 read-units: 164,938,623 [84.4 TB]
    written-units: 87,188,914 [44.6 TB]
Partition:
  ID-1: / raw-size: N/A size: 1.69 TiB used: 318.75 GiB (18.5%) fs: zfs logical: zroot/root/nixos
  ID-2: /boot raw-size: 1024 MiB size: 1022 MiB (99.80%) used: 78.2 MiB (7.7%) fs: vfat
    block-size: 512 B dev: /dev/nvme0n1p1 maj-min: 259:1
  ID-3: /home raw-size: N/A size: 2.74 TiB used: 1.96 TiB (71.7%) fs: nfs4
    remote: nfs:/export/home
  ID-4: /tmp raw-size: N/A size: 1.37 TiB used: 256 KiB (0.0%) fs: zfs logical: zroot/root/tmp
Swap:
  Alert: No swap data was found.
Sensors:
  System Temperatures: cpu: 60.5 C mobo: N/A
  Fan Speeds (rpm): N/A
Info:
  Processes: 367 Power: uptime: 214d 20h 5m states: freeze,mem suspend: deep avail: s2idle
    wakeups: 0 Init: systemd v: 256 default: graphical tool: systemctl
  Packages: pm: nix-default pkgs: 0 pm: nix-sys pkgs: 879 libs: 212 pm: nix-usr pkgs: 0
    Compilers: gcc: 13.3.0 Client: Sudo v: 1.9.16p2 inxi: 3.3.35
```
![hardware topology](joy.lstopo.svg)
