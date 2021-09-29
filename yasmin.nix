{ pkgs, lib, ... }:
{
  imports = [
    # TODO
    #./modules/nfs-home.nix
    ./modules/ipmi.nix
    ./modules/yasmin-hardware.nix
  ];

  networking.hostName = "yasmin";
  networking.retiolum = {
    ipv4 = "10.243.29.197";
    ipv6 = "42:0:3c46:9b18:d5e7:d945:ccf8:829e";
  };

  boot.kernelParams = ["console=ttyS0,115200n8" "console=ttyAMA0,115200n8" "console=tty0"];

  system.stateVersion = "20.09";

  nix.nrBuildUsers = 224;
}
