{ pkgs, config, ... }:
let
  xrt = pkgs.callPackage ../pkgs/xilinx/xrt.nix {};
  xrt-drivers = pkgs.callPackage ../pkgs/xilinx/xrt-drivers.nix {
    inherit xrt;
    inherit (config.boot.kernelPackages) kernel;
  };
  xilinx-env = pkgs.callPackage ../pkgs/xilinx/fhs-env.nix {};
in {
  environment.systemPackages = [
    (xilinx-env.override { xilinxName = "xilinx-shell"; runScript = "bash"; })
    (xilinx-env.override { xilinxName = "vitis"; runScript = "vitis"; })
  ];

  boot.kernelPackages = pkgs.linuxPackages_5_4;

  boot.extraModulePackages = [
    xrt-drivers
  ];
}
