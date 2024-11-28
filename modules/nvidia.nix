{ config, ... }:
{
  hardware.opengl.enable = true;
  hardware.nvidia.datacenter.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.dc_535;

  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
  hardware.opengl.driSupport32Bit = true;
}
