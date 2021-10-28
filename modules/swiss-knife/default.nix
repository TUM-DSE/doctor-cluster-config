{ config, lib, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./network.nix
    ./storage.nix
  ];
}
