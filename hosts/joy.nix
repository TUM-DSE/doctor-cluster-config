{ config, inputs, lib, ... }:
{
  imports = [
    ../modules/disko-zfs.nix
    ../modules/facter.nix
    #../modules/initrd-network.nix
    inputs.jetpack-nixos.nixosModules.default
  ];

  # overrides latest-zfs kernel with kernel also set in modules/apple-silicon-support/modules/kernel/default.nix
  boot.kernelPackages = lib.mkForce config.hardware.nvidia-jetpack.devicePkgs.kernelPackages;

  virtualisation.docker.enableNvidia = true;

  # tpm-tis does not exists;
  boot.initrd.systemd.tpm2.enable = false;

  hardware.nvidia-jetpack.enable = true;
  hardware.nvidia-jetpack.som = "orin-agx";
  hardware.nvidia-jetpack.carrierBoard = "devkit";

  disko.rootDisk = "/dev/disk/by-id/nvme-WDS200T1X0E-00AFY0_213328800075";

  # for installation
  boot.loader.efi.canTouchEfiVariables = lib.mkForce true;

  networking.hostName = "joy";

  system.stateVersion = "24.11";
}
