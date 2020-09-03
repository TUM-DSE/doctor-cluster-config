{
  imports = [
    ./modules/nfs-home.nix
  ];

  networking.hostName = "donna";
  networking.retiolum = {
    ipv4 = "10.243.29.180";
    ipv6 = "42:0:3c46:7f2f:ed62:c6fd:9f1b:9900";
  };

  services.openssh.extraConfig = "HostCertificate ${./secrets/certs/donna-cert.pub}";
}
