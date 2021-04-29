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

  systemd.network.links."00-fix-mac".extraConfig = ''
    [Match]
    MACAddress = 3c:ec:ef:2c:f5:15

    [Link]
    MACAddress = 94:05:BB:11:2D:70
  '';

  # provide dhcp to bill's ipmi
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
