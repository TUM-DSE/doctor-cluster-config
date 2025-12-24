{
  pkgs,
  config,
  self,
  lib,
  ...
}:
let
  packages = self.packages.${pkgs.stdenv.hostPlatform.system};
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

    # hardware.graphics.extraPackages = [ packages.xrt ];
  };
}
