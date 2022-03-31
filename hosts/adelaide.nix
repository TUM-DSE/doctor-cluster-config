{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "adelaide";

  system.stateVersion = "21.11";
}
