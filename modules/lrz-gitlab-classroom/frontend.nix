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
      proxyPass = "https://localhost:8017/"; # TODO !
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

  systemd.services.lrz-gitlab-classroom-frontend = {
    description = "LRZ GitLab Classroom Frontend";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    environment = {
      TUMONLINE_OAUTH_CLIENT_ID = "";
      GITLAB_OAUTH_CLIENT_ID = "";
      GITLAB_OAUTH_SCOPE = "read_user";
      STATE_DIRECTORY = "/var/lib/lrz-gitlab-classroom";
      TEMPLATE_PATH = "";
      # Add non-secret env vars here
    };
    script = ''
      mkdir -p /var/lib/lrz-gitlab-classroom || echo "Failed to create state directory /var/lib/lrz-gitlab-classroom"
      export GITLAB_OAUTH_CLIENT_SECRET="$(cat ${config.sops.secrets.lrz-gitlab-classroom-gitlab-oauth-client-secret.path})"
      export TUMONLINE_OAUTH_CLIENT_SECRET="$(cat ${config.sops.secrets.lrz-gitlab-classroom-tumonline-oauth-client-secret.path})"
      export SECRET="$(cat ${config.sops.secrets.lrz-gitlab-classroom-secret.path})"
      exec ${frontend}/bin/lrz-gitlab-classroom-frontend daemon --proxy -l http://*?fd=3
    '';
    serviceConfig = {
      Restart = "on-failure";
      User = "lrz-gitlab-teacher";
      Group = "lrz-gitlab-teacher";
    };
  };
}
