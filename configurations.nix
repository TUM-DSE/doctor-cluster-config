{ nixpkgs
, nixpkgs-systemd
, nixosSystem
, nur
, home-manager
, retiolum
, sops-nix
, flake-registry
, eris
, vmsh
, lambda-pirate
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
    ./modules/promtail.nix

    sops-nix.nixosModules.sops
    ({pkgs, ...}: {
      nix.nixPath = [
        "home-manager=${home-manager}"
        "nixpkgs=${nixpkgs}"
        "nur=${nur}"
      ];

      sops.defaultSopsFile = ./modules/secrets.yml;

      nix.extraOptions = ''
        flake-registry = ${flake-registry}/flake-registry.json
      '';

      nixpkgs.config.packageOverrides = pkgs: {
        systemd-next = (import nixpkgs-systemd {
          inherit (pkgs) system;
        }).systemd;
      };

      nix.registry = {
        home-manager.flake = home-manager;
        nixpkgs.flake = nixpkgs;
        nur.flake = nur;
      };
    })
    retiolum.nixosModules.retiolum
  ];

  computeNodeModules = commonModules ++ [
    ./modules/tracing.nix
    ./modules/scratch-space.nix
    ./modules/scone.nix
    ./modules/watchdog.nix
    eris.nixosModules.eris
    ./modules/eris.nix
    ./modules/docker.nix
    ./modules/zfs.nix
    ./modules/bootloader.nix
  ];
  sgxNodeModules = computeNodeModules ++ [
    ./modules/dpdk.nix
    ./modules/sgx
    ./modules/sgx/graphene.nix
    ./hardware-configuration.nix
  ];
in
{
  amy = nixosSystem {
    system = "x86_64-linux";
    modules = sgxNodeModules ++ [
      ./hosts/amy.nix
    ];
  };

  clara = nixosSystem {
    system = "x86_64-linux";
    modules = sgxNodeModules ++ [
      ./hosts/clara.nix
    ];
  };

  doctor = nixosSystem {
    system = "aarch64-linux";
    modules = commonModules ++ [
      ./hosts/doctor.nix
    ];
  };

  #monitoring = nixosSystem {
  #  system = "x86_64-linux";
  #  #modules = commonModules ++ [
  #  modules = [
  #    ./modules/container.nix
  #  ];
  #};

  donna = nixosSystem {
    system = "x86_64-linux";
    modules = sgxNodeModules ++ [
      ./hosts/donna.nix
    ];
  };

  martha = nixosSystem {
    system = "x86_64-linux";
    modules = sgxNodeModules ++ [
      vmsh.nixosModules.linux-ioregionfd
      #lambda-pirate.nixosModules.knative
      #lambda-pirate.nixosModules.vhive
      #({ config, ... }: {
      #  # for lambda pirate
      #  services.vhive.dockerRegistryIp = config.networking.doctorwho.hosts.${config.networking.hostName}.ipv4;
      #})
      ./hosts/martha.nix
    ];
  };

  rose = nixosSystem {
    system = "x86_64-linux";
    modules = sgxNodeModules ++ [
      vmsh.nixosModules.linux-ioregionfd
      ./hosts/rose.nix
    ];
  };

  bill = nixosSystem {
    system = "x86_64-linux";
    modules = computeNodeModules ++ [
      vmsh.nixosModules.linux-ioregionfd
      ./hosts/bill.nix
      ./hardware-configuration.nix
    ];
  };

  nardole = nixosSystem {
    system = "x86_64-linux";
    modules = computeNodeModules ++ [
      ./nardole/configuration.nix
      ./hardware-configuration.nix
    ];
  };

  sauron = nixosSystem {
    system = "x86_64-linux";
    modules = sgxNodeModules ++ [
      ./hosts/sauron.nix
    ];
  };

  yasmin = nixosSystem {
    system = "aarch64-linux";
    modules = computeNodeModules ++ [
      ./hosts/yasmin.nix
    ];
  };
}
