{ inputs, self, ... }: {

  # packages for x86 only
  flake.packages.x86_64-linux =
    let
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      sfc-drivers = pkgs.callPackage ./xilinx/sfc-driver.nix {
        inherit (pkgs.linuxPackages) kernel;
      };

      xrt = pkgs.callPackage ./xilinx/xrt.nix { };
      xrt-drivers = pkgs.callPackage ./xilinx/xrt-drivers.nix {
        inherit (self.packages.x86_64-linux) xrt;
        inherit (pkgs.linuxPackages_5_10) kernel;
      };
      xntools-core = pkgs.callPackage ./xilinx/xntools-core.nix { };

      firmware-sn1000 = pkgs.callPackage ./xilinx/firmware-sn1000.nix { };

      xilinx-env = pkgs.callPackage ./xilinx/fhs-env.nix { };
      xilinx-firmware = pkgs.callPackage ./xilinx/firmware.nix { };
      xilinx-cable-drivers = pkgs.callPackage ./xilinx/cable-drivers { };
      intel-cable-drivers = pkgs.callPackage ./intel-fpgas/cable-drivers { };
      intel-opencl-drivers = pkgs.callPackage ./intel-fpgas/opencl-drivers { };
    };

  # packages for many targets:
  perSystem =
    { pkgs
    , self'
    , ...
    }: {
      packages = {
        netboot = pkgs.callPackage ../modules/netboot/netboot.nix {
          # this nixosSystem is built for x86_64 machines regardless of the host machine
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          inherit (inputs.nixpkgs.lib) nixosSystem;
          extraModules = [
            self.inputs.nur.nixosModules.nur
            { _module.args.inputs = self.inputs; }
          ];
        };

        netboot-pixie-core = pkgs.callPackage ../modules/netboot/netboot-pixie-core.nix {
          inherit (self'.packages) netboot;
        };

        install-iso = pkgs.callPackage ./install-iso/default.nix {
          inherit self;
        };
      };
    };
}
