{ config, inputs, lib, ... }:
{
  imports = [
    ../modules/disko-zfs.nix
    ../modules/facter.nix
    ../modules/xrdp.nix
    inputs.jetpack-nixos.nixosModules.default
  ];

  environment.systemPackages = [
    config.hardware.nvidia-jetpack.devicePkgs.samples.cudnn-test
    config.hardware.nvidia-jetpack.devicePkgs.samples.cuda-test
  ];

  # overrides latest-zfs kernel with kernel also set in modules/apple-silicon-support/modules/kernel/default.nix
  boot.kernelPackages = lib.mkForce config.hardware.nvidia-jetpack.devicePkgs.kernelPackages;

  virtualisation.docker.enableNvidia = true;

  # tpm-tis does not exists;
  boot.initrd.systemd.tpm2.enable = false;

  hardware.nvidia-jetpack.enable = true;
  hardware.nvidia-jetpack.som = "orin-agx";
  hardware.nvidia-jetpack.carrierBoard = "devkit";

  services.xserver.displayManager.lightdm.enable = true;

  # x11 requires modesetting to be disabled
  hardware.nvidia-jetpack.modesetting.enable = false;

  disko.rootDisk = "/dev/disk/by-id/nvme-WDS200T1X0E-00AFY0_213328800075";

  # for installation
  boot.loader.efi.canTouchEfiVariables = lib.mkForce true;

  networking.hostName = "joy";

  system.stateVersion = "24.11";
}
