{ pkgs, lib, ... }:
{
  imports = [
    # TODO
    #./modules/nfs-home.nix
  ];

  networking.hostName = "nardole";
  networking.retiolum = {
    ipv4 = "10.243.29.179";
    ipv6 = "42:0:3c46:5466:7dbe:f27a:673f:ea64";
  };

  system.stateVersion = "20.09";
}
