{ nixpkgs, nixosSystem, sops-nix, inputs, pkgs }:
nixosSystem {
  modules = [{
    nixpkgs.pkgs = pkgs;
    imports = [
      "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
      ./base-config.nix
      ./nix-settings.nix
      sops-nix.nixosModules.default
      { _module.args.inputs = inputs; }
    ];
  }];
}
