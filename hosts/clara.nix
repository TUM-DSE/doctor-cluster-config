{config, ...}: {
  imports = [
    ../modules/edinburgh/nfs-home.nix
  ];

  boot.hugepages.number = 8000;

  networking.hostName = "clara";
  networking.retiolum = {
    ipv4 = "10.243.29.182";
    ipv6 = "42:0:3c46:e4e9:7814:459b:3f23:f455";
  };

  system.stateVersion = "19.09";
}
