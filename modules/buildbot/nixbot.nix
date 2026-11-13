{
  config,
  inputs,
  ...
}:
let
  farm = import ../nix-farm/settings.nix;
in
{
  imports = [
    ./hostfile.nix
    ../postgresql.nix
    ../nix-farm/worker.nix
    ../nix-farm/balancer.nix
    inputs.nixbot.nixosModules.nixbot
  ];

  services.nixbot = {
    enable = true;
    domain = "buildbot.dse.in.tum.de";
    # Behind doctor's TLS reverse proxy; generate https:// URLs.
    useHTTPS = true;
    # Manage the local nginx vhost so it serves /nix-outputs/ (consumed by
    # auto-upgrade) alongside the proxied UI. doctor terminates TLS, so no
    # ACME/forceSSL here; this vhost stays plain http on port 80.
    nginx = {
      enable = true;
      enableACME = false;
    };

    buildSystems = [
      "i686-linux"
      "x86_64-linux"
      "aarch64-linux"
    ];
    evalWorkerCount = 32;
    evalMaxMemorySize = 4096;

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

    # Builds run in the farm (docs/nix-farm.md), whose workers push to niks3.
    # The balancer is on this host, so there is no detour over doctor.
    buildStore = {
      url = "grpc://${farm.lbName}:${toString farm.port}?ca-cert=${farm.certs}/ca.crt";
      oidcAudience = farm.audience;
    };
    # tokens must outlive the longest farm build
    workloadIdentity.tokenTtl = 21600;
  };

  programs.nix-grpc-store.enable = true;

  # For builds through graham's own nix daemon; nixbot's go to the farm.
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
  };

  # nixbot's managed nginx vhost listens on port 80; doctor's reverse proxy
  # connects to it (and through it to /nix-outputs/).
  networking.firewall.allowedTCPPorts = [ 80 ];
}
