{ lib, config, pkgs, ... }: {
  networking.hostName = "graham";
  networking.retiolum = {
    ipv4 = "10.243.29.";
    ipv6 = "42:0:3c46:1551:1906:bc7c:801f:3c4";
  };

  system.stateVersion = "21.05";
}
