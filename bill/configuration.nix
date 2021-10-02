{ pkgs, lib, ... }:
{
  imports = [
    # TODO
    #./modules/nfs-home.nix
    ../modules/ipmi.nix
    ../modules/bonding.nix
    ../modules/k3s/server.nix
    ../modules/dpdk.nix
    ../modules/hercules-ci.nix
    ../modules/xfstest.nix
  ];

  networking.hostName = "bill";
  networking.retiolum = {
    ipv4 = "10.243.29.195";
    ipv6 = "42:0:3c46:87ed:6232:1016:7553:939c";
  };

  networking.doctowho.bonding.macs = [
    "b8:ce:f6:0b:ee:64"
    "b8:ce:f6:0b:ee:65"
  ];

  # Redha uses this for his qemu traces
  # - has a quota of 500GB
  fileSystems."/traces" = {
    device = "zroot/traces";
    fsType = "zfs";
    options = [ "nofail" ];
  };

  system.stateVersion = "20.09";
}
