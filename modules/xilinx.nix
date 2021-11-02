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

  # those are unstable
  #boot.kernelPackages = pkgs.linuxPackages_5_4;
  #boot.extraModulePackages = [
  #  xrt-drivers
  #];

  hardware.opengl.extraPackages = [
    xrt
  ];

  systemd.tmpfiles.rules = [
    "L+ /opt/xilinx/xrt - - - - ${xrt}/opt/xilinx/xrt"
  ];

  systemd.services.setup-xilinx-firmware = {
    wantedBy = ["multi-user.target"];
    script = ''
      rm -rf /lib/firmware/xilinx /opt/xilinx/firmware
      mkdir -p /lib/firmware/xilinx /opt/xilinx/firmware
      cp -r ${xilinx-firmware}/lib/firmware/xilinx/* /lib/firmware/xilinx/
      cp -r ${xilinx-firmware}/opt/xilinx/firmware/* /opt/xilinx/firmware/
      for p in ${xilinx-firmware}/share/xilinx-firmware/*; do
         echo $p
         $p
      done
    '';
  };

  users.extraUsers.xilinx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "plugdev" "input" ];
    # /etc/nixos/secrets/xrdp-password
    hashedPassword = "$6$JVnp0RXTKpCfSc.$A4mp4WmFzVFnwHUPYEjqMQmhlL/9o5tbKKv2y/nY3oojp/aLnWjUzTMspxCadcn4L9b7WyTFHt2VNVkZ6q9Y30";
    uid = 2002;
  };
}
