{
  imports = [
    ./modules/nfs-home.nix
    ./modules/sgx/graphene.nix
  ];

  networking.hostName = "clara";
  networking.retiolum = {
    ipv4 = "10.243.29.182";
    ipv6 = "42:0:3c46:e4e9:7814:459b:3f23:f455";
  };

  services.openssh.extraConfig = "HostCertificate ${./secrets/certs/clara-cert.pub}";
}
