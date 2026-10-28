# clockwork — Orange Pi 5 Ultra (RK3588)

| | |
|---|---|
| SoC | Rockchip RK3588, 4× Cortex-A76 + 4× Cortex-A55 (`armv8.2-a`), NPU |
| RAM | 16 GB LPDDR5 |
| eMMC | 256 GB (`mmc-A3V014_0x00130400`) — `/boot` + ZFS root pool `zroot` |
| NVMe | 2 TB WD SN850X (`nvme-WDS200T1X0E-00AFY0_213328800075`) — ZFS pool `zscratch`, `/scratch` |
| Network | RTL8125 2.5GbE on PCIe, `c0:74:2b:fb:26:80` (`enP3p49s0`), 131.159.38.26 / 2a09:80c0:38::26 |

No IPMI, no serial console. If a boot fails, you need an HDMI screen or the
rescue SD card (below).

## Things that differ from the rest of the cluster

- **Boot:** no UEFI. Vendor U-Boot 2017.09 in SPI NOR boots
  `/boot/extlinux/extlinux.conf` from the eMMC (`generic-extlinux-compatible`).
  Never flash SPI: recovering from a bad flash needs maskrom mode over USB-C.
  The BootROM tries the SD card first, so a card with its own U-Boot takes
  over the boot without touching the board.
- **eMMC layout:** the first partition starts at **30 MiB**, because sectors 64
  and 16384 hold a second copy of the Rockchip loader and U-Boot. This is why
  `hosts/clockwork.nix` spells out the `modules/disko-zfs.nix` layout instead
  of importing it.
- **Kernel:** Armbian's Rockchip BSP kernel (`pkgs/kernels/linux-rk3588-vendor.nix`,
  `rk-6.1-rkr7.2`, 6.1.172), because the users' NPU stack (librknnrt, RKLLM,
  rknn-toolkit2) needs Rockchip's `rknpu` driver (0.9.8). Mainline only has
  `rocket`. The NPU shows up as `/dev/dri/renderD129`. The kernel is built
  from Armbian's config (vendored), with gcc 13 and `WERROR` off. It needs
  `boot.initrd.allowMissingModules` and is pinned by hand, outside the cluster
  kernel. Reported risk: ZFS oopses on older vendor 6.1 kernels. We haven't
  seen any.
- **`iommu.passthrough=1`:** without it, mainline kernels never detect the NVMe
  (`Identify Controller failed (-4)`), because both PCIe controllers sit
  behind the SMMU. Harmless on the vendor kernel.
- **ZFS ARC capped at 2 GB**, to leave the RAM to NPU/LLM jobs.
- **Nix builds** go to `zscratch/nix-build` (`/scratch/.nix-build`), not the eMMC.

## Reinstalling

`inv ssh-install-nixos` does not work here: a kexec leaves the board
unreachable (most likely the PCIe NIC doesn't come back up). On 2026-10-28
the board was installed from a bootable microSD card instead:

- The card was a NixOS SD image (`sd-image.nix` plus the install-iso
  base config). Mainline U-Boot was written into the gap the 30 MiB offset
  leaves before the first partition, and the image used the same kernel
  parameters as the host. Build it on eliza, since no x86 machine here
  builds aarch64. Its root partition has to be grown after booting.
- With the card booted, the system closure and the disko script were built
  on eliza and copied straight into the board's store with
  `nix copy --no-check-sigs`. The disko script was run on the board,
  followed by `nixos-install --system …`, with the host keys from
  `hosts/clockwork.yml` placed in `/mnt/etc/ssh` beforehand. Export the
  pools, power off, pull the card.
