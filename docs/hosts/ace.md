# ace

## OS

This machine is running [CheriBSD](https://www.cheribsd.org). 

## SSH

This machine is available from the outside.

```shell
ssh user@ace.dos.cit.tum.de
```

## USers

Currently, these users have access:

- `martin`
- `ilya`
- `christian`

## Debugging

Connect your machine to the board using debug USB cable.

Accessing the Morello console to troubleshoot/reboot/shutdown: https://ctsrd-cheri.github.io/cheribsd-getting-started/morello-console/index.html


```
System:
  Host: ace.dos.cit.tum.de Kernel: FreeBSD 14.0-CURRENT arm64 bits: 64 Console: pty pts/1
    OS: FreeBSD 14.0-CURRENT
Machine:
  Type: Tower System: ARM product: Morello System Development Platform v: N/A serial: N/A
  Mobo: N/A model: N/A serial: N/A UEFI: ARM v: EDK II rev: 0.0 date: Nov 29 2022
CPU:
  Info: quad core model: Research Morello SoC r0p0 bits: 64 type: MCP
  Speed: N/A min/max: N/A cores: No OS support for core speeds.
Graphics:
  Message: No device data found.
  Display: server: No display server data found. Headless machine? tty: 273x71
  Message: Advanced graphics data unavailable in console for root.
Audio:
  Message: No device data found.
  Sound Server-1: OSS v: 2009061500 running: yes
Network:
  Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet driver: re
  IF: re0 state: active speed: 1000baseT duplex: full-duplex mac: 00:02:f7:00:9c:a5
Drives:
  Local Storage: total: 223.57 GiB used: 7.1 GiB (3.2%)
  ID-1: /dev/ada0 vendor: Western Digital model: WD Green 2.5 240GB 42051100 size: 223.57 GiB
    scheme: GPT
Partition:
  ID-1: / size: 212.85 GiB used: 7.1 GiB (3.3%) fs: ufs dev: /dev/ada0p2
  ID-2: /boot/efi size: 259.9 MiB used: 1.7 MiB (0.7%) fs: msdosfs dev: /dev/ada0p1
Swap:
  ID-1: swap-1 type: partition size: 3.57 GiB used: 0 KiB (0.0%) dev: /dev/ada0p3
Sensors:
  Message: No sensor data found. Are sensors present?
Argument "avm" isn't numeric in numeric ne (!=) at /usr/local64/bin/inxi line 26010.
Argument "fre" isn't numeric in numeric ne (!=) at /usr/local64/bin/inxi line 26013.
Info:
  Processes: 41 Uptime: 1d 18h 23m Memory: 15.94 GiB used: 1.02 GiB (6.4%) Init: init (BSD)
  Shell: Sudo inxi: 3.3.11
```

![hardware topology](ace.lstopo.svg)
