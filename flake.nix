{
  description = "NixOS configuration with flakes";

  # To update all inputs:
  # $ nix flake update --recreate-lock-file
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    #nixpkgs.url = "github:NixOS/nixpkgs/release-21.11";
    nixpkgs.url = "github:TUM-DSE/nixpkgs/release-21.11-backports";
    nixpkgs-unstable.url = "github:Mic92/nixpkgs/main";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:rycee/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    #sops-nix.url = "github:Mic92/sops-nix";
    # optional, not necessary for the module
    #sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    retiolum.url = "git+https://git.thalheim.io/Mic92/retiolum";

    flake-registry.url = "github:NixOS/flake-registry";
    flake-registry.flake = false;

    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
    nix-ld.inputs.utils.follows = "flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      selfPkgs = self.packages.x86_64-linux;
    in {
      devShell = pkgs.mkShell {
        buildInputs = [
          pkgs.python3.pkgs.invoke
          pkgs.ipmitool
          pkgs.age
          pkgs.sops
        ];
      };
      packages = {
        netboot = pkgs.callPackage ./modules/netboot/netboot.nix {
          inherit pkgs;
          inherit (nixpkgs.lib) nixosSystem;
          extraModules = [
            {_module.args.inputs = inputs;}
          ];
        };

        netboot-pixie-core = pkgs.callPackage ./modules/netboot/netboot-pixie-core.nix {
          inherit (selfPkgs) netboot;
        };
      };
    })
    // {
      nixosConfigurations = import ./configurations.nix (inputs
        // {
          inherit inputs;
        });

      hydraJobs = nixpkgs.lib.mapAttrs' (name: config: nixpkgs.lib.nameValuePair "nixos-${name}" config.config.system.build.toplevel) self.nixosConfigurations;
    };
}
