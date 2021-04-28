{ pkgs, lib, ... }:
{
  imports = [
    # TODO
    #./modules/nfs-home.nix
  ];

  networking.hostName = "bill";
  networking.retiolum = {
    ipv4 = "10.243.29.195";
    ipv6 = "42:0:3c46:87ed:6232:1016:7553:939c";
  };

  system.stateVersion = "20.09";
}
