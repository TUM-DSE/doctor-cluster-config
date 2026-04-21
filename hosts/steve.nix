
{
  imports = [
    ../modules/hardware/supermicro-322GA-NR.nix
    ../modules/nfs/client.nix
    ../modules/nfs
    ../modules/nvidia.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNN0XA09313";

  networking.hostName = "steve";

  system.stateVersion = "22.11";
}
