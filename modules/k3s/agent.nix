{ config, lib, ... }:
{
  imports = [ ./. ];
  # When initializing a cluster from scratch also copy /etc/rancher/k3s/k3s.yaml
  # from the master to the https://github.com/ls1-courses/internal-docs/tree/main/runner

  services.k3s.role = "agent";
  services.k3s.serverAddr = lib.mkDefault "https://${config.networking.doctorwho.hosts.astrid.ipv4}:6443";
  services.k3s.extraFlags = "--node-ip ${config.networking.doctorwho.currentHost.ipv4} --snapshotter=zfs --container-runtime-endpoint unix:///run/containerd/containerd.sock";
}
