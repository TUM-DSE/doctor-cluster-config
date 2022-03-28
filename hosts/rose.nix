{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ../modules/edinburgh/nfs-home.nix
  ];

  networking.hostName = "rose";
  networking.retiolum = {
    ipv4 = "10.243.29.178";
    ipv6 = "42:0:3c46:a5a1:618d:663a:f0f1:ec88";
  };

  environment.systemPackages = [
    # on /dev/ttyUSB0 doctor is connected via serial
    # $ sudo picocom -b 115200 /dev/ttyUSB0
    pkgs.picocom
  ];

  boot.hugepages.number = 8000;

  system.stateVersion = "19.09";
}
