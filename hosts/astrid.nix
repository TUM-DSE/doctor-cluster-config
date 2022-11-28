{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/ipmi.nix
    ../modules/k3s/server.nix
    ../modules/k3s/runner-monitoring.nix
    ../modules/hardware/poweredge-r440.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "astrid";

  simd.arch = "cascadelake";

  system.stateVersion = "21.11";
}
