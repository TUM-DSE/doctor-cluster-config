{ pkgs, lib, ... }:
{
  imports = [
    ../modules/ipmi.nix
    ../modules/hardware/poweredge-r440.nix
  ];

  networking.hostName = "mickey";
  networking.retiolum.ipv6 = "42:0:3c46:a85d:33c6:14ca:3cf7:8827";

  system.stateVersion = "21.11";
}
