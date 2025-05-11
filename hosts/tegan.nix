# This machine was installed using the NixOS installer on an sdcard as described here:
# https://github.com/NixOS/nixos-hardware/tree/master/milkv/pioneer
# The machine uses the bootloader from the original installer sdcard image and needs it for booting.
# After installation we moved the /boot/extlinux.conf on the sdcard so that linux boot will no longer try to boot from it and uses extlinux configuration from the NVME instead.
# The NVME also still contains an EFI boot parition, but that one is no longer used for booting.
{ pkgs, lib, ... }:
{
  imports = [
    ../modules/nfs/client.nix
  ];

  boot.loader = {
    grub.enable = lib.mkDefault false;
    generic-extlinux-compatible.enable = lib.mkDefault true;
  };

  boot.kernelParams = [ "isolcpus=56-63" ];

  networking.hostName = "tegan";

  system.stateVersion = "24.05";

  environment.systemPackages = [ pkgs.tio ];

  disko.devices.disk.main = {
    device = "/dev/disk/by-id/nvme-uuid.d03c809b-833e-1c48-a652-06cd6b722f1a";
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        root = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
