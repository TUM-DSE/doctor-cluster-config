{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/ipmi.nix
    ../modules/yasmin-hardware.nix
    ../modules/nfs/client.nix
    ../modules/gitlab-runner/builder.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "yasmin";

  boot.kernelParams = ["console=ttyS0,115200n8" "console=ttyAMA0,115200n8" "console=tty0"];

  system.stateVersion = "20.09";

  nix.nrBuildUsers = 224;
}
