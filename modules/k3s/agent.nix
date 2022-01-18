{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];

  sops.secrets.k3s-server-token = {};
  services.k3s.role = "agent";
  # copied from server from bill:/var/lib/rancher/k3s/server/node-token
  services.k3s.tokenFile = lib.mkDefault config.sops.secrets.k3s-server-token.path;
  services.k3s.serverAddr = lib.mkDefault "https://bill.dse.in.tum.de:6443";
  services.k3s.extraFlags = "--node-ip ${config.networking.doctorwho.currentHost.ipv4} --snapshotter=zfs --container-runtime-endpoint unix:///run/containerd/containerd.sock";
}
