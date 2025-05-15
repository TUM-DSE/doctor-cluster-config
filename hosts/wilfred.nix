{
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    ../modules/ci.nix
    ../modules/dax.nix # just to disable PM as RAM
    ../modules/vfio/iommu-intel.nix
    ../modules/dpdk.nix
  ];

  boot.hugepages1GB.number = 8;
  boot.hugepages2MB.number = let
    gb = 30;
  in gb * 1024 / 2;

  boot.initrd.availableKernelModules = [ "nvme" ];

  networking.hostName = "wilfred";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";

  networking.doctor-bridge.enable = true;
}
