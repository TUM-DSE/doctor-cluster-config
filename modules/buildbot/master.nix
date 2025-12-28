{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./hostfile.nix
    ../postgresql.nix
    inputs.buildbot-nix.nixosModules.buildbot-master
  ];
  services.buildbot-nix.master = {
    enable = true;
    domain = "buildbot-master";
    workersFile = config.sops.secrets.buildbot-nix-workers.path;
    buildSystems = [
      "i686-linux"
      "x86_64-linux"
      "aarch64-linux"
    ];
    evalWorkerCount = 32;
    github = {
      webhookSecretFile = config.sops.secrets.github-webhook-secret.path;
      topic = "buildbot-tum-dse";

      oauthId = "Iv23liXx1iKmPAfsoUoQ";
      oauthSecretFile = config.sops.secrets.buildbot-github-oauth-secret.path;

      appId = 958012;
      appSecretKeyFile = config.sops.secrets.buildbot-github-app-secret-key.path;
    };
    admins = [
      "Mic92"
      "pogobanane"
    ];
    outputsPath = "/var/www/buildbot/nix-outputs/";
    niks3 = {
      enable = true;
      serverUrl = "https://niks3.dos.cit.tum.de";
      authTokenFile = config.sops.secrets.niks3-api-token.path;
      package = inputs.niks3.packages.${pkgs.system}.default;
    };
  };

  services.buildbot-master = {
    extraConfig = ''
      c["protocols"] = {"pb": {"port": "tcp:9989:interface=\\:\\:"}}
    '';
    pythonPackages = ps: [
      ps.bcrypt
      ps.cryptography
    ];
  };

  # TODO: make nginx optional in buildbot-nix
  services.buildbot-master.buildbotUrl = lib.mkForce "https://buildbot.dse.in.tum.de/";

  sops.secrets = {
    # doctor-cluster-bot-token
    github-webhook-secret = { };
    buildbot-github-oauth-secret = { };
    buildbot-github-app-secret-key = { };
    buildbot-nix-workers = { };
    niks3-api-token.sopsFile = ../niks3/secrets.yml;
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
