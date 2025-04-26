
{ config, ... }:{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    ../modules/amd_sev_snp.nix
    ../modules/nvidia.nix
  ];

  simd.arch = "znver4";

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  networking.hostName = "jamie";

  system.stateVersion = "23.05";

  boot.kernelParams = [ "amd_iommu=off" ];


  # Additional Nvidia options
  hardware.nvidia.gsp.enable = true;
  hardware.firmware = [ config.boot.kernelPackages.nvidiaPackages.dc_565.firmware ];
  hardware.nvidia.open = true;
}
