{
  imports = [
    ../modules/hardware/supermicro-ARS-211M-NR.nix
    ../modules/nfs/client.nix
    ../modules/nvidia-aarch64.nix
    ../modules/disko-zfs.nix
  ];

  networking.hostName = "eliza";

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNN0XA20382";

  system.stateVersion = "24.11";
}

