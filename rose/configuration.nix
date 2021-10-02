{ pkgs, lib, config, ... }: {
  imports = [
    ../modules/nfs-home.nix
  ];

  networking.hostName = "rose";
  networking.retiolum = {
    ipv4 = "10.243.29.178";
    ipv6 = "42:0:3c46:a5a1:618d:663a:f0f1:ec88";
  };

  system.stateVersion = "19.09";
}
