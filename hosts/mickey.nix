{ pkgs, lib, ... }:
{
  imports = [
    ../modules/ipmi.nix
    #../modules/k3s/agent.nix
    #../modules/k3s/test-cluster.nix
    ../modules/hardware/poweredge-r440.nix
    ../modules/eurosys-reviewer.nix
  ];

  networking.hostName = "mickey";

  system.stateVersion = "21.11";
}
