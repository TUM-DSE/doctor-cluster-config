{ pkgs, lib, ... }:
{
  imports = [
    ../modules/ipmi.nix
    ../modules/bonding.nix
    ../modules/k3s/server.nix
    ../modules/dpdk.nix
    ../modules/xfstest.nix
    ../modules/sys-prog/users.nix
    ../modules/nfs/server-backup.nix
    #../modules/nfs/server.nix
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

  # unused 1Gbit/s port, messes up k3s networking
  systemd.network.networks."05-unmanaged".extraConfig = ''
    [Match]
    MACAddress = b0:3a:f2:b6:05:9f 3c:ec:ef:2c:f5:54 3c:ec:ef:2c:f5:55

    [Link]
    ActivationPolicy = down
  '';

  # Redha uses this for his qemu traces
  # - has a quota of 500GB
  fileSystems."/traces" = {
    device = "zroot/traces";
    fsType = "zfs";
    options = [ "nofail" ];
  };

  system.stateVersion = "20.09";
}
