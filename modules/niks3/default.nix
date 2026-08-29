# niks3 binary cache server on nixcache
#
# niks3.dos.cit.tum.de: push API (GitHub OIDC / API token)
# cache.dos.cit.tum.de: public read path; niks3's read proxy serves narinfos
#   and 307-redirects NARs to presigned URLs on the TUM ITO S3.
#
# Required secrets in ./secrets.yml:
#   niks3-s3-access-key, niks3-s3-secret-key
#   niks3-api-token: openssl rand -base64 32
#   niks3-signing-key: nix key generate-secret --key-name cache.dos.cit.tum.de-1
{ config, inputs, ... }:
let
  cfg = config.services.niks3;
in
{
  imports = [
    inputs.niks3.nixosModules.niks3
  ];

  services.niks3 = {
    enable = true;
    httpAddr = "127.0.0.1:5752";

    cacheUrl = "https://cache.dos.cit.tum.de";
    serverUrl = "https://niks3.dos.cit.tum.de";

    s3 = {
      endpoint = "s3.ito.cit.tum.de";
      bucket = "dos-s3-1";
      useSSL = true;
      accessKeyFile = config.sops.secrets.niks3-s3-access-key.path;
      secretKeyFile = config.sops.secrets.niks3-s3-secret-key.path;
    };

    apiTokenFile = config.sops.secrets.niks3-api-token.path;
    signKeyFiles = [ config.sops.secrets.niks3-signing-key.path ];

    oidc.providers.github = {
      issuer = "https://token.actions.githubusercontent.com";
      audience = "https://niks3.dos.cit.tum.de";
      boundClaims.repository = [
        "TUM-DSE/*"
        # Dogfooding the GitHub Action's own CI.
        "Mic92/niks3-action"
      ];
    };

    # bucket is private; no read rule configured, so reads stay unauthenticated
    readProxy = {
      enable = true;
      redirectTTL = "1h";
    };

    nginx = {
      enable = true;
      domain = "niks3.dos.cit.tum.de";
    };
  };

  services.nginx.virtualHosts."cache.dos.cit.tum.de" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://${cfg.httpAddr}";
      extraConfig = ''
        limit_except GET { deny all; }
      '';
    };
  };

  sops.secrets.niks3-s3-access-key = {
    sopsFile = ./secrets.yml;
    owner = "niks3";
  };
  sops.secrets.niks3-s3-secret-key = {
    sopsFile = ./secrets.yml;
    owner = "niks3";
  };
  sops.secrets.niks3-api-token = {
    sopsFile = ./secrets.yml;
    owner = "niks3";
  };
  sops.secrets.niks3-signing-key = {
    sopsFile = ./secrets.yml;
    owner = "niks3";
  };
}
