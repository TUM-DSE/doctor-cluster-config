{ pkgs, lib, ... }:
{
  imports = [
    ../modules/ipmi.nix
    ../modules/hardware/poweredge-r440.nix
  ];

  networking.hostName = "astrid";
  networking.retiolum = {
    # TODO
    ipv6 = "42:0:3c46:87ed:6232:1016:7553:0000";
  };

  system.stateVersion = "21.11";
}
