{
  description = "NixOS configuration with flakes";

  # To update all inputs:
  # $ nix flake update --recreate-lock-file
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    ## For accessing `deploy-rs`'s utility Nix functions
    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";
    deploy-rs.inputs.utils.follows = "flake-utils";

    # TODO switch to stable 21.05 after branch off
    nixpkgs.url = "github:Mic92/nixpkgs/master";
    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:rycee/home-manager/release-20.09";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    retiolum.url = "git+https://git.thalheim.io/Mic92/retiolum";

    flake-registry.url = "github:NixOS/flake-registry";
    flake-registry.flake = false;
  };

  outputs =
    { self
    , deploy-rs
    , nixpkgs
    , nur
    , home-manager
    , retiolum
    , nixos-hardware
    , flake-registry
    , flake-utils
    }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        buildInputs = [
          pkgs.python3.pkgs.Fabric
          pkgs.ipmitool
        ];
      };
    }) //
    {
      nixosConfigurations = import ./configurations.nix {
        inherit nixpkgs nur home-manager retiolum flake-registry;
        nixosSystem = nixpkgs.lib.nixosSystem;
      };

      packages = nixpkgs.lib.foldr (name: previous: let
        nixosConfig = self.nixosConfigurations.${name};
        inherit (nixosConfig.pkgs) system;
        deploy = deploy-rs.lib.${system}.activate.nixos nixosConfig;
        current = { ${system}.${name} = deploy; };
      in nixpkgs.lib.recursiveUpdate previous current)
        {} (builtins.attrNames self.nixosConfigurations);

      hydraJobs = {
        configurations =
          nixpkgs.lib.mapAttrs'
            (name: config: nixpkgs.lib.nameValuePair name config.config.system.build.toplevel)
            self.nixosConfigurations;
      };
    };
}
