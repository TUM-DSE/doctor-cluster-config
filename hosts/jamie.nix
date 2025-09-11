
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    #../modules/amd_sev_snp.nix
    ../modules/amd_sev_svsm.nix
    ../modules/nvidia.nix
    ../modules/vfio/iommu-amd.nix
  ];

  simd.arch = "znver4";

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNJ0X815786";

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  networking.hostName = "jamie";

  system.stateVersion = "23.05";
}
