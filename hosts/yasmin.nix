{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/ipmi.nix
    ../modules/yasmin-hardware.nix
    ../modules/nfs/client.nix
    ../modules/nfs/client.nix
    ../modules/buildbot/builder.nix
  ];

  networking.hostName = "yasmin";

  boot.kernelParams = ["console=ttyS0,115200n8" "console=ttyAMA0,115200n8" "console=tty0"];

  system.stateVersion = "20.09";

  nix.nrBuildUsers = 224;
}
