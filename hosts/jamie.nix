
{
  imports = [
    ../modules/hardware/poweredge7625.nix
  ];

  networking.hostName = "jamie";

  system.stateVersion = "23.05";
}
