{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    # iommu for sebastians students
    ../modules/vfio/iommu-intel.nix
  ];

  networking.hostName = "adelaide";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";

}
