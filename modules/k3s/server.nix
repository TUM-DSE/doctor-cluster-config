{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];
  # k3s api server
  sops.secrets.telegraf-github-token.owner = "telegraf";
  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s.extraFlags = "--no-deploy traefik --flannel-backend=host-gw --container-runtime-endpoint unix:///run/containerd/containerd.sock";

  services.telegraf = {
    extraConfig.inputs.kube_inventory = {
      bearer_token = "/run/telegraf-kubernetes-token";
      tls_cert = "/run/telegraf-kubernetes-cert";
      tls_key = "/run/telegraf-kubernetes-key";
      url = "https://localhost:6443";
      insecure_skip_verify = true;
      resource_include = [ "pods" ];
    };
    extraConfig.inputs.http = {
      urls = [
        "https://api.github.com/orgs/ls1-sys-prog-course/actions/runners"
        "https://api.github.com/orgs/ls1-sys-prog-course-internal/actions/runners"
      ];
      bearer_token = config.sops.secrets.telegraf-github-token.path;
      headers = { Accept = "application/vnd.github.v3+json"; };
      data_format = "json";
      tag_keys = [ "os" "name" ];
      json_query = "runners";
      fielddrop = ["labels_*" "id"];
      json_string_fields = [ "status" "busy" ];
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
