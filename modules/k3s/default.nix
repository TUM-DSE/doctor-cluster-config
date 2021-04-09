{ config, lib, pkgs, ... }:
{
  services.k3s.enable = true;
  services.k3s.extraFlags = "--no-deploy traefik --flannel-backend=host-gw";
}
