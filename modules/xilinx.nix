{ pkgs, config, ... }:
let
  xilinx-env = pkgs.callPackage ../pkgs/xilinx/fhs-env.nix {};
in {
  environment.systemPackages = [
    (xilinx-env.override { xilinxName = "xilinx-shell"; runScript = "bash"; })
    (xilinx-env.override { xilinxName = "vitis"; runScript = "vitis"; })
  ];

  sops.secrets.xilinx-password.neededForUsers = true;

  users.extraUsers.xilinx = {
    isNormalUser = true;
    passwordFile = config.sops.secrets.xilinx-password.path;
    extraGroups = [ "wheel" "docker" "plugdev" "input" ];
    # /etc/nixos/secrets/xrdp-password
    hashedPassword = "$6$JVnp0RXTKpCfSc.$A4mp4WmFzVFnwHUPYEjqMQmhlL/9o5tbKKv2y/nY3oojp/aLnWjUzTMspxCadcn4L9b7WyTFHt2VNVkZ6q9Y30";
    uid = 5002;
  };
}
