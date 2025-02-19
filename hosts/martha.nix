
{
  imports = [
    ../modules/hardware/poweredge-r770.nix
    ../modules/nfs/client.nix
    ../modules/disko-zfs.nix
  ];

  networking.hostName = "martha";

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNJ0X815781";

  system.stateVersion = "24.11";
}
