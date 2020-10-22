{
  imports = [
    ./modules/raspberrypi-4.nix
    ./modules/packages.nix
    ./modules/secrets.nix
    ./modules/tor-ssh.nix
    ./modules/users.nix
    ./modules/hosts.nix
    ./modules/network.nix
    ./modules/watchdog.nix
    ./modules/mosh.nix
    ./modules/r_reset.nix
    ./retiolum/modules/retiolum
  ];

  networking.hostName = "doctor";
  networking.retiolum = {
    ipv4 = "10.243.29.186";
    ipv6 = "42:0:3c46:96e2:72f4:be89:d6eb:ab14";
  };
  services.openssh.extraConfig = "HostCertificate ${./secrets/certs/doctor-cert.pub}";

  # port: 1/A/D14/1/14
  # mac address:
}
