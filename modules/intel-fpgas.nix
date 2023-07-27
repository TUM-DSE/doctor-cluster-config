{self, pkgs, ...}: let 
  packages = self.packages.${pkgs.system};
in {
  config = {
    services.udev.packages = [ packages.intel-cable-drivers ];
  };
}
