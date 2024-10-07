{ self, inputs, ... }:
let
  inherit
    (inputs)
    nixpkgs
    retiolum
    sops-nix
    home-manager
    flake-registry
    nixos-hardware
    srvos
    disko
    ;

  nixosSystem = args: nixpkgs.lib.nixosSystem ({
    specialArgs = { inherit self inputs; };
  } // args);

  commonModules = [
    # only include admins here for monitoring/backup infrastructure
    ./modules/users/admins.nix
    ./modules/users/extra-user-options.nix
    ./modules/packages.nix
    ./modules/memlock-limits.nix
    ./modules/nix-daemon.nix
    ./modules/auto-upgrade.nix
    ./modules/hosts.nix
    ./modules/network.nix
    ./modules/promtail.nix
    ./modules/zsh.nix
    ./modules/systemd.nix
    ./modules/cleanup-usr.nix
    ./modules/tinc.nix
    ./modules/sshd
    ./modules/register-flake.nix

    disko.nixosModules.disko

    srvos.nixosModules.server

    srvos.nixosModules.mixins-telegraf
    srvos.nixosModules.mixins-terminfo
    srvos.nixosModules.mixins-nix-experimental

    sops-nix.nixosModules.sops
    ({ pkgs
     , config
     , lib
     , ...
     }: let
       sopsFile = ./. + "/hosts/${config.networking.hostName}.yml";
    in {
      # TODO: share nixpkgs for each machine to speed up local evaluation.
      #nixpkgs.pkgs = self.inputs.nixpkgs.legacyPackages.${system};

      users.withSops = builtins.pathExists sopsFile;
      sops.secrets = lib.mkIf (config.users.withSops) {
        root-password-hash.neededForUsers = true;
      };
      sops.defaultSopsFile = lib.mkIf (builtins.pathExists sopsFile) sopsFile;

      time.timeZone = "UTC";
    })
    retiolum.nixosModules.retiolum
  ];

  computeNodeModules =
    commonModules ++ [
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
      ./modules/doctor-VMs.nix
      ./modules/lawful-access
      ./modules/nix-index.nix
    ];

    pkgsForSystem = system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    pkgs-x86_64-linux = pkgsForSystem "x86_64-linux";
    pkgs-aarch64-linux = pkgsForSystem "aarch64-linux";
in
{
  flake.nixosConfigurations = {
    doctor = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        commonModules
        ++ [
          srvos.nixosModules.roles-prometheus
          ./hosts/doctor.nix
        ];
    };

    rose = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/rose.nix
        ];
    };

    amy = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/amy.nix
        ];
    };
    
    clara = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/clara.nix
        ];
    };

    bill = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/bill.nix
        ];
    };

    nardole = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/nardole.nix
        ];
    };

    yasmin = nixosSystem {
      pkgs = pkgs-aarch64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/yasmin.nix
        ];
    };

    graham = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/graham.nix
          nixos-hardware.nixosModules.dell-poweredge-r7515
        ];
    };

    ryan = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/ryan.nix
        ];
    };

    mickey = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/mickey.nix
        ];
    };

    astrid = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/astrid.nix
        ];
    };

    dan = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/dan.nix
        ];
    };

    christina = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/christina.nix
        ];
    };

    jackson = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/jackson.nix
        ];
    };

    adelaide = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/adelaide.nix
        ];
    };

    wilfred = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/wilfred.nix
        ];
    };

    river = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/river.nix
        ];
    };

    jack = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/jack.nix
        ];
    };

    donna = nixosSystem {
      pkgs = pkgs-aarch64-linux;
      modules = 
        computeNodeModules
        ++ [
          ./hosts/donna.nix
        ];
    };

    vislor = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules = 
        computeNodeModules
        ++ [
          ./hosts/vislor.nix
        ];
    };

    vicki = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules = 
        computeNodeModules
        ++ [
          ./hosts/vicki.nix
        ];
    };

    ruby = nixosSystem {
      pkgs = pkgs-x86_64-linux.pkgsCross.riscv64;
      modules =
        computeNodeModules
        ++ [
          ./hosts/ruby.nix
        ];
    };

    xavier = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/xavier.nix
        ];
    };
    
    irene = nixosSystem {
      pkgs = pkgs-x86_64-linux;
      modules =
        computeNodeModules
        ++ [
          ./hosts/irene.nix
        ];
      };

    tegan = nixosSystem {
      pkgs = pkgs-x86_64-linux.pkgsCross.riscv64;
      modules =
        computeNodeModules
        ++ [
          self.inputs.nixos-hardware.nixosModules.milkv-pioneer
          ./hosts/tegan.nix
        ];
      };
    ian = nixosSystem {
        pkgs = pkgs-x86_64-linux;
        modules =
                computeNodeModules
                ++ [
                 ./hosts/ian.nix
                ];
        };
  };
}
