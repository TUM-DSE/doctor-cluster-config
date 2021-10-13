{ lib, config, pkgs, ... }: {
  imports = [
    ../modules/hardware/poweredge7515.nix
  ];
  networking.hostName = "ryan";
  networking.retiolum = {
    ipv4 = "10.243.29.196";
    ipv6 = "42:0:3c46:ab64:fa7c:171a:c94a:ac19";
  };

  networking.interfaces.eno8303.macAddress = "3c:ec:ef:2c:f5:15";

  system.stateVersion = "21.05";
}
