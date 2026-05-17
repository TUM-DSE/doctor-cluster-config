{ config, lib, pkgs, inputs, ... }:
{
  sops.secrets = lib.mkIf config.users.withSops {
    tinc-key = { };
    tinc-legacy-key = { };
  };

  services.tinc.networks.retiolum = {
    # Rust rewrite, drop-in for tinc_pre on the NixOS module's argv.
    package = pkgs.callPackage "${inputs.tincr}/nix/tincd.nix" {
      craneLib = inputs.tincr.inputs.crane.mkLib pkgs;
    };
    extraConfig = "StrictSubnets yes";
    ed25519PrivateKeyFile = lib.mkIf (
      config.sops.secrets ? "tinc-key"
    ) config.sops.secrets."tinc-key".path;

    rsaPrivateKeyFile = lib.mkIf (
      config.sops.secrets ? "tinc-legacy-key"
    ) config.sops.secrets."tinc-legacy-key".path;
  };

  # /etc/tinc/retiolum is read-only on NixOS (built from the store);
  # the Rust tincd's address cache falls back to $STATE_DIRECTORY/cache
  # when confbase isn't writable.
  systemd.services."tinc.retiolum" = {
    serviceConfig.StateDirectory = "tinc/retiolum";
    preStart = lib.mkAfter ''
      install -d -m 0750 -o tinc-retiolum -g tinc-retiolum /var/lib/tinc/retiolum/cache
    '';
  };
}
