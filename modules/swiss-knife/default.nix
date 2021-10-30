{ config, lib, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./network.nix
    ./storage.nix
  ];

  # needed for the container task
  environment.systemPackages = [
    pkgs.docker-compose
  ];
}
