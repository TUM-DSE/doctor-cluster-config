{
  imports = [
    ../modules/hardware/poweredge-r760.nix
    ../modules/nfs/client.nix
    ../modules/linux-uintr.nix
    #../modules/intel_tdx.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNS0W800690";

  networking.hostName = "ian";

  simd.arch = "emeraldrapids";

  system.stateVersion = "23.05";

  powerManagement.cpuFreqGovernor = "performance";
}
