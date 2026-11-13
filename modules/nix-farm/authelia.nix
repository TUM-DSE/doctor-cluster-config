# The OIDC side of authelia, with `nix-farm` as its one client: people log in
# through the device flow and present the ID token to the farm
# (docs/nix-farm.md).
{ config, ... }:
let
  farm = import ./settings.nix;
  secret = {
    sopsFile = ../monitoring/secrets.yml;
    owner = config.services.authelia.instances.main.user;
  };
in
{
  imports = [ ../monitoring/authelia.nix ];

  sops.secrets.authelia-oidc-hmac-secret = secret;
  sops.secrets.authelia-oidc-issuer-key = secret;

  services.authelia.instances.main = {
    secrets.oidcHmacSecretFile = config.sops.secrets.authelia-oidc-hmac-secret.path;
    secrets.oidcIssuerPrivateKeyFile = config.sops.secrets.authelia-oidc-issuer-key.path;

    settings.identity_providers.oidc = {
      # The daemon re-reads the token per call but cannot refresh it, and a
      # build may run for hours. No refresh token: authelia only wants
      # offline_access next to the authorization code flow.
      lifespans.custom.nix-farm.id_token = "1 week";
      clients = [
        {
          client_id = farm.audience;
          client_name = "Nix build farm (${farm.domain})";
          public = true;
          # as for prometheus: CIT password or a passkey
          authorization_policy = "one_factor";
          grant_types = [ "urn:ietf:params:oauth:grant-type:device_code" ];
          scopes = [ "openid" ];
          lifespan = "nix-farm";
        }
      ];
    };
  };
}
