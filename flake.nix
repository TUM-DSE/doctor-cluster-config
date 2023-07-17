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
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";
    # In case we need backports, we can use our fork
    nixpkgs.url = "github:TUM-DSE/nixpkgs/release-23.05-backports";

    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:rycee/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # FIXME: I saw weird crashes on the latest HEAD... try upgrading later
    sops-nix.url = "github:Mic92/sops-nix/7c8e9727a2ecf9994d4a63d577ad5327e933b6a4";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    retiolum.url = "git+https://git.thalheim.io/Mic92/retiolum";

    srvos.url = "github:numtide/srvos";
    # actually not used when using the modules but than nothing ever will try to fetch this nixpkgs variant
    srvos.inputs.nixpkgs.follows = "nixpkgs";

    flake-registry.url = "github:NixOS/flake-registry";
    flake-registry.flake = false;
  };

  outputs =
    { flake-parts
    , ...
    } @ inputs:
    (flake-parts.lib.evalFlakeModule
      { inherit inputs; }
      ({ self, inputs, ... }: {
        systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
        imports = [
          ./configurations.nix
          ./modules/monitoring/flake-module.nix
          ./pkgs/flake-module.nix
          ./templates
        ];
        perSystem = { self', pkgs, ... }: {
          devShells.default = pkgs.mkShellNoCC {
            buildInputs = [
              pkgs.ipmitool

              pkgs.python3.pkgs.invoke
              #Until nixos-anywhere is packaged
              pkgs.python3.pkgs.deploykit
              pkgs.mypy
              pkgs.pixiecore
              pkgs.dnsmasq
              pkgs.python3.pkgs.netaddr
              pkgs.qemu_kvm
              pkgs.openssh
              pkgs.gitMinimal # for git flakes
              pkgs.rsync
              pkgs.nix
              pkgs.coreutils
              pkgs.curl # when uploading tarballs
              pkgs.gnugrep
              pkgs.findutils
              pkgs.gnused # needed by ssh-copy-id
              # sops dependencies
              pkgs.age
              pkgs.sops
              pkgs.yq-go
            ] ++ pkgs.lib.optional (pkgs.stdenv.isLinux) pkgs.mkpasswd;
          };
          packages = {
            netboot = pkgs.callPackage ./modules/netboot/netboot.nix {
              # this nixosSystem is built for x86_64 machines regardless of the host machine
              pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
              inherit (inputs.nixpkgs.lib) nixosSystem;
              extraModules = [
                self.inputs.nur.nixosModules.nur
                { _module.args.inputs = self.inputs; }
              ];
            };

            netboot-pixie-core = pkgs.callPackage ./modules/netboot/netboot-pixie-core.nix {
              inherit (self'.packages) netboot;
            };
          };
        };
        flake = {
          hydraJobs = inputs.nixpkgs.lib.mapAttrs' (name: config: inputs.nixpkgs.lib.nameValuePair "nixos-${name}" config.config.system.build.toplevel) self.nixosConfigurations // {
            devShells = self.devShells.x86_64-linux.default;
          };
        };
      })).config.flake;

}
