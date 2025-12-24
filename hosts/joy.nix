{
  inputs,
  lib,
  ...
}:
{
  imports = [
    ../modules/disko-ext4.nix
    ../modules/facter.nix
    ../modules/xrdp.nix
    ../modules/nfs/client.nix
    ../modules/nvidia-orin-agx.nix
    inputs.jetpack-nixos.nixosModules.default
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-Samsung_SSD_980_PRO_2TB_S736NL0X909257H";

  # for installation
  boot.loader.efi.canTouchEfiVariables = lib.mkForce true;

  networking.hostName = "joy";

  system.stateVersion = "24.11";
}
