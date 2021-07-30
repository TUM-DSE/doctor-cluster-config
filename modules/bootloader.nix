{ config, lib, pkgs, ... }:
lib.mkMerge [
  # Enable this when you install NixOS on a new machine!
  { boot.loader.efi.canTouchEfiVariables = false; }
  (if pkgs.system == "aarch64-linux" then {
    # something is buggy with systemd-boot on our EFI machine yasmin
    boot.loader = {
      efi.efiSysMountPoint = "/boot/EFI"; # ← use the same mount point here.
      grub.efiSupport = true;
      grub.device = "nodev";
    };
  } else {
    boot.loader.systemd-boot.enable = true;
  })
]
