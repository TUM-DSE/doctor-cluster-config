# The farm balancer: envoy in front of the scheduler and the workers
# (docs/nix-farm.md). Its certificate comes from the farm CA, since the
# university firewall keeps Let's Encrypt away from this host; clients
# outside the chair network go through doctor (./reverse-proxy.nix).
{
  config,
  inputs,
  lib,
  ...
}:
let
  farm = import ./settings.nix;
  cert = "${farm.certs}/lb-${config.networking.hostName}.crt";
  key = config.sops.secrets.nix-farm-lb-key.path;
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

  # sops cannot hand a secret to a DynamicUser
  users.users.envoy = {
    isSystemUser = true;
    group = "envoy";
  };
  users.groups.envoy = { };
  systemd.services.envoy.serviceConfig = {
    DynamicUser = lib.mkForce false;
    User = "envoy";
  };
  sops.secrets.nix-farm-lb-key.owner = "envoy";
}
