{
  description = "NixOS configuration with flakes";

  nixConfig.extra-substituters = [
    "https://tum-dse.cachix.org"
  ];
  nixConfig.extra-trusted-public-keys = [
    "tum-dse.cachix.org-1:v67rK18oLwgO0Z4b69l30SrV1yRtqxKpiHodG4YxhNM="
  ];

  # To update all inputs:
  # $ nix flake update --recreate-lock-file
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs.follows = "nixpkgs";

    # TODO Switch to nixos release as soon as it comes out
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.05";
    # In case we need backports, we can use our fork
    #nixpkgs.url = "github:TUM-DSE/nixpkgs/release-22.05-backports";
    nixpkgs-unstable.url = "github:Mic92/nixpkgs/main";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:rycee/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    retiolum.url = "git+https://git.thalheim.io/Mic92/retiolum";

    flake-registry.url = "github:NixOS/flake-registry";
    flake-registry.flake = false;

    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

    deploykit.url = "github:numtide/deploykit";
    deploykit.inputs.nixpkgs.follows = "nixpkgs";
    deploykit.inputs.flake-parts.follows = "flake-parts";
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    (flake-parts.lib.evalFlakeModule
      { inherit self; }
      {
        systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
        imports = [
          ./configurations.nix
          ./modules/monitoring/flake-module.nix
          ./templates
        ];
        perSystem = {system, self', inputs', pkgs, ...}: {
          devShells.default = pkgs.mkShellNoCC {
            buildInputs = [
              pkgs.python3.pkgs.invoke
              pkgs.ipmitool
              pkgs.age
              pkgs.sops
              inputs'.deploykit.packages.deploykit
              (pkgs.writeScriptBin "nix2yaml" ''
                echo "# AUTOMATICALLY GENERATED WITH:"
                echo "# nix2yaml $*"
                nix eval --json -f "$@" | ${pkgs.yq-go}/bin/yq e -P -
              '')
            ] ++ pkgs.lib.optional (pkgs.stdenv.isLinux) pkgs.mkpasswd;
          };
          packages = {
            netboot = pkgs.callPackage ./modules/netboot/netboot.nix {
              # this nixosSystem is built for x86_64 machines regardless of the host machine
              pkgs = nixpkgs.legacyPackages.x86_64-linux;
              inherit (nixpkgs.lib) nixosSystem;
              extraModules = [
                self.inputs.nur.nixosModules.nur
                {_module.args.inputs = self.inputs;}
              ];
            };

            netboot-pixie-core = pkgs.callPackage ./modules/netboot/netboot-pixie-core.nix {
              inherit (self'.packages) netboot;
            };
          };
        };
        flake = {
          hydraJobs = nixpkgs.lib.mapAttrs' (name: config: nixpkgs.lib.nameValuePair "nixos-${name}" config.config.system.build.toplevel) self.nixosConfigurations // {
            devShells = self.devShells.x86_64-linux.default;
          };
        };
      }).config.flake;

}
