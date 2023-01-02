{
  ...
}: {
  services.atftpd.enable = true;
  services.atftpd.root = "/var/lib/netboot";
  networking.firewall.allowedTCPPorts = [
    69 # tftp
    80 # http
  ];
  networking.firewall.allowedUDPPorts = [
    69 # tftp
  ];
  services.nginx.enable = true;
  services.nginx.virtualHosts."_" = {
    locations."/".extraConfig = ''
      root /var/lib/netboot;
    '';
  };
}
