{
  imports = [
    ./modules/nfs-home.nix
    ./modules/k3s/agent.nix
  ];

  networking.hostName = "sauron";
  networking.retiolum = {
    ipv4 = "10.243.29.194";
    ipv6 = "42:0:3c46:7f53:34b:ca31:16c2:da58";
  };

  system.stateVersion = "20.09";
}
