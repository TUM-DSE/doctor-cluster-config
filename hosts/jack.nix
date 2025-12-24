{
  imports = [
    ../modules/hardware/supermicro-120U-TNR.nix
    ../modules/nfs/client.nix
    ../modules/nvidia.nix
    ../modules/vfio/iommu-intel.nix
    ../modules/dpdk.nix
  ];

  networking.hostName = "jack";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";

  fileSystems."/ssd_extension" = {
    device = "ssd_extension/scratch";
    fsType = "zfs";
  };

  boot.zfs.extraPools = [ "ssd_extension" ];
}
