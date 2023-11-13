{
  imports = [
    ../modules/hardware/supermicro-x12spw-tf-disko.nix
    ../modules/nfs/client.nix
    # iommu for sebastians students
    ../modules/vfio/iommu-intel.nix
    ../modules/disko-zfs.nix
  ];

  disko.rootDisk = "/dev/sdc";

  networking.hostName = "adelaide";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";

}
