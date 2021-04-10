{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];
  # k3s api server
  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s.extraFlags = "--no-deploy traefik --flannel-backend=host-gw --container-runtime-endpoint unix:///run/containerd/containerd.sock";
}
