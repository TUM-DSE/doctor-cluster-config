{ config, lib, ... }:
{
  # only allow connections from hosts specified in our retiolum hosts.
  services.tinc.networks.retiolum = {
    extraConfig = "StrictSubnets yes";
    ed25519PrivateKeyFile = lib.mkIf (
      config.sops.secrets ? "tinc-key"
    ) config.sops.secrets."tinc-key".path;

    rsaPrivateKeyFile = lib.mkIf (
      config.sops.secrets ? "tinc-legacy-key"
    ) config.sops.secrets."tinc-legacy-key".path;
  };
}
