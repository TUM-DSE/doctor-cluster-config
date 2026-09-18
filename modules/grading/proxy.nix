{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.grading-infrastructure;

in
{
  config = lib.mkIf cfg.enable {
    sops.secrets.grading-web-deploy-key.restartUnits = [ "grading-web-provision.service" ];
    programs.ssh.knownHosts."grading.dos.cit.tum.de".publicKey =
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGKEAvyCq4YtNjvYuy7J78GTqkYmw4hMyQFbd3ap3XaN";
    systemd.services.grading-tls = {
      description = "Renew the grading server certificate using the existing CA";
      wantedBy = [ "multi-user.target" ];
      before = [ "nginx.service" ];
      path = [
        pkgs.openssl
        pkgs.coreutils
        pkgs.systemd
      ];
      environment = {
        GRADING_HOSTNAME = "${config.networking.hostName}.dos.cit.tum.de";
        GRADING_CERTIFICATE = "/var/lib/grading-tls/server.crt";
        GRADING_PRIVATE_KEY = "/var/lib/grading-tls/server.key";
      };
      script = builtins.readFile ./tls.sh;
      serviceConfig = {
        Type = "oneshot";
        StateDirectory = "grading-tls";
        StateDirectoryMode = "0750";
        Group = config.services.nginx.group;
        UMask = "0077";
      };
    };
    systemd.timers.grading-tls = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
        RandomizedDelaySec = "1h";
      };
    };
    systemd.services.nginx = {
      requires = [ "grading-tls.service" ];
      after = [ "grading-tls.service" ];
    };
    services.nginx = {
      enable = true;
      recommendedTlsSettings = true;
      virtualHosts =
        let
          tls = port: {
            serverName = "${config.networking.hostName}.dos.cit.tum.de";
            onlySSL = true;
            sslCertificate = "/var/lib/grading-tls/server.crt";
            sslCertificateKey = "/var/lib/grading-tls/server.key";
            listen = [
              {
                addr = "0.0.0.0";
                inherit port;
                ssl = true;
              }
              {
                addr = "[::]";
                inherit port;
                ssl = true;
              }
            ];
          };
        in
        {
          grading-web = (tls 3000) // {
            extraConfig = ''
              access_log off;
              client_max_body_size 16m;
              allow 131.159.102.40;
              allow 2a09:80c0:102::40;
              deny all;
            '';
            locations."/internal/".return = "404";
            locations."/" = {
              proxyPass = "http://127.0.0.1:8080";
              extraConfig = ''
                proxy_set_header Host grading.dos.cit.tum.de;
                proxy_set_header X-Forwarded-Proto https;
                proxy_set_header X-Forwarded-For $http_x_forwarded_for;
              '';
            };
          };
          grading-worker = (tls 3002) // {
            extraConfig = ''
              access_log off;
              allow 127.0.0.1;
              allow ::1;
              allow ${config.networking.doctorwho.currentHost.ipv4};
              ${lib.optionalString (
                config.networking.doctorwho.currentHost.ipv6 != null
              ) "allow ${config.networking.doctorwho.currentHost.ipv6};"}
              deny all;
            '';
            locations."/internal/".proxyPass = "http://127.0.0.1:8081";
            locations."/".return = "404";
          };
        };
    };
    systemd.services.grading-web-provision = {
      description = "Configure the grading nginx proxy";
      wantedBy = [ "multi-user.target" ];
      after = [
        "network-online.target"
        "sops-nix.service"
        "grading-tls.service"
        "grading-web.service"
        "nginx.service"
      ];
      wants = [ "network-online.target" ];
      requires = [
        "grading-tls.service"
        "grading-web.service"
        "nginx.service"
      ];
      path = [
        pkgs.ansible
        pkgs.openssh
        pkgs.curl
      ];
      environment = {
        ANSIBLE_HOST_KEY_CHECKING = "True";
        ANSIBLE_NOCOLOR = "True";
        ANSIBLE_REMOTE_TEMP = "/tmp/ansible-grading-deploy";
        ANSIBLE_LOCAL_TEMP = "/run/grading-web-provision/ansible";
      };
      preStart = ''
        curl --fail --silent --show-error --retry 30 --retry-delay 2 \
          --retry-all-errors --max-time 5 http://127.0.0.1:8080/readyz >/dev/null
      '';
      script = ''
        exec ansible-playbook --inventory 'grading.dos.cit.tum.de,' --user deploy \
          --private-key "$CREDENTIALS_DIRECTORY/deploy-key" ${./proxy.yml}
      '';
      unitConfig.StartLimitIntervalSec = 0;
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        LoadCredential = "deploy-key:${config.sops.secrets.grading-web-deploy-key.path}";
        RuntimeDirectory = "grading-web-provision";
        RuntimeDirectoryMode = "0700";
        RemainAfterExit = true;
        Restart = "on-failure";
        RestartSec = "30s";
        TimeoutStartSec = "15min";
      };
    };
  };
}
