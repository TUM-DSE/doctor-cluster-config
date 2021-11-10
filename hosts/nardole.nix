{ pkgs, lib, ... }:
{
  imports = [
    ../modules/bonding.nix
    ../modules/ipmi.nix
    ../modules/dpdk.nix
    ../modules/k3s/agent.nix
    ../modules/sys-prog/users.nix
  ];

  networking.hostName = "nardole";
  networking.retiolum = {
    ipv4 = "10.243.29.173";
    ipv6 = "42:0:3c46:362d:a9aa:4996:c78e:839a";
  };

  networking.doctowho.bonding.macs = [
    "b8:ce:f6:0b:ee:74"
    "b8:ce:f6:0b:ee:75"
  ];

  system.stateVersion = "20.09";
}
