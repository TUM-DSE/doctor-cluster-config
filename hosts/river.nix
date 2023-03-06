{
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    ../modules/dax.nix # just to disable PM as RAM
    ../modules/dpdk.nix
    ../modules/vfio/iommu-intel.nix
    ../modules/linux-ioregionfd.nix
  ];

  boot.hugepages.size = "1GB";
  boot.hugepages.number = 8;

  networking.hostName = "river";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";
}
