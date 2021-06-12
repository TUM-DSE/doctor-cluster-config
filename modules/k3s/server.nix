{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];
  # k3s api server
  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s.extraFlags = "--no-deploy traefik --flannel-backend=host-gw --container-runtime-endpoint unix:///run/containerd/containerd.sock";

  services.telegraf = {
    extraConfig.kube_inventory = {
      bearer_token = "/run/telegraf-kubernetes-token";
      tls_cert = "/run/telegraf-kubernetes-cert";
      tls_key = "/run/telegraf-kubernetes-key";
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
      ExecStart = [
        # we use the client/key for authentication and hence leave the kubernetes token empty
        "${pkgs.coreutils}/bin/touch /run/telegraf-kubernetes-token"
        "${pkgs.coreutils}/bin/install -o telegraf -m400 /var/lib/rancher/k3s/server/tls/client-admin.crt /run/telegraf-kubernetes-cert"
        "${pkgs.coreutils}/bin/install -o telegraf -m400 /var/lib/rancher/k3s/server/tls/client-admin.key /run/telegraf-kubernetes-key"
      ];
      # work-around potential race condition between k3s and this service.
      RestartSec = "1s";
      Restart = "on-failure";
      RemainAfterExit = true;
    };
  };

  systemd.services.telegraf = {
    wants = [ "telegraf-kubernetes-setup.service" ];
    after = [ "telegraf-kubernetes-setup.service" ];
  };
}
