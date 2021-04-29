{ pkgs, lib, ... }:
{
  imports = [
    # TODO
    #./modules/nfs-home.nix
    ./modules/ipmi.nix
  ];

  networking.hostName = "nardole";
  networking.retiolum = {
    ipv4 = "10.243.29.173";
    ipv6 = "42:0:3c46:362d:a9aa:4996:c78e:839a";
  };

  system.stateVersion = "20.09";
}
