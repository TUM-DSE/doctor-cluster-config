{ config, lib, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  # Enable this when you install NixOS on a new machine!
  boot.loader.efi.canTouchEfiVariables = false;
}
