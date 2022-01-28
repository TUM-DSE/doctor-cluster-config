{ pkgs, lib, ... }:
{
  imports = [
    ../modules/bonding.nix
    ../modules/ipmi.nix
    ../modules/dpdk.nix
    ../modules/k3s/agent.nix
    ../modules/sys-prog/users.nix
    ../modules/nfs/server.nix
    #../modules/nfs/server-backup.nix
  ];

  networking.hostName = "nardole";

  # unused 1Gbit/s port, messes up k3s networking
  systemd.network.networks."05-unmanaged".extraConfig = ''
    [Match]
    MACAddress = b0:3a:f2:b6:05:9f 3c:ec:ef:2c:f5:14 3c:ec:ef:2c:f5:15

    [Link]
    ActivationPolicy = down
  '';

  networking.doctowho.bonding.macs = [
    "b8:ce:f6:0b:ee:74"
    "b8:ce:f6:0b:ee:75"
  ];

  system.stateVersion = "20.09";
}
