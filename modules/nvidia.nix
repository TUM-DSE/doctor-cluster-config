{ config, lib, ... }:
{
  hardware.graphics.enable = true;
  hardware.nvidia.datacenter.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.dc_565;
  systemd.services.nvidia-fabricmanager.enable = lib.mkForce false;

  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
  hardware.graphics.enable32Bit = true;
}
