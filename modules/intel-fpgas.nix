{self, pkgs, ...}: let 
  packages = self.packages.${pkgs.system};
in {
  config = {
    services.udev.packages = [ packages.xilinx-cable-drivers ];
  };
}
