
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    ../modules/nvidia.nix
  ];

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  networking.hostName = "jamie";

  system.stateVersion = "23.05";
}
