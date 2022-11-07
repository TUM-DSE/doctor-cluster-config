{self, ...}: {
  perSystem = {
    self',
    pkgs,
    ...
  }: let
  in {
    packages.xrt = pkgs.callPackage ../pkgs/xilinx/xrt.nix {};
    packages.xrt-drivers = pkgs.callPackage ../pkgs/xilinx/xrt-drivers.nix {
      inherit (self'.packages) xrt;
      inherit (pkgs.linuxPackages_5_10) kernel;
    };
    packages.xilinx-env = pkgs.callPackage ../pkgs/xilinx/fhs-env.nix {};
    packages.xilinx-firmware = pkgs.callPackage ../pkgs/xilinx/firmware.nix {};
    packages.xilinx-cable-drivers = pkgs.callPackage ../pkgs/xilinx/cable-drivers {};
  };
}
