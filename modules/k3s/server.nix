{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];
  # k3s api server
  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s.extraFlags = "--no-deploy traefik --flannel-backend=host-gw --container-runtime-endpoint unix:///run/containerd/containerd.sock";

  services.telegraf = {
    extraConfig.kube_inventory = {
      bearer_token = "/run/telegraf-kubernetes-token";
      url = "https://localhost:6443";
      insecure_skip_verify = true;
      resource_include = [ "pods" ];
    };
  };

  systemd.services.telegraf-kubernetes-setup = {
    wantedBy = [ "multi-user.target" ];
    requires = ["k3s.service"];
    after = ["k3s.service"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/install -o telegraf -m400 /etc/rancher/k3s/k3s.yaml /run/telegraf-kubernetes-token";
      # work-around potential race condition between k3s and this service.
      RestartSec = "1s";
      Restart = "on-failure";
      RemainAfterExit = true;
    };
  };

  systemd.services.telegraf = {
    requires = [ "telegraf-kubernetes-setup.service" ];
    after = [ "telegraf-kubernetes-setup.service" ];
  };
}
