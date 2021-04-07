{ config, lib, pkgs, ... }:
{
  services.k3s.enable = true;
  services.k3s.docker = true;
  systemd.services.k3s.path = [ pkgs.zfs ];

  environment.systemPackages = [ config.services.k3s.package ];
  services.k3s.extraFlags =  "--no-deploy traefik";
  networking.firewall.allowedTCPPorts = [
    6443
  ];
}
