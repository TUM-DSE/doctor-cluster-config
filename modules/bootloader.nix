{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable this when you install NixOS on a new machine!
  boot.loader.efi.canTouchEfiVariables = false;

  boot.loader.grub = lib.mkIf (pkgs.stdenv.isAarch64) {
    efiSupport = true;
    device = "nodev";
  };

  # something is buggy with systemd-boot on our EFI machine yasmin
  boot.loader.systemd-boot.enable = !pkgs.stdenv.isAarch64 && !pkgs.stdenv.hostPlatform.isRiscV;
}
