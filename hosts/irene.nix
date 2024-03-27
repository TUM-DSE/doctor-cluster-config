
{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-2015CS.nix
    #../modules/nfs/client.nix
    #../modules/vfio/iommu-amd.nix
  ];

  networking.hostName = "irene";
  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNE0T804198";

  system.stateVersion = "22.11";
  simd.arch = "znver4";
}
