{ self, ... }:
let
  inherit
    (self.inputs)
    nixpkgs
    retiolum
    sops-nix
    home-manager
    nur
    flake-registry
    nixos-hardware
    nixpkgs-unstable
    srvos
    ;
  nixosSystem = nixpkgs.lib.makeOverridable nixpkgs.lib.nixosSystem;

  commonModules = [
    {
      _module.args.self = self;
      _module.args.inputs = self.inputs;
      srvos.flake = self;
    }
    # only include admins here for monitoring/backup infrastructure
    ./modules/users/admins.nix
    ./modules/users/extra-user-options.nix
    ./modules/packages.nix
    ./modules/memlock-limits.nix
    ./modules/nix-daemon.nix
    ./modules/auto-upgrade.nix
    ./modules/tor-ssh.nix
    ./modules/hosts.nix
    ./modules/network.nix
    ./modules/promtail.nix
    ./modules/zsh.nix
    ./modules/systemd.nix
    ./modules/cleanup-usr.nix

    srvos.nixosModules.server

    srvos.nixosModules.mixins-telegraf
    srvos.nixosModules.mixins-terminfo
    # allow to access telegraf on vpn interface
    { networking.firewall.interfaces."tinc.retiolum".allowedTCPPorts = [ 9273 ]; }

    sops-nix.nixosModules.sops
    ({ pkgs
     , config
     , ...
     }: {
      nix.nixPath = [
        "home-manager=${home-manager}"
        "nixpkgs=${pkgs.path}"
        "nur=${nur}"
      ];
      # TODO: share nixpkgs for each machine to speed up local evaluation.
      #nixpkgs.pkgs = self.inputs.nixpkgs.legacyPackages.${system};

      #sops.withSops = true;
      sops.secrets.root-password-hash.neededForUsers = true;
      sops.defaultSopsFile =
        let
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
      ./modules/users
      ./modules/tracing.nix
      ./modules/scratch-space.nix
      ./modules/docker.nix
      ./modules/zfs.nix
      ./modules/bootloader.nix
      ./modules/nix-ld.nix
      ./modules/envfs.nix
      ./modules/mosh.nix
      ./modules/qemu-bridge.nix
    ];
in
{
  flake.nixosConfigurations = {
    doctor = nixosSystem {
      system = "x86_64-linux";
      modules =
        commonModules
        ++ [
          ./hosts/doctor.nix
        ];
    };

    bill = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/bill.nix
        ];
    };

    nardole = nixosSystem {
      system = "x86_64-linux";
      modules =
        computeNodeModules
        ++ [
          ./hosts/nardole.nix
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

    ruby = (nixpkgs-unstable.lib.makeOverridable nixpkgs-unstable.lib.nixosSystem) {
      modules =
        computeNodeModules
        ++ [
          ./hosts/ruby.nix
          {
            nixpkgs.hostPlatform = "riscv64-linux";
            nixpkgs.buildPlatform = "x86_64-linux";
          }
        ];
    };
  };
}
