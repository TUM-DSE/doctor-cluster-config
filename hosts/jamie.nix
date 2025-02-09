
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    ../modules/nvidia.nix
  ];

  networking.hostName = "jamie";

  system.stateVersion = "23.05";
}
