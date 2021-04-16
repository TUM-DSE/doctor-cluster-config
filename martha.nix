{ pkgs, lib, ... }:
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
  imports = [
    ./modules/nfs-home.nix
    ./modules/ci.nix
    ./modules/k3s/server.nix
  ];

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

  networking.hostName = "martha";
  networking.retiolum = {
    ipv4 = "10.243.29.179";
    ipv6 = "42:0:3c46:5466:7dbe:f27a:673f:ea64";
  };

  users.extraUsers.joerg.home = lib.mkForce "/scratch/joerg";

  services.borgbackup.jobs.joerg-martha = {
    paths = [
      "/scratch/joerg"
    ];
    doInit = true;
    repo = "borg@eve.thalheim.io:.";
    preHook = ''
      eval $(ssh-agent)
      ssh-add /etc/nixos/secrets/borgbackup-ssh-key
    '';
    postHook = ''
      cat > /var/log/telegraf/borgbackup-martha <<EOF
      task,frequency=daily last_run=$(date +%s)i,state="$([[ $exitStatus == 0 ]] && echo ok || echo fail)"
      EOF
    '';
    extraArgs = "--lock-wait 900";
    encryption.mode = "none";
    compression = "auto,zstd";
    startAt = "daily";
    prune.keep = {
      within = "1d"; # Keep all archives from the last day
      daily = 7;
      weekly = 4;
      monthly = 0;
    };
  };
  systemd.services.borgbackup-job-joerg-martha.serviceConfig.ReadWritePaths = [
    "/var/log/telegraf"
  ];

  system.stateVersion = "19.09";
}
