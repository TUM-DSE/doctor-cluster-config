{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-120U-TNR.nix
    ../modules/nfs/client.nix
    ../modules/dax.nix
    ../modules/nvidia.nix
    ../modules/stable-diffusion.nix
    ../modules/dpdk.nix
  ];

  doctorwho.pmem.devices = [ "pmem0" "pmem1" ];

  networking.hostName = "jack";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";
}
