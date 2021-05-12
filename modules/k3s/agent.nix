{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];

  services.k3s.role = "agent";
  # copied from server from bill:/var/lib/rancher/k3s/server/node-token
  services.k3s.tokenFile = "/etc/nixos/secrets/k3s-server-token";
  # FIXME migrate once we got the right addresses for bill
  services.k3s.serverAddr = "https://servtemp1.dse.in.tum.de:6443";
  services.k3s.extraFlags = "--container-runtime-endpoint unix:///run/containerd/containerd.sock";
}
