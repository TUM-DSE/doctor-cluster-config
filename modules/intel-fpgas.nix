{ self, pkgs, ... }:
let
  packages = self.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  config = {
    services.udev.packages = [
      packages.intel-cable-drivers
      packages.intel-opencl-drivers
    ];
  };
}
