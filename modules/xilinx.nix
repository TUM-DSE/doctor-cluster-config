{ pkgs, config, ... }:
let
  xrt = pkgs.callPackage ../pkgs/xilinx/xrt.nix {};
  xrt-drivers = pkgs.callPackage ../pkgs/xilinx/xrt-drivers.nix {
    inherit xrt;
    inherit (config.boot.kernelPackages) kernel;
  };
  xilinx-env = pkgs.callPackage ../pkgs/xilinx/fhs-env.nix {};
  xilinx-firmware = pkgs.callPackage ../pkgs/xilinx/firmware.nix {};
in {
  environment.systemPackages = [
    (xilinx-env.override { xilinxName = "xilinx-shell"; runScript = "bash"; })
    (xilinx-env.override { xilinxName = "vitis"; runScript = "vitis"; })
  ];

  boot.kernelPackages = pkgs.linuxPackages_5_4;

  boot.extraModulePackages = [
    xrt-drivers
  ];

  systemd.tmpfiles.rules = [
    "L+ /opt/xilinx/firmware - - - - ${xilinx-firmware}/opt/xilinx/firmware"
    "L+ /lib/firmware/ - - - - ${xilinx-firmware}/lib/firmware"
  ];

  users.extraUsers.xilinx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "plugdev" "input" ];
    # /etc/nixos/secrets/xrdp-password
    hashedPassword = "$6$JVnp0RXTKpCfSc.$A4mp4WmFzVFnwHUPYEjqMQmhlL/9o5tbKKv2y/nY3oojp/aLnWjUzTMspxCadcn4L9b7WyTFHt2VNVkZ6q9Y30";
    uid = 2002;
  };
}
