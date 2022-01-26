{
  imports = [
    ../modules/edinburgh/nfs-home.nix
  ];

  boot.hugepages.number = 8000;

  networking.hostName = "donna";
  networking.retiolum = {
    ipv4 = "10.243.29.180";
    ipv6 = "42:0:3c46:7f2f:ed62:c6fd:9f1b:9900";
  };

  system.stateVersion = "19.09";
}
