
{
  imports = [
    ../modules/hardware/placeholder.nix
  ];

  networking.hostName = "vislor";

  system.stateVersion = "22.11";
}