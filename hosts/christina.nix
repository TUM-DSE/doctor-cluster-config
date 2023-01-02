{
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    ../modules/dax.nix
    ../modules/dpdk.nix
    ../modules/vfio/iommu-intel.nix
  ];

  boot.hugepages.size = "1GB";
  boot.hugepages.number = 8;

  networking.hostName = "christina";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";
}
