{ pkgs, config, ... }: let
  lrz-gitlab-classroom = builtins.getFlake "github:pogobanane/lrz-gitlab-classroom/cbaf48abbd0f65096ff466c68dbf9cfda9a6d753";
  frontend = lrz-gitlab-classroom.packages.${pkgs.system}.frontend;
  user = "lrz-gitlab-teacher";
in {
  services.nginx.virtualHosts."assignments.dos.cit.tum.de" = {
    forceSSL = true;
    enableACME = true;

    # locations."/".proxyPass = "https://pogobanane.de/";
    locations."/" = {
      proxyPass = "http://unix:/run/lrz-gitlab-classroom-frontend.sock";
      extraConfig = ''
        proxy_http_version 1.1;
		    proxy_set_header Upgrade $http_upgrade;
		    proxy_set_header Connection "upgrade";
		    proxy_set_header Host $host;
		    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		    proxy_set_header X-Forwarded-Proto $scheme;
      '';
      # return = "200 '<html><body>It works</body></html>'";
      # extraConfig = ''
      #   default_type text/html;
      # '';
    };
  };

  users.users.${user} = {
    isSystemUser = true;
    group = user;
  };
  users.groups.${user} = {};

  sops.secrets.lrz-gitlab-classroom-gitlab-oauth-client-secret.owner = user;
  sops.secrets.lrz-gitlab-classroom-tumonline-oauth-client-secret.owner = user;
  sops.secrets.lrz-gitlab-classroom-secret.owner = user;

  systemd.sockets.lrz-gitlab-classroom-frontend = {
    description = "LRZ GitLab Classroom Frontend Socket";
    wantedBy = [ "sockets.target" ];
    socketConfig = {
      Accept = false;
      ListenStream = "/run/lrz-gitlab-classroom-frontend.sock";
      SocketUser = config.services.nginx.user;
      SocketGroup = config.services.nginx.group;
    };
  };

  systemd.services.lrz-gitlab-classroom-frontend = {
    description = "LRZ GitLab Classroom Frontend";
    after = [ "network.target" "lrz-gitlab-classroom-frontend.socket" ];
    requires = [ "lrz-gitlab-classroom-frontend.socket" ];
    environment = {
      TUMONLINE_OAUTH_CLIENT_ID = "";
      GITLAB_OAUTH_CLIENT_ID = "";
      GITLAB_OAUTH_SCOPE = "read_user";
      STATE_DIRECTORY = "/var/lib/lrz-gitlab-classroom";
      TEMPLATE_PATH = "${frontend}/share/templates/grnvs/";
      # Add non-secret env vars here
    };
    script = ''
      export GITLAB_OAUTH_CLIENT_SECRET="$(cat ${config.sops.secrets.lrz-gitlab-classroom-gitlab-oauth-client-secret.path})"
      export TUMONLINE_OAUTH_CLIENT_SECRET="$(cat ${config.sops.secrets.lrz-gitlab-classroom-tumonline-oauth-client-secret.path})"
      export SECRET="$(cat ${config.sops.secrets.lrz-gitlab-classroom-secret.path})"
      exec ${frontend}/bin/lrz-gitlab-classroom-frontend daemon -m production --proxy -l http://*?fd=3
    '';
    serviceConfig = {
      Type = "simple";
      Restart = "on-failure";
      User = "lrz-gitlab-teacher";
      Group = "lrz-gitlab-teacher";
      StateDirectory = "lrz-gitlab-classroom"; # defaults to /var/lib/lrz-gitlab-classroom
    };

    # Maybe the following restrictions?

    # # make "systemd-analyze security" happier
    # CapabilityBoundingSet=
    # LockPersonality=yes
    # MemoryDenyWriteExecute=yes
    # NoNewPrivileges=yes
    # PrivateDevices=yes
    # PrivateTmp=yes
    # ProcSubset=pid
    # ProtectClock=yes
    # ProtectControlGroups=yes
    # ProtectHome=yes
    # ProtectHostname=yes
    # ProtectKernelLogs=yes
    # ProtectKernelModules=yes
    # ProtectKernelTunables=yes
    # ProtectProc=invisible
    # ProtectSystem=full
    # RemoveIPC=yes
    # RestrictAddressFamilies=AF_PACKET
    # RestrictNamespaces=yes
    # RestrictRealtime=yes
    # RestrictSUIDSGID=yes
    # SystemCallArchitectures=native
    # SystemCallFilter=~@clock @cpu-emulation @debug @module @mount @obsolete @privileged @raw-io @reboot @resources @swap

  };
}
