{ pkgs, config, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # enable the nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  # linux 6.2 is too new for the nvidia driver
  boot.kernelPackages = pkgs.linuxPackages;

  hardware.nvidia.open = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.enableNvidia = true;
  hardware.opengl.driSupport32Bit = true;
}
