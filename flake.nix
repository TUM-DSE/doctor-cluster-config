{
  description = "NixOS configuration with flakes";

  nixConfig.extra-substituters = [ "https://cache.dos.cit.tum.de" ];
  nixConfig.extra-trusted-public-keys = [
    "cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg="
  ];

  # To update all inputs:
  # $ nix flake update
  inputs = {
    nixpkgs.url = "git+https://github.com/TUM-DSE/nixpkgs.git?ref=nixos-25.11-backports&shallow=1";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    nix-1.url = "git+https://github.com/Mic92/nix-1?shallow=1";
    nix-1.inputs.nixpkgs.follows = "nixpkgs";
    nix-1.inputs.flake-parts.follows = "";
    nix-1.inputs.flake-compat.follows = "";
    nix-1.inputs.nixpkgs-regression.follows = "";
    nix-1.inputs.git-hooks-nix.follows = "";
    nix-1.inputs.nixpkgs-23-11.follows = "";

    buildbot-nix.url = "github:nix-community/buildbot-nix";
    buildbot-nix.inputs.nixpkgs.follows = "nixpkgs";
    buildbot-nix.inputs.flake-parts.follows = "flake-parts";
    buildbot-nix.inputs.treefmt-nix.follows = "treefmt-nix";

    niks3.url = "github:Mic92/niks3";
    niks3.inputs.nixpkgs.follows = "nixpkgs";
    niks3.inputs.flake-parts.follows = "flake-parts";
    niks3.inputs.treefmt-nix.follows = "treefmt-nix";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixlib.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    jetpack-nixos.url = "git+https://github.com/TUM-DSE/jetpack-nixos.git?shallow=1&ref=no-overlay";
    jetpack-nixos.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    retiolum.url = "github:Mic92/retiolum";
    retiolum.inputs.nixpkgs.follows = "nixpkgs";

    srvos.url = "github:numtide/srvos";
    # actually not used when using the modules but than nothing ever will try to fetch this nixpkgs variant
    srvos.inputs.nixpkgs.follows = "nixpkgs";

    nixos-apple-silicon.url = "github:nix-community/nixos-apple-silicon";
    nixos-apple-silicon.inputs.nixpkgs.follows = "nixpkgs";
    nixos-apple-silicon.inputs.flake-compat.follows = "";

    hosthog.url = "github:pogobanane/hosthog";
    hosthog.inputs.nixpkgs.follows = "nixpkgs";
    hosthog.inputs.flake-parts.follows = "flake-parts";

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
