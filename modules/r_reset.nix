{ pkgs, ... }:
let
  sources = import ../nix/sources.nix {};
in {
  environment.systemPackages = [
    (pkgs.callPackage sources.r_reset {})
  ];
}
