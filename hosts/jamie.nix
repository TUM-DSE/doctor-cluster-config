
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "jamie";

  system.stateVersion = "23.05";
}
