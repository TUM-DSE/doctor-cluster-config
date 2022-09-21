{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # enable the nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

  virtualisation.docker.enable = true;
  virtualisation.docker.enableNvidia = true;
  hardware.opengl.driSupport32Bit = true;
}
