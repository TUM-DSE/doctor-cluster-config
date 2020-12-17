{
  imports = [
    ./modules/reboot-switch
    ./modules/raspberrypi-4.nix
  ];

  networking.hostName = "doctor";
  networking.retiolum = {
    ipv4 = "10.243.29.186";
    ipv6 = "42:0:3c46:96e2:72f4:be89:d6eb:ab14";
  };
  # port: 1/A/D14/1/14
  # mac address:
  system.stateVersion = "20.09";
}
