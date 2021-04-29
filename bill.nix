{ pkgs, lib, ... }:
{
  imports = [
    # TODO
    #./modules/nfs-home.nix
    ./modules/ipmi.nix
  ];

  networking.hostName = "bill";
  networking.retiolum = {
    ipv4 = "10.243.29.195";
    ipv6 = "42:0:3c46:87ed:6232:1016:7553:939c";
  };

  systemd.network.links."00-fix-mac".extraConfig = ''
    [Match]
    MACAddress = 3c:ec:ef:2c:f5:55

    [Link]
    MACAddress = 00:e0:4c:68:00:8f
  '';

  # provide dhcp to nardole's ipmi
  systemd.network.networks."01-ipmi-dhcp".extraConfig = ''
   [Match]
   Name = eno1
   
   [Network]
   Address = 192.168.24.50/24
   DHCPServer = true
   
   [DHCPServer]
   PoolOffset = 100
   PoolSize = 20
  '';

  system.stateVersion = "20.09";
}
