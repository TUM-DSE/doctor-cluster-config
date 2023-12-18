{ config, lib, ...  }:
{
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
      tokenFile = config.sops.secrets.github-token.path;
      webhookSecretFile = config.sops.secrets.github-webhook-secret.path;
      oauthSecretFile = config.sops.secrets.github-oauth-secret.path;
      oauthId = "1448d1d1a3d84fa023f4";
      user = "doctor-cluster-bot";
      admins = [ "Mic92" "pogobanane" ];
      topic = "buildbot-tum-dse";
    };
    outputsPath = "/var/www/buildbot/nix-outputs";
  };

  services.buildbot-master = {
    extraConfig = ''
      c["protocols"] = {"pb": {"port": "tcp:9989:interface=\\:\\:"}}
    '';
    pythonPackages = ps: [ ps.bcrypt ps.cryptography ];
  };


  # TODO: make nginx optional in buildbot-nix
  services.buildbot-master.buildbotUrl = lib.mkForce "https://buildbot.dse.in.tum.de/";

  sops.secrets = {
    # doctor-cluster-bot-token
    github-token = { };
    github-webhook-secret = { };
    github-oauth-secret = { };
    buildbot-nix-workers = { };
    cachix-name = { };
    cachix-auth-token = { };
  };

  imports = [
    ./hostfile.nix
    ../postgresql.nix
  ];

  networking.firewall.allowedTCPPorts = [ 80 ];
}
