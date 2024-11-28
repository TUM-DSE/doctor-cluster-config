{
  pkgs,
  config,
  self,
  lib,
  ...
}:
let
  packages = self.packages.${pkgs.system};
  xrt-drivers = packages.xrt-drivers.override { inherit (config.boot.kernelPackages) kernel; };
in
{

  options = {
    hardware.xilinx.xrt-drivers.enable = lib.mkEnableOption "Propritary kernel drivers for flashing firmware";
  };

  config = {
    environment.systemPackages = [
      (packages.xilinx-env.override {
        xilinxName = "xilinx-shell";
        runScript = "bash";
      })
      (packages.xilinx-env.override {
        xilinxName = "vitis";
        runScript = "vitis";
      })
      packages.xntools-core
    ];

    services.udev.packages = [ packages.xilinx-cable-drivers ];

    # 6.0+ kernel
    boot.extraModulePackages = lib.optional (config.hardware.xilinx.xrt-drivers.enable) xrt-drivers;

    # 5.15 kernel
    # boot.extraModulePackages = [ sfc-drivers ]
    #                            ++ lib.optional (config.hardware.xilinx.xrt-drivers.enable) xrt-drivers;

    # 5.10 kernel
    # boot.kernelPackages =
    #  lib.mkIf (config.hardware.xilinx.xrt-drivers.enable) pkgs.linuxPackages_5_10;

    hardware.graphics.extraPackages = [ packages.xrt ];
  };
}
