{ config, lib, ... }:
{
  sops.secrets = lib.mkIf config.users.withSops {
    tinc-key = { };
  };

  # tincr (via kartei's retiolum module) speaks SPTPS only, so the
  # legacy RSA key is gone; only the Ed25519 identity remains.
  networking.retiolum.ed25519PrivateKeyFile = lib.mkIf (
    config.sops.secrets ? "tinc-key"
  ) config.sops.secrets."tinc-key".path;

  services.tincr.networks.retiolum.extraConfig = "StrictSubnets = yes";
}
