{
  imports = [
    ../modules/hardware/supermicro-x12spw-tf-disko.nix
    ../modules/nfs/client.nix
    # iommu for sebastians students
    ../modules/vfio/iommu-intel.nix
    ../modules/disko-zfs.nix
    ../modules/dpdk.nix
  ];

  disko.rootDisk = "/dev/sdc";

  networking.hostName = "adelaide";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";

  boot.hugepages2MB.number = let
    gb = 20;
  in gb * 1024 / 2;
  systemd.network.ignorePci = [
    "0000:00:1c.0"
    "0000:00:1c.1"
  ];
}
