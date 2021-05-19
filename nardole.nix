{ pkgs, lib, ... }:
{
  imports = [
    # TODO
    #./modules/nfs-home.nix
    ./modules/bonding.nix
    ./modules/ipmi.nix
    ./modules/k3s/agent.nix
    ./modules/xrdp.nix
    ./modules/xilinx.nix
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

  # DHCP
  networking.firewall.allowedUDPPorts = [ 67 68 ];

  system.stateVersion = "20.09";
}
