{
  imports = [
    ../modules/hardware/supermicro-120U-TNR.nix
    ../modules/nfs/client.nix
    ../modules/nvidia
    ../modules/vfio/iommu-intel.nix
    ../modules/dpdk.nix
    ../modules/vllm.nix
  ];


  networking.hostName = "jack";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";

  # no longer present
  #fileSystems."/ssd_extension" = {
  #  device = "ssd_extension/scratch";
  #  fsType = "zfs";
  #};

  #boot.zfs.extraPools = [ "ssd_extension" ];
}
