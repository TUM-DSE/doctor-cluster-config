{
  networking.hostName = "rose";
  networking.retiolum = {
    ipv4 = "10.243.29.178";
    ipv6 = "42:0:3c46:a5a1:618d:663a:f0f1:ec88";
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /home/ 192.168.2.0/24(rw,nohide,insecure,no_subtree_check) 192.168.3.0/24(rw,nohide,insecure,no_subtree_check)
  '';

  # for nfs
  networking.firewall.enable = false;

  systemd.network.enable = true;
  systemd.network.networks ={
    "enp0s20f0u10".extraConfig = ''
      [Match]
      Name = enp0s20f0u10

      [Network]
      Address = 192.168.2.1/24
      DHCPServer = yes
      IPForward = yes
    '';

    "enp0s20f0u9u4".extraConfig = ''
      [Match]
      Name = enp0s20f0u9u4

      [Network]
      Address = 192.168.3.1/24
      DHCPServer = yes
      IPForward = yes
    '';

    "enp5s0".extraConfig = ''
      [Match]
      Name = enp5s0

      [Network]
      DHCP = true
      IPMasquerade = true
    '';
  };
  fileSystems."/home" = {
    device = "zroot/root/home";
    fsType = "zfs";
  };
}
