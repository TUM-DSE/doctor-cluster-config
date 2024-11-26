{
  imports = [
    ../modules/hardware/poweredge-r760.nix
    ../modules/nfs/client.nix
    ../modules/linux-uintr.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNN0W800552";

  simd.arch = "sapphirerapids";

  networking.hostName = "xavier";

  system.stateVersion = "23.05";
}
