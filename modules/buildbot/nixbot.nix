{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./hostfile.nix
    ../postgresql.nix
    inputs.nixbot.nixosModules.nixbot
  ];

  services.nixbot = {
    enable = true;
    domain = "buildbot.dse.in.tum.de";
    # Behind doctor's TLS reverse proxy; generate https:// URLs.
    useHTTPS = true;
    # External reverse proxy handles TLS, so do not manage nginx here.
    nginx.enable = false;

    buildSystems = [
      "i686-linux"
      "x86_64-linux"
      "aarch64-linux"
    ];
    evalWorkerCount = 32;

    # Keep buildbot-era check names so existing branch protection rules match.
    statusContextPrefix = "buildbot";

    github = {
      enable = true;
      webhookSecretFile = config.sops.secrets.github-webhook-secret.path;

      oauthId = "Iv23liXx1iKmPAfsoUoQ";
      oauthSecretFile = config.sops.secrets.buildbot-github-oauth-secret.path;

      appId = 958012;
      appSecretKeyFile = config.sops.secrets.buildbot-github-app-secret-key.path;

      topic = "buildbot-tum-dse";
    };

    admins = [
      "github:Mic92"
      "github:pogobanane"
    ];

    outputsPath = "/var/www/buildbot/nix-outputs/";

    niks3 = {
      enable = true;
      serverUrl = "https://niks3.dos.cit.tum.de";
      authTokenFile = config.sops.secrets.niks3-api-token.path;
      package = inputs.niks3.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };

  # nixbot builds through the local nix daemon and offloads to remote builders.
  nix.distributedBuilds = true;
  nix.buildMachines = [
    {
      hostName = "eliza.dos.cit.tum.de";
      maxJobs = 192;
      sshKey = config.sops.secrets.buildbot-builder-ssh-key.path;
      sshUser = "buildbot-worker";
      protocol = "ssh-ng";
      system = "aarch64-linux";
      supportedFeatures = [
        "big-parallel"
        "kvm"
        "nixos-test"
      ];
    }
  ];
  # for working around cross-compiling quirks when building ruby
  boot.binfmt.emulatedSystems = [ "riscv64-linux" ];

  sops.secrets = {
    github-webhook-secret = { };
    buildbot-github-oauth-secret = { };
    buildbot-github-app-secret-key = { };
    buildbot-builder-ssh-key = { };
    niks3-api-token.sopsFile = ../niks3/secrets.yml;
  };

  # nixbot listens on its TCP port; doctor's reverse proxy connects to it.
  networking.firewall.allowedTCPPorts = [
    config.services.nixbot.port
  ];
}
