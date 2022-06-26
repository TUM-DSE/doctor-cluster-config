{self, ...}: let
  inherit
    (self.inputs)
    nixpkgs
    retiolum
    sops-nix
    home-manager
    nur
    flake-registry
    nixos-hardware
    nix-ld
    ;
  nixosSystem = nixpkgs.lib.makeOverridable nixpkgs.lib.nixosSystem;

  commonModules = [
    {_module.args.inputs = self.inputs;}
    ./modules/packages.nix
    ./modules/nix-daemon.nix
    ./modules/telegraf.nix
    ./modules/tor-ssh.nix
    ./modules/users.nix
    ./modules/hosts.nix
    ./modules/network.nix
    ./modules/mosh.nix
    ./modules/promtail.nix
    ./modules/zsh.nix
    ./modules/binbash.nix
    ./modules/systemd.nix
    ./modules/cleanup-usr.nix
    ./modules/qemu-bridge.nix

    sops-nix.nixosModules.sops
    ({
      pkgs,
      config,
      ...
    }: {
      nix.nixPath = [
        "home-manager=${home-manager}"
        "nixpkgs=${nixpkgs}"
        "nur=${nur}"
      ];
      # TODO: share nixpkgs for each machine to speed up local evaluation.
      #nixpkgs.pkgs = self.inputs.nixpkgs.legacyPackages.${system};

      #sops.withSops = true;
      sops.secrets.root-password-hash.neededForUsers = true;
      sops.defaultSopsFile = let
        sopsFile = ./. + "/hosts/${config.networking.hostName}.yml";
      in
        if builtins.pathExists sopsFile
        then sopsFile
        else null;

      nix.extraOptions = ''
        flake-registry = ${flake-registry}/flake-registry.json
      '';

      nix.registry = {
        home-manager.flake = home-manager;
        nixpkgs.flake = nixpkgs;
        nur.flake = nur;
      };
      time.timeZone = "UTC";
    })
    retiolum.nixosModules.retiolum
  ];

  computeNodeModules =
    commonModules
    ++ [
      ./modules/tracing.nix
      ./modules/scratch-space.nix
      ./modules/scone.nix
      ./modules/watchdog.nix
      ./modules/docker.nix
      ./modules/zfs.nix
      ./modules/bootloader.nix
    ];
  sgxNodeModules =
    computeNodeModules
    ++ [
      ./modules/dpdk.nix
      ./modules/sgx
      ./modules/sgx/graphene.nix
      ./hardware-configuration.nix
    ];
in {
  flake.nixosConfigurations = {
    amy = nixosSystem {
      system = "x86_64-linux";
      modules =
        sgxNodeModules
        ++ [
          ./hosts/amy.nix
        ];
    };

    clara = nixosSystem {
      system = "x86_64-linux";
      modules =
        sgxNodeModules
        ++ [
          ./hosts/clara.nix
        ];
    };

    # we need to increase /boot before we can upgrade
    doctor = nixosSystem {
      system = "aarch64-linux";
      modules =
        commonModules
        ++ [
          ./hosts/doctor.nix
        ];
    };

    donna = nixosSystem {
      system = "x86_64-linux";
      modules =
        sgxNodeModules
        ++ [
          ./hosts/donna.nix
        ];
    };

    martha = nixosSystem {
      system = "x86_64-linux";
      modules =
        sgxNodeModules
        ++ [
          ./hosts/martha.nix
        ];
    };

    rose = nixosSystem {
      system = "x86_64-linux";
      modules =
        sgxNodeModules
        ++ [
          ./hosts/rose.nix
        ];
    };

    bill = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/bill.nix
          ./hardware-configuration.nix
        ];
    };

    nardole = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/nardole.nix
          ./hardware-configuration.nix
        ];
    };

    sauron = nixosSystem {
      system = "x86_64-linux";
      modules =
        sgxNodeModules
        ++ [
          ./hosts/sauron.nix
        ];
    };

    yasmin = nixosSystem {
      system = "aarch64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/yasmin.nix
        ];
    };

    graham = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/graham.nix
          nix-ld.nixosModules.nix-ld
          nixos-hardware.nixosModules.dell-poweredge-r7515
        ];
    };

    ryan = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/ryan.nix
        ];
    };

    mickey = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/mickey.nix
        ];
    };

    astrid = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/astrid.nix
        ];
    };

    dan = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/dan.nix
        ];
    };

    christina = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/christina.nix
        ];
    };

    jackson = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/jackson.nix
        ];
    };

    adelaide = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/adelaide.nix
        ];
    };

    wilfred = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/wilfred.nix
        ];
    };

    river = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/river.nix
        ];
    };

    jack = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/jack.nix
        ];
    };
  };
}
