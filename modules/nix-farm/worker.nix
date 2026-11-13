# A farm node: builds what the scheduler on graham assigns and pushes the
# outputs to niks3 (docs/nix-farm.md).
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  farm = import ./settings.nix;
  host = config.networking.hostName;
  address = name: "${config.networking.doctorwho.hosts.${name}.ipv4}:${toString farm.workerPort}";
  isScheduler = host == farm.lbHost;
in
{
  imports = [ inputs.nix-grpc-store.nixosModules.default ];

  services.nix-grpc-daemon = {
    enable = true;
    listen = "[::]:${toString farm.workerPort}";
    advertise = address host;
    roles = [ "builder" ] ++ lib.optional isScheduler "scheduler";
    scheduler = if isScheduler then null else address farm.lbHost;
    # the default would socket-activate the scheduler node, which then never
    # registers as a builder
    idleTimeout = null;
    minFree = "50G";
    # These machines are shared with people running experiments; nix-daemon
    # would otherwise take one build per core.
    maxJobs = lib.mkDefault 16;
    tls = {
      certFile = "${farm.certs}/worker-${host}.crt";
      keyFile = config.sops.secrets.nix-farm-worker-key.path;
      clientCaFile = "${farm.certs}/ca.crt";
    };
    trustedProxies = [ "lb-*" ];
    accessRules = [
      {
        cn = "worker-*";
        role = "trusted";
      }
      {
        # the balancer reads the builder list with its own certificate
        cn = "lb-*";
        role = "trusted";
      }
    ];
    oidc.providers = import ./oidc-providers.nix;
    niks3 = {
      package = inputs.niks3.packages.${pkgs.stdenv.hostPlatform.system}.default;
      url = farm.niks3Url;
      inherit (farm) cacheUrl;
      tokenFile = config.sops.secrets.niks3-api-token.path;
      publicKeys = [ farm.cacheKey ];
    };
  };

  sops.secrets.nix-farm-worker-key.owner = "nix-grpc-daemon";
  sops.secrets.niks3-api-token = {
    sopsFile = ../niks3/secrets.yml;
    owner = "nix-grpc-daemon";
  };
}
