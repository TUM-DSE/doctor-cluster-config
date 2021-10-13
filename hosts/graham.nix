{ lib, config, pkgs, ... }: {
  imports = [
    ../modules/hardware/poweredge7515.nix
  ];
  networking.hostName = "graham";
  networking.retiolum = {
    ipv4 = "10.243.29.196";
    ipv6 = "42:0:3c46:1551:1906:bc7c:801f:3c4";
  };

  networking.interfaces.eno8303.macAddress = "3c:ec:ef:2c:f5:55";

  system.stateVersion = "21.05";
}
