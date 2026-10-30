# Orange Pi 5 Ultra -- Rockchip RK3588, 4x Cortex-A76 + 4x Cortex-A55, 16 GB
# LPDDR5, Realtek RTL8125 2.5GbE behind PCIe, one M.2 NVMe slot, 256 GB eMMC.
#
# Unlike every other machine in this repo, the board has no UEFI firmware.
# It is brought up by a Rockchip first-stage loader (idbloader) plus U-Boot
# living outside any partition: in the 16 MB SPI NOR flash (mtd0) and, as a
# second copy, in the gap before the first eMMC partition. As shipped both
# copies are vendor U-Boot 2017.09-orangepi, which already implements the
# generic distro boot protocol:
#
#   boot_targets           = mmc0 mmc1 nvme mtd2 mtd1 mtd0 usb0 pxe dhcp
#   scan_dev_for_extlinux  = ... ${prefix}extlinux/extlinux.conf ...
#
# So NixOS only has to write an extlinux config and we never have to touch
# the bootloader to install -- the same trick tegan uses. How to build
# mainline U-Boot for it anyway is in docs/orangepi-5-ultra.md.
{ lib, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Mainline has carried arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
  # since Linux 6.15, so no out-of-tree DTB is needed. The vendor's own
  # /boot/orangepiEnv.txt already pointed at this exact name.
  #
  # Naming the DTB explicitly makes extlinux-conf-builder emit an "FDT" line
  # instead of "FDTDIR"; relying on FDTDIR would mean trusting the ${fdtfile}
  # that happens to be baked into the vendor U-Boot environment.
  hardware.deviceTree.enable = true;
  hardware.deviceTree.name = "rockchip/rk3588-orangepi-5-ultra.dtb";

  # boot.loader.grub.enable defaults to true and modules/bootloader.nix turns
  # on efiSupport for aarch64 -- neither applies to a board without UEFI.
  boot.loader.grub.enable = lib.mkDefault false;
  boot.loader.systemd-boot.enable = lib.mkDefault false;
  boot.loader.generic-extlinux-compatible.enable = lib.mkDefault true;

  boot.initrd.availableKernelModules = [
    "nvme" # root candidate and /scratch, behind PCIe
    "xhci_pci"
    "usbhid"
    "usb_storage"
    "mmc_block"
    "sdhci_of_dwcmshc" # the RK3588 eMMC controller, where / lives
  ];

  boot.kernelParams = [
    # RK3588 debug UART, on the 3-pin header next to the USB-C port. Note the
    # unusual 1.5 Mbaud rate -- a 115200 adapter shows only garbage.
    "console=ttyS2,1500000n8"
    "console=tty0"
    # Both carried over from the vendor's /boot/orangepiEnv.txt. The RK3588
    # PCIe controller mishandles ASPM and the NVMe autonomous power states,
    # which shows up as the SSD dropping off the bus under load.
    "pcie_aspm=off"
    "nvme_core.default_ps_max_latency_us=0"
    # Mainline puts both PCIe controllers behind the MMU-600 SMMU in a
    # translated domain. The RTL8125 copes, but the SN850X then times out
    # on its very first admin command ("Identify Controller failed (-4)")
    # and never shows up. Passthrough is what the vendor kernel did anyway.
    "iommu.passthrough=1"
  ];

  # Both core types are armv8.2-a (A76 and A55), so that is the most we can
  # ask of -march for the whole package set.
  simd.arch = "armv8.2-a";
}
