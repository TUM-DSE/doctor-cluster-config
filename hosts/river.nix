{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    ../modules/dpdk.nix
  ];

  boot.hugepages.size = "1GB";
  boot.hugepages.number = 8;

  networking.hostName = "river";

  system.stateVersion = "21.11";
}
