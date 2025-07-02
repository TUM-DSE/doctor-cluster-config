{ config, lib, ... }:
{
  hardware.graphics.enable = true;
  systemd.services.nvidia-fabricmanager.enable = lib.mkForce false;

  virtualisation.docker.enable = true;
}
