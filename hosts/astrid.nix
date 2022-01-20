{ pkgs, lib, ... }:
{
  imports = [
    ../modules/ipmi.nix
    ../modules/hardware/poweredge-r440.nix
  ];

  networking.hostName = "astrid";

  system.stateVersion = "21.11";
}
