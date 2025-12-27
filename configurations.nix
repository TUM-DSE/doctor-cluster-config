{ self, inputs, ... }:
let
  inherit
    (inputs)
    nixpkgs
    retiolum
    sops-nix
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
    ./modules/nix-daemon.nix
    ./modules/auto-upgrade.nix
    ./modules/hosts.nix
    ./modules/network.nix
    ./modules/promtail.nix
    ./modules/zsh.nix
    ./modules/systemd.nix
    ./modules/cleanup.nix
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
      srvos.nixosModules.mixins-latest-zfs-kernel
      ./modules/users
      ./modules/tracing.nix
      ./modules/scratch-space.nix
      ./modules/docker.nix
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
  # Define machine modules
  flake.nixosModules = {
    doctor = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        commonModules
        ++ [
          srvos.nixosModules.roles-prometheus
          ./hosts/doctor.nix
        ];
    };

    rose = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/rose.nix
        ];
    };

    amy = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/amy.nix
        ];
    };
    
    clara = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/clara.nix
        ];
    };

    bill = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/bill.nix
        ];
    };

    nardole = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/nardole.nix
        ];
    };

    yasmin = {
      nixpkgs.pkgs = pkgs-aarch64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/yasmin.nix
        ];
    };

    graham = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/graham.nix
          nixos-hardware.nixosModules.dell-poweredge-r7515
        ];
    };

    ryan = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/ryan.nix
        ];
    };

    mickey = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/mickey.nix
        ];
    };

    astrid = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/astrid.nix
        ];
    };

    dan = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/dan.nix
        ];
    };

    christina = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/christina.nix
        ];
    };

    jackson = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/jackson.nix
        ];
    };

    adelaide = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/adelaide.nix
        ];
    };

    wilfred = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/wilfred.nix
        ];
    };

    river = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/river.nix
        ];
    };

    jack = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/jack.nix
        ];
    };

    donna = {
      nixpkgs.pkgs = pkgs-aarch64-linux;
      imports = 
        computeNodeModules
        ++ [
          ./hosts/donna.nix
        ];
    };

    vislor = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports = 
        computeNodeModules
        ++ [
          ./hosts/vislor.nix
        ];
    };

    vicki = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports = 
        computeNodeModules
        ++ [
          ./hosts/vicki.nix
        ];
    };

    ruby = {
      nixpkgs.pkgs = pkgs-x86_64-linux.pkgsCross.riscv64;
      imports =
        computeNodeModules
        ++ [
          ./hosts/ruby.nix
        ];
    };

    xavier = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/xavier.nix
        ];
    };
    
    irene = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/irene.nix
        ];
      };

    tegan = {
      nixpkgs.pkgs = pkgs-x86_64-linux.pkgsCross.riscv64;
      imports =
        computeNodeModules
        ++ [
          nixos-hardware.nixosModules.milkv-pioneer
          ./hosts/tegan.nix
        ];
      };
    ian = {
        nixpkgs.pkgs = pkgs-x86_64-linux;
        imports =
                computeNodeModules
                ++ [
                 ./hosts/ian.nix
                ];
        };
    ace = {
      nixpkgs.pkgs = pkgs-aarch64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/ace.nix
        ];
    };

    joy = {
      nixpkgs.pkgs = pkgs-aarch64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/joy.nix
        ];
    };
    
    jamie = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/jamie.nix
        ];
    };

    martha = {
      nixpkgs.pkgs = pkgs-x86_64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/martha.nix
        ];
    };
    
    eliza = {
      nixpkgs.pkgs = pkgs-aarch64-linux;
      imports =
        computeNodeModules
        ++ [
          ./hosts/eliza.nix
        ];
    };
  };

  # Map over the modules to create nixosConfigurations
  flake.nixosConfigurations = nixpkgs.lib.mapAttrs (name: module:
    nixosSystem {
      modules = [ module ];
    }
  ) self.nixosModules;
}
