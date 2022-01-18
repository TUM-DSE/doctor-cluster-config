{ config, pkgs, lib, ... }:
{
  imports = [
    ../modules/edinburgh/nfs-home.nix
    ../modules/ci.nix
    ../modules/xfstest.nix

    ../modules/k3s/agent.nix
    ../modules/edinburgh/k3s.nix
  ];

  services.k3s.serverAddr = "https://rose.thalheim.io:6443";

  networking.hostName = "martha";
  networking.retiolum = {
    ipv4 = "10.243.29.179";
    ipv6 = "42:0:3c46:5466:7dbe:f27a:673f:ea64";
  };

  users.extraUsers.joerg.home = lib.mkForce "/scratch/joerg";

  system.stateVersion = "19.09";
}
