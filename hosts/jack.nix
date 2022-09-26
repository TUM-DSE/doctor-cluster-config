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
  ];

  doctorwho.pmem.devices = [ "pmem0" "pmem1" ];

  networking.hostName = "jack";

  system.stateVersion = "21.11";
}
