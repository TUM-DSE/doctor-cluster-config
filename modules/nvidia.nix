{ config, lib, pkgs, ... }:
{

  hardware.graphics =  {
    enable = true;
  }
  // lib.optionalAttrs(pkgs.stdenv.hostPlatform.isx86_64) {
    enable32Bit = true;
  };

  # Switching from datacenter driver to production driver for kernel 6.15 compatibility
  # The production driver (570.153.02) includes patches for kernel 6.15 support
  # while dc_565 (565.57.01) does not support kernels newer than 6.13
  hardware.nvidia.datacenter.enable = false;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  hardware.nvidia.open = true; # Required for driver versions >= 560
  systemd.services.nvidia-fabricmanager.enable = lib.mkForce false;

  # Add nvidia to videoDrivers to satisfy nvidia-container-toolkit assertion
  services.xserver.videoDrivers = [ "nvidia" ];

  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
}
