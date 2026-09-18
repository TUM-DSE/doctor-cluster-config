{
  config,
  lib,
  pkgs,
  inputs,
  self,
  ...
}:
let
  workers = builtins.attrValues (
    lib.filterAttrs (
      _: host: host.config.services.grading-worker.enable or false
    ) self.nixosConfigurations
  );
  app = inputs.srg-grading.packages.${pkgs.stdenv.hostPlatform.system}.default;
  runner = import ./runner.nix { inherit pkgs inputs; };
  credentials = "/var/lib/grading-executor-credentials";
  executorBase = (pkgs.formats.toml { }).generate "grading-executor-base.toml" {
    api_url = "https://${config.networking.hostName}.dos.cit.tum.de:3002";
    token_file = "/run/credentials/grading-executor.service/worker-token";
    tls_ca_file = "/run/credentials/grading-executor.service/ca.crt";
    namespace = "grading";
    runtime_class = "gvisor";
    source_pvc = "grading-source-shared";
    staging_root = "/var/lib/grading/source";
  };
in
{
  config = lib.mkIf config.services.grading-infrastructure.enable {
    assertions = [
      {
        assertion = config.services.k3s.enable && config.services.k3s.role == "server";
        message = "Grading orchestration requires the k3s server.";
      }
      {
        assertion =
          workers != [ ]
          && lib.all (host: host.pkgs.stdenv.hostPlatform.system == pkgs.stdenv.hostPlatform.system) workers;
        message = "Enable at least one grading worker; workers must match the central runner image architecture.";
      }
    ];
    users.groups.grading-executor.gid = 10004;
    users.users.grading-executor = {
      isSystemUser = true;
      uid = 10004;
      group = "grading-executor";
    };
    environment.etc."grading/profiles.toml".source = "${runner}/profiles.toml";

    systemd.services.grading-source-storage = {
      after = [ "zfs-mount.service" ];
      before = [ "nfs-server.service" ];
      path = [
        config.boot.zfs.package
        pkgs.coreutils
      ];
      script = ''
        set -eu
        if ! zfs list zroot/grading-source >/dev/null 2>&1; then
          zfs create -o mountpoint=/var/lib/grading/source -o quota=128G zroot/grading-source
        fi
        zfs set quota=128G zroot/grading-source
        chown 10004:10004 /var/lib/grading/source
        chmod 0755 /var/lib/grading/source
      '';
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
    };
    services.nfs.server = {
      enable = true;
      # Node roots are trusted to mount private subpaths for the grader UID.
      # Pods cannot connect to NFS themselves; their network remains default-deny.
      exports =
        "/var/lib/grading/source "
        + lib.concatMapStringsSep " " (
          host:
          "${host.config.networking.doctorwho.currentHost.ipv4}(rw,sync,no_subtree_check,no_root_squash,fsid=0)"
        ) workers;
    };
    services.nfs.settings.nfsd = {
      vers3 = false;
      vers4 = true;
    };
    networking.firewall.allowedTCPPorts = [ 2049 ];
    systemd.services.nfs-server = {
      requires = [ "grading-source-storage.service" ];
      after = [ "grading-source-storage.service" ];
    };
    systemd.services.nfs-mountd = {
      requires = [ "grading-source-storage.service" ];
      after = [ "grading-source-storage.service" ];
    };

    systemd.services.grading-executor-provision = {
      description = "Register the central grading executor and provision scoped credentials";
      requires = [
        "k3s.service"
        "grading-migrate.service"
      ];
      after = [
        "k3s.service"
        "grading-migrate.service"
      ];
      path = [
        pkgs.kubectl
        pkgs.jq
        pkgs.openssl
        pkgs.util-linux
        pkgs.coreutils
      ];
      script = ''
        set -eu
        install -d -m 0700 ${credentials}
        if [ ! -s ${credentials}/worker-token ]; then
          openssl rand -hex 32 > ${credentials}/worker-token
        fi
        # The operator can read this file only while registration is in progress.
        install -m 0400 -o grading-operator ${credentials}/worker-token /run/grading-executor-provision/token
        runuser -u grading-operator -- ${app}/bin/gradingctl \
          --database-url-file /etc/grading/operator.url \
          worker register --id ${config.networking.hostName}-executor \
          --token-file /run/grading-executor-provision/token \
          --profile registered-v1 --cpu 10 --memory-gib 32 --storage-gib 64
        rm /run/grading-executor-provision/token
        for attempt in $(seq 1 60); do
          if kubectl --kubeconfig=/etc/rancher/k3s/k3s.yaml -n grading \
            get secret grading-executor-token -o json | jq -e '
              .data as $d | select($d.token != null and $d["ca.crt"] != null) |
              {apiVersion:"v1",kind:"Config",
               clusters:[{name:"grading",cluster:{server:"https://127.0.0.1:6443",
                 "certificate-authority-data":$d["ca.crt"]}}],
               users:[{name:"executor",user:{token:($d.token|@base64d)}}],
               contexts:[{name:"grading",context:{cluster:"grading",user:"executor",namespace:"grading"}}],
               "current-context":"grading"}' > ${credentials}/kubeconfig.new; then
            mv ${credentials}/kubeconfig.new ${credentials}/kubeconfig
            exit 0
          fi
          echo "Waiting for grading service-account credentials ($attempt/60)" >&2
          sleep 2
        done
        echo "Grading service-account token was not ready" >&2
        exit 1
      '';
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        UMask = "0077";
        RuntimeDirectory = "grading-executor-provision";
        RuntimeDirectoryMode = "0711";
        TimeoutStartSec = "3min";
      };
    };
    systemd.services.grading-executor = {
      description = "Central SRG grading executor";
      wantedBy = [ "multi-user.target" ];
      requires = [
        "grading-executor-provision.service"
        "grading-source-storage.service"
        "grading-web.service"
        "nginx.service"
        "nfs-server.service"
      ];
      after = [
        "grading-executor-provision.service"
        "grading-source-storage.service"
        "grading-web.service"
        "nginx.service"
        "nfs-server.service"
      ];
      partOf = [
        "grading-executor-provision.service"
        "grading-web.service"
      ];
      environment.KUBECONFIG = "/run/credentials/grading-executor.service/kubeconfig";
      preStart = ''
        cat ${executorBase} > /run/grading-executor/config.toml
        printf '\n' >> /run/grading-executor/config.toml
        cat ${runner}/profiles.toml >> /run/grading-executor/config.toml
      '';
      serviceConfig = {
        User = "grading-executor";
        Group = "grading-executor";
        UMask = "0022";
        RuntimeDirectory = "grading-executor";
        RuntimeDirectoryMode = "0700";
        LoadCredential = [
          "worker-token:${credentials}/worker-token"
          "kubeconfig:${credentials}/kubeconfig"
          "ca.crt:/var/lib/grading-tls/ca.crt"
        ];
        ExecStart = "${app}/bin/grading-executor --config /run/grading-executor/config.toml";
        Restart = "on-failure";
        RestartSec = "10s";
        NoNewPrivileges = true;
        ProtectSystem = "strict";
        ProtectHome = true;
        PrivateTmp = true;
        ReadWritePaths = [ "/var/lib/grading/source" ];
      };
    };
  };
}
