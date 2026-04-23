{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/gigabyte-xv23-zx0.nix
    ../modules/nfs/client.nix
    ../modules/amd_sev_snp-vanilla.nix
    ../modules/nvidia.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNS0WA06423";

  networking.hostName = "polly";

  system.stateVersion = "25.11";
}