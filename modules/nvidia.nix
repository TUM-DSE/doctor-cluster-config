{ config, lib, ... }:
{
  hardware.opengl.enable = true;
  hardware.nvidia.datacenter.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.dc_535;
  systemd.services.nvidia-fabricmanager.enable = lib.mkForce false;

  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
  hardware.opengl.driSupport32Bit = true;
}
