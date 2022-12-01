{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "jackson";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";
}
