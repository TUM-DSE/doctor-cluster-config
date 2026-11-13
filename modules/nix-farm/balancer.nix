# The farm balancer: envoy in front of the scheduler and the workers
# (docs/nix-farm.md). Its certificate comes from the farm CA, since the
# university firewall keeps Let's Encrypt away from this host; clients
# outside the chair network go through doctor (./reverse-proxy.nix).
{
  config,
  inputs,
  ...
}:
let
  farm = import ./settings.nix;
  cert = "${farm.certs}/lb-${config.networking.hostName}.crt";
  key = "/run/credentials/envoy.service/lb-key";
in
{
  imports = [ inputs.nix-grpc-store.nixosModules.default ];

  services.nix-grpc-farm-lb = {
    enable = true;
    accessLog = true;
    listen = "[::]:${toString farm.port}";
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      # graham itself, through binfmt (modules/buildbot/nixbot.nix)
      "riscv64-linux"
    ];
    scheduler = "${config.networking.doctorwho.currentHost.ipv4}:${toString farm.workerPort}";
    # No clientCaFile: every client presents an OIDC token.
    tls = {
      certFile = cert;
      keyFile = key;
      upstream = {
        certFile = cert;
        keyFile = key;
        caFile = "${farm.certs}/ca.crt";
      };
    };
  };

  # envoy watches the directory of the key for rotation and may not read
  # /run/secrets, so the key goes through a credential.
  # envoy's admin listener can also shut it down, so prometheus only gets
  # the stats page.
  services.nginx.virtualHosts."nix-farm-metrics" = {
    listen = [
      {
        addr = "[::]";
        port = farm.lbMetricsPort;
      }
      {
        addr = "0.0.0.0";
        port = farm.lbMetricsPort;
      }
    ];
    locations."= /stats/prometheus".proxyPass = "http://127.0.0.1:9901";
  };

  sops.secrets.nix-farm-lb-key = { };
  systemd.services.envoy.serviceConfig.LoadCredential = [
    "lb-key:${config.sops.secrets.nix-farm-lb-key.path}"
  ];
}
