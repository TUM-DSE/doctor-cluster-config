{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    ../modules/disko-zfs.nix
    ../modules/facter.nix
    ../modules/xrdp.nix
    ../modules/nfs/client.nix
    ../modules/nvidia-orin-agx.nix
    ../modules/nvidia-jetson-passthru/default.nix
    # Docker doesn't work with nvidia passthru: https://github.com/TUM-DSE/jetpack-nixos?tab=readme-ov-file#oci-container-support
    inputs.jetpack-nixos.nixosModules.default
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-WDS200T1X0E-00AFY0_213328800075";

  # for installation
  boot.loader.efi.canTouchEfiVariables = lib.mkForce true;

  networking.hostName = "joy";

  system.stateVersion = "24.11";
}
