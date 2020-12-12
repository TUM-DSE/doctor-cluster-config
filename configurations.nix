{ nixpkgs
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
