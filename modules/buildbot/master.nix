{ config, lib, pkgs, ... }:

let
  # TODO: make this an option

  # https://github.com/organizations/numtide/settings/applications
  # Application name: BuildBot
  # Homepage URL: https://buildbot.numtide.com
  # Authorization callback URL: https://buildbot.numtide.com/auth/login
  # oauth_token:  2516248ec6289e4d9818122cce0cbde39e4b788d

  buildbotDomain = "buildbot.dse.in.tum.de";
  githubOauthId = "1448d1d1a3d84fa023f4";
in
{
  services.buildbot-master = {
    enable = true;
    masterCfg = "${./.}/master.py";
    dbUrl = "postgresql://@/buildbot";
    pythonPackages = ps: [
      ps.requests
      ps.treq
      ps.psycopg2
      ps.buildbot-worker
    ];
    home = "/var/lib/buildbot-master";
  };

  # We don't want this to collide with normal user uids
  users.users.buildbot.isSystemUser = true;
  users.users.buildbot.isNormalUser = lib.mkForce false;

  systemd.services.buildbot-master = {
    environment = {
      PORT = "1810";
      DB_URL = config.services.buildbot-master.dbUrl;
      # Github app used for the login button
      GITHUB_OAUTH_ID = githubOauthId;
      GITHUB_ORG = "TUM-DSE";
      GITHUB_REPO = "doctor-cluster-config";

      BUILDBOT_URL = "https://${buildbotDomain}/";
      BUILDBOT_GITHUB_USER = "doctor-cluster-bot";
      # UNUSED: comma seperated list of users that are allowed to login to buildbot and do stuff
      # GITHUB_ADMINS = "Mic92,pogobanane";
    };
    serviceConfig = {
      # in master.py we read secrets from $CREDENTIALS_DIRECTORY
      LoadCredential = [
        "github-token:${config.sops.secrets.github-token.path}"
        "github-webhook-secret:${config.sops.secrets.github-webhook-secret.path}"
        "github-oauth-secret:${config.sops.secrets.github-oauth-secret.path}"
        "buildbot-nix-workers:${config.sops.secrets.buildbot-nix-workers.path}"
        "cachix-name:${config.sops.secrets.cachix-name.path}"
        "cachix-auth-token:${config.sops.secrets.cachix-auth-token.path}"
      ];
    };
  };

  sops.secrets = {
    # doctor-cluster-bot-token
    github-token = {};
    github-webhook-secret = {};
    github-oauth-secret = {};
    buildbot-nix-workers = {};
    cachix-name = {};
    cachix-auth-token = {};
  };

  imports = [
    ../postgresql.nix
    ./hostfile.nix
  ];

  services.postgresql = {
    ensureDatabases = [ "buildbot" ];
    ensureUsers = [
      {
        name = "buildbot";
        ensurePermissions."DATABASE buildbot" = "ALL PRIVILEGES";
      }
    ];
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
  services.nginx.enable = true;

  services.nginx.virtualHosts."buildbot-master" = {
    locations."/".proxyPass = "http://127.0.0.1:1810/";
    locations."/sse" = {
      proxyPass = "http://127.0.0.1:1810/sse/";
      # proxy buffering will prevent sse to work
      extraConfig = "proxy_buffering off;";
    };
    locations."/ws" = {
      proxyPass = "http://127.0.0.1:1810/ws";
      proxyWebsockets = true;
      # raise the proxy timeout for the websocket
      extraConfig = "proxy_read_timeout 6000s;";
    };

    # In this directory we store the lastest build store paths for nix attributes
    locations."/nix-outputs".root = "/var/www/buildbot/";
  };

  # Allow buildbot-master to write to this directory
  systemd.tmpfiles.rules = [
    "d /var/www/buildbot/nix-outputs 0755 buildbot buildbot - -"
  ];
}
