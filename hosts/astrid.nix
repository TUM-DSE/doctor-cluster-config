{ pkgs, lib, ... }:
{
  imports = [
    ../modules/ipmi.nix
    ../modules/k3s/server.nix
    ../modules/k3s/test-cluster.nix
    ../modules/hardware/poweredge-r440.nix
  ];

  networking.hostName = "astrid";

  system.stateVersion = "21.11";
}
