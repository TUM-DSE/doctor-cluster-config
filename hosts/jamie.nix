
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    #../modules/amd_sev_snp.nix
    ../modules/amd_sev_svsm.nix
    ../modules/vfio/iommu-amd.nix
  ];

  simd.arch = "znver4";

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  networking.hostName = "jamie";

  system.stateVersion = "23.05";
}
