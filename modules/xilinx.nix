{
  pkgs,
  config,
  ...
}: let
  xilinx-env = pkgs.callPackage ../pkgs/xilinx/fhs-env.nix {};
in {
  environment.systemPackages = [
    (xilinx-env.override {
      xilinxName = "xilinx-shell";
      runScript = "bash";
    })
    (xilinx-env.override {
      xilinxName = "vitis";
      runScript = "vitis";
    })
  ];

  sops.secrets.xilinx-password-hash.neededForUsers = true;

  users.extraUsers.xilinx = {
    isNormalUser = true;
    passwordFile = config.sops.secrets.xilinx-password-hash.path;
    extraGroups = ["wheel" "docker" "plugdev" "input"];
    uid = 5002;
  };
}
