{ config, lib, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./network.nix
    ./storage.nix
  ];

  # Students are not careful exposing ports with containers
  networking.firewall.enable = lib.mkForce true;

  # needed for the container task
  environment.systemPackages = [
    pkgs.docker-compose
  ];
}
