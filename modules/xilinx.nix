{
  pkgs,
  config,
  self,
  ...
}: let
  packages = self.packages.${pkgs.system};
  xrt-drivers = packages.xrt-drivers.override { inherit (config.boot.kernelPackages) kernel; };
in {
  environment.systemPackages = [
    (packages.xilinx-env.override {
      xilinxName = "xilinx-shell";
      runScript = "bash";
    })
    (packages.xilinx-env.override {
      xilinxName = "vitis";
      runScript = "vitis";
    })
  ];

  boot.kernelPackages = pkgs.linuxPackages_5_10;
  boot.extraModulePackages = [
    xrt-drivers
  ];

  hardware.opengl.extraPackages = [
    packages.xrt
  ];

  systemd.tmpfiles.rules = [
    "L+ /opt/xilinx/xrt - - - - ${packages.xrt}/opt/xilinx/xrt"
  ];

  systemd.services.setup-xilinx-firmware = {
    wantedBy = ["multi-user.target"];
    script = ''
      rm -rf /lib/firmware/xilinx /opt/xilinx/firmware
      mkdir -p /lib/firmware/xilinx /opt/xilinx/firmware
      cp -r ${packages.xilinx-firmware}/lib/firmware/xilinx/* /lib/firmware/xilinx/
      cp -r ${packages.xilinx-firmware}/opt/xilinx/firmware/* /opt/xilinx/firmware/
      for p in ${packages.xilinx-firmware}/share/xilinx-firmware/*; do
         echo $p
         $p
      done
    '';
  };

  sops.secrets.xilinx-password-hash.neededForUsers = true;

  users.extraUsers.xilinx = {
    isNormalUser = true;
    passwordFile = config.sops.secrets.xilinx-password-hash.path;
    extraGroups = ["wheel" "docker" "plugdev" "input"];
    uid = 5002;
  };
}
