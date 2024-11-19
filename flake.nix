{
  description = "NixOS configuration with flakes";

  nixConfig.extra-substituters = [ "https://tum-dse.cachix.org" ];
  nixConfig.extra-trusted-public-keys = [
    "tum-dse.cachix.org-1:v67rK18oLwgO0Z4b69l30SrV1yRtqxKpiHodG4YxhNM="
  ];

  # To update all inputs:
  # $ nix flake update
  inputs = {
    nixpkgs.url = "github:TUM-DSE/nixpkgs/nixos-24.05-backports";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:rycee/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-buildbot.url = "github:Mic92/nixpkgs/buildbot-python";
    buildbot-nix.url = "github:nix-community/buildbot-nix";
    # requires nixpkgs-unstable
    buildbot-nix.inputs.nixpkgs.follows = "nixpkgs-buildbot";
    buildbot-nix.inputs.flake-parts.follows = "flake-parts";
    buildbot-nix.inputs.treefmt-nix.follows = "treefmt-nix";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixlib.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.inputs.nixpkgs-stable.follows = "";

    nixos-anywhere.url = "github:nix-community/nixos-anywhere/pxe-boot";
    nixos-anywhere.inputs.nixpkgs.follows = "nixpkgs";
    nixos-anywhere.inputs.disko.follows = "disko";
    nixos-anywhere.inputs.treefmt-nix.follows = "treefmt-nix";
    nixos-anywhere.inputs.flake-parts.follows = "flake-parts";
    nixos-anywhere.inputs.nixos-2305.follows = "";

    retiolum.url = "github:Mic92/retiolum";

    srvos.url = "github:numtide/srvos";
    # actually not used when using the modules but than nothing ever will try to fetch this nixpkgs variant
    srvos.inputs.nixpkgs.follows = "nixpkgs";

    flake-registry.url = "github:NixOS/flake-registry";
    flake-registry.flake = false;
  };

  outputs =
    { flake-parts, ... }@inputs:
    (flake-parts.lib.evalFlakeModule { inherit inputs; } (
      {
        lib,
        self,
        inputs,
        ...
      }:
      {
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
        ];
        imports = [
          ./configurations.nix
          ./modules/monitoring/flake-module.nix
          ./pkgs/flake-module.nix
          ./devShells/flake-module.nix
          ./templates
        ];
        perSystem =
          { self', system, ... }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
            checks =
              let
                aarch64-linux = [
                  "donna"
                  "yasmin"
                  "ace"
                ];
                machinesPerSystem = {
                  inherit aarch64-linux;
                  x86_64-linux = lib.filter (name: !builtins.elem name aarch64-linux) (
                    builtins.attrNames self.nixosConfigurations
                  );
                };
                nixosMachines = lib.mapAttrs' (n: lib.nameValuePair "nixos-${n}") (
                  lib.genAttrs (machinesPerSystem.${system} or [ ]) (
                    name: self.nixosConfigurations.${name}.config.system.build.toplevel
                  )
                );
                devShells = lib.mapAttrs' (n: lib.nameValuePair "devShell-${n}") self'.devShells;
              in
              nixosMachines // devShells;
          };
      }
    )).config.flake;

}
