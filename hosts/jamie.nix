
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    ../modules/nvidia.nix
    ../modules/amd_sev_snp.nix
  ];

  simd.arch = "znver4";

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  networking.hostName = "jamie";

  system.stateVersion = "23.05";
}
