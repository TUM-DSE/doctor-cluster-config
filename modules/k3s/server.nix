{ config, lib, pkgs, ... }:
let
  resources = ''
    apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: telegraf
      namespace: default
    ---
    apiVersion: rbac.authorization.k8s.io/v1beta1
    kind: ClusterRole
    metadata:
      name: telegraf
    rules:
      - apiGroups: [ "" ]
        resources:
          - pods
        verbs: [ "get", "list" ]
    ---
    apiVersion: rbac.authorization.k8s.io/v1beta1
    kind: ClusterRoleBinding
    metadata:
      name: telegraf
    roleRef:
      apiGroup: rbac.authorization.k8s.io
      kind: ClusterRole
      name: telegraf
    subjects:
      - kind: ServiceAccount
        name: telegraf
        namespace: default
  '';
in
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

  systemd.tmpfiles.rules = [
    "C /run/telegraf-kubernetes-token 400 telegraf root - /etc/nixos/secrets/telegraf-kubernetes-token"
  ];

  systemd.services.k3s.serviceConfig.ExecStartPost = "${pkgs.k3s}/bin/k3s kubectl apply -f ${pkgs.writeText "resources.yaml" resources}";
}
