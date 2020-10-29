{ pkgs, ... }:
let
  sources = import ../nix/sources.nix {};
in {
  nix = {
    gc.automatic = true;
    gc.dates = "03:15";

    # should be enough?
    nrBuildUsers = 32;

    # https://github.com/NixOS/nix/issues/719
    extraOptions = ''
      builders-use-substitutes = true
      keep-outputs = true
      keep-derivations = true
    '';
    nixPath = [
      "nixpkgs=${pkgs.path}"
      "home-manager=${sources.home-manager}"
      "nixos-config=/etc/nixos/configuration.nix"
    ];
  };

  imports = [ ./builder.nix ];

  nixpkgs.config.allowUnfree = true;
}
