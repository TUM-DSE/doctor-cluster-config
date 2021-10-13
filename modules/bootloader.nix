{ config, lib, pkgs, ... }: {
  # Enable this when you install NixOS on a new machine!
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.efi.efiSysMountPoint  = lib.mkIf (pkgs.system == "aarch64-linux") "/boot/EFI";
  boot.loader.grub = lib.mkIf (pkgs.system == "aarch64-linux") {
    efiSupport = true;
    device = "nodev";
  };

  # something is buggy with systemd-boot on our EFI machine yasmin
  boot.loader.systemd-boot.enable = pkgs.system != "aarch64-linux";
}
