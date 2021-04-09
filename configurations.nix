{ nixpkgs
, nixpkgs-unstable
, nixosSystem
, nur
, home-manager
, retiolum
, flake-registry
}:
let
  commonModules = [
    ./modules/packages.nix
    ./modules/nix-daemon.nix
    ./modules/telegraf.nix
    ./modules/tor-ssh.nix
    ./modules/users.nix
    ./modules/hosts.nix
    ./modules/network.nix
    ./modules/mosh.nix
    # TODO remove in 21.03
    "${nixpkgs-unstable}/nixos/modules/services/logging/promtail.nix"
    # TODO remove in 21.03
    ({lib, pkgs, ...}: {
      disabledModules = [ "services/cluster/k3s/default.nix" ];
      options = {
        # stub out new options until we upgrade
        boot.zfs.enabled = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        boot.zfs.package = lib.mkOption {
          readOnly = true;
          type = lib.types.package;
          default = pkgs.zfs;
        };
        systemd.enableUnifiedCgroupHierarchy = lib.mkOption {
          default = false;
          type = lib.types.bool;
        };
      };

      config = {
        virtualisation.docker.package = nixpkgs-unstable.legacyPackages.x86_64-linux.docker;
      };
    })
    "${nixpkgs-unstable}/nixos/modules/services/cluster/k3s/default.nix"

    ./modules/promtail.nix
    {
      nix.nixPath = [
        "home-manager=${home-manager}"
        "nixpkgs=${nixpkgs}"
        "nur=${nur}"
      ];
      nix.extraOptions = ''
        flake-registry = ${flake-registry}/flake-registry.json
      '';
      nix.registry = {
        home-manager.flake = home-manager;
        nixpkgs.flake = nixpkgs;
        nur.flake = nur;
      };
    }
    retiolum.nixosModules.retiolum
  ];

  computeNodeModules = commonModules ++ [
    ./hardware-configuration.nix
    ./modules/tracing.nix
    ./modules/dpdk.nix
    ./modules/sgx
    ./modules/sgx/graphene.nix
    ./modules/scratch-space.nix
    ./modules/scone.nix
    ./modules/watchdog.nix
    ./modules/nix-serve.nix
    ./modules/docker.nix
    ./modules/zfs.nix
    ./modules/systemd-boot.nix
  ];
in {
  amy = nixosSystem {
    system = "x86_64-linux";
    modules = computeNodeModules ++ [
      ./amy.nix
    ];
  };

  clara = nixosSystem {
    system = "x86_64-linux";
    modules = computeNodeModules ++ [
      ./clara.nix
    ];
  };

  doctor = nixosSystem {
    system = "aarch64-linux";
    modules = commonModules ++ [
      ./doctor.nix
    ];
  };

  donna = nixosSystem {
    system = "x86_64-linux";
    modules = computeNodeModules ++ [
      ./donna.nix
    ];
  };

  martha = nixosSystem {
    system = "x86_64-linux";
    modules = computeNodeModules ++ [
      ./martha.nix
    ];
  };

  rose = nixosSystem {
    system = "x86_64-linux";
    modules = computeNodeModules ++ [
      ./rose.nix
    ];
  };
}
