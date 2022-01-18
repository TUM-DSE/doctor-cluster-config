{ config, ... }: {
  imports = [
    ../modules/edinburgh/nfs-home.nix

    ../modules/k3s/agent.nix
    ../modules/edinburgh/k3s.nix
  ];

  networking.hostName = "clara";
  networking.retiolum = {
    ipv4 = "10.243.29.182";
    ipv6 = "42:0:3c46:e4e9:7814:459b:3f23:f455";
  };

  system.stateVersion = "19.09";
}
