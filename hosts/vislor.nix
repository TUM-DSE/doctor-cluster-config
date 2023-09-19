
{
  imports = [
    ../modules/hardware/poweredge7625.nix
  ];

  networking.hostName = "vislor";

  system.stateVersion = "22.11";
}
