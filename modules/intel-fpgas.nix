{ self, pkgs, ... }:
let
  packages = self.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [ ./intel-fpga-license/relay.nix ];

  config = {
    services.udev.packages = [
      packages.intel-cable-drivers
      packages.intel-opencl-drivers
    ];
  };
}
