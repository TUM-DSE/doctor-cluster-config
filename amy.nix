{
  imports = [
    #./modules/nfs-home.nix
  ];

  networking.hostName = "amy";
  networking.retiolum = {
    ipv4 = "10.243.29.181";
    ipv6 = "42:0:3c46:1551:1906:bc7c:801f:3c4";
  };
}
