{
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    ../modules/ci.nix
    ../modules/dax.nix # just to disable PM as RAM
    ../modules/dpdk.nix
  ];

  boot.hugepages.size = "1GB";
  boot.hugepages.number = 8;

  networking.hostName = "wilfred";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";
}
