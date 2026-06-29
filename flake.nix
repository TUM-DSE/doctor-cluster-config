{
  description = "NixOS configuration with flakes";

  nixConfig.extra-substituters = [ "https://cache.dos.cit.tum.de" ];
  nixConfig.extra-trusted-public-keys = [
    "cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg="
  ];

  # To update all inputs:
  # $ nix flake update
  inputs = {
    nixpkgs.url = "git+https://github.com/TUM-DSE/nixpkgs.git?ref=nixos-26.05-backports&shallow=1";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    nixbot.url = "github:Mic92/nixbot";
    nixbot.inputs.nixpkgs.follows = "nixpkgs";
    nixbot.inputs.treefmt-nix.follows = "treefmt-nix";

    niks3.url = "github:Mic92/niks3";
    niks3.inputs.nixpkgs.follows = "nixpkgs";
    niks3.inputs.treefmt-nix.follows = "treefmt-nix";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixlib.follows = "nixpkgs";
    };

    crane.url = "github:ipetkov/crane";

    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixos-hardware.inputs.nixpkgs.follows = "nixpkgs";

    jetpack-nixos.url = "git+https://github.com/TUM-DSE/jetpack-nixos.git?shallow=1&ref=no-overlay";
    jetpack-nixos.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    retiolum.url = "github:Mic92/retiolum";
    retiolum.inputs.nixpkgs.follows = "nixpkgs";

    tincr.url = "github:Mic92/tincr";
    tincr.inputs.nixpkgs.follows = "nixpkgs";
    tincr.inputs.treefmt-nix.follows = "treefmt-nix";
    tincr.inputs.crane.follows = "crane";

    tribuchet.url = "github:Mic92/tribuchet";
    tribuchet.inputs.nixpkgs.follows = "nixpkgs";
    tribuchet.inputs.crane.follows = "crane";

    srvos.url = "github:numtide/srvos";
    # actually not used when using the modules but than nothing ever will try to fetch this nixpkgs variant
    srvos.inputs.nixpkgs.follows = "nixpkgs";

    nixos-apple-silicon.url = "github:nix-community/nixos-apple-silicon";
    nixos-apple-silicon.inputs.nixpkgs.follows = "nixpkgs";
    nixos-apple-silicon.inputs.flake-compat.follows = "";

    hosthog.url = "github:pogobanane/hosthog";
    hosthog.inputs.nixpkgs.follows = "nixpkgs";
    hosthog.inputs.flake-parts.follows = "flake-parts";

    fast-nix-gc.url = "github:Mic92/fast-nix-gc";
    fast-nix-gc.inputs.nixpkgs.follows = "nixpkgs";
    fast-nix-gc.inputs.treefmt-nix.follows = "treefmt-nix";

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
          { self', system, pkgs, ... }:
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
                  "eliza"
                  "joy"
                  "install-iso-aarch64-linux"
                ];
                machinesPerSystem = {
                  inherit aarch64-linux;
                  x86_64-linux = lib.filter (name: !builtins.elem name aarch64-linux) (
                    builtins.attrNames self.nixosConfigurations
                  );
                };
                nixosMachines = lib.mapAttrs' (n: lib.nameValuePair "nixos-${n}") (
                  lib.genAttrs (machinesPerSystem.${system} or [ ]) (
                    name:
                    let
                      cfg = self.nixosConfigurations.${name};
                      buildSystem = cfg.pkgs.stdenv.buildPlatform.system;
                    in
                    # The manual aarch64-linux list above must agree with
                    # the pkgs assigned in configurations.nix; when it
                    # drifted (eliza, joy) buildbot published the closure
                    # under the wrong checks.<system> key and the on-host
                    # auto-upgrade 404'd indefinitely. Compare against
                    # buildPlatform so cross-compiled hosts (e.g. the
                    # riscv64 boards built via pkgsCross on x86_64) stay
                    # under the system that actually has builders.
                    assert lib.assertMsg (buildSystem == system)
                      "nixosConfigurations.${name} builds on ${buildSystem} but is listed under checks.${system}; fix machinesPerSystem in flake.nix";
                    cfg.config.system.build.toplevel
                  )
                );
                devShells = lib.mapAttrs' (n: lib.nameValuePair "devShell-${n}") self'.devShells;
                # Users run home-manager standalone against the system
                # registry pins, so home-manager/nixpkgs skew breaks
                # `home-manager switch` without failing any host build.
                homeManager = {
                  home-manager-eval =
                    (inputs.home-manager.lib.homeManagerConfiguration {
                      inherit pkgs;
                      modules = [
                        {
                          home.username = "ci";
                          home.homeDirectory = "/home/ci";
                          home.stateVersion = "26.05";
                        }
                      ];
                    }).activationPackage;
                };
                # Pin all flake inputs into the binary cache so that
                # offline/auto-upgrade hosts can fetch them without
                # re-resolving every git input on each rebuild.
                flakeInputs = {
                  flake-inputs = pkgs.linkFarm "flake-inputs" (
                    lib.mapAttrsToList (name: input: {
                      inherit name;
                      path = input.outPath;
                    }) (lib.filterAttrs (_: input: input ? outPath) inputs)
                  );
                };
              in
              nixosMachines // devShells // homeManager // flakeInputs;
          };
      }
    )).config.flake;

}
