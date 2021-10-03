{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];

  sops.secrets.k3s-tokenfile = {};
  services.k3s.role = "agent";
  # copied from server from bill:/var/lib/rancher/k3s/server/node-token
  services.k3s.tokenFile = config.sops.secrets.k3s-tokenfile.path;
  services.k3s.serverAddr = "https://bill.dse.in.tum.de:6443";
  services.k3s.extraFlags = "--node-ip ${config.networking.doctorwho.currentHost.ipv4} --container-runtime-endpoint unix:///run/containerd/containerd.sock";
}
