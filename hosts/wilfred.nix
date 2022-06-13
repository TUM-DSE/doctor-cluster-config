{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    ../modules/ci.nix
  ];

  networking.hostName = "wilfred";

  system.stateVersion = "21.11";
}
