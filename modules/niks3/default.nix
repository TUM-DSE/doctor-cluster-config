# niks3 binary cache server configuration
#
# Required secrets in hosts/graham.yml:
#   niks3-s3-access-key: S3 access key
#   niks3-s3-secret-key: S3 secret key
#   niks3-api-token: API token (min 36 chars), generate with:
#     openssl rand -base64 32
#   niks3-signing-key: Nix signing key, generate with:
#     nix key generate-secret --key-name cache.dos.cit.tum.de-1
{ config, inputs, ... }:
{
  imports = [
    inputs.niks3.nixosModules.niks3
  ];

  services.niks3 = {
    enable = true;
    # Listen on all interfaces - TLS termination is done by reverse proxy on doctor
    httpAddr = "[::]:5752";

    cacheUrl = "https://cache.dos.cit.tum.de";

    # TUM ITO S3 configuration
    s3 = {
      endpoint = "s3.ito.cit.tum.de";
      bucket = "dos-s3-1";
      useSSL = true;
      accessKeyFile = config.sops.secrets.niks3-s3-access-key.path;
      secretKeyFile = config.sops.secrets.niks3-s3-secret-key.path;
    };

    apiTokenFile = config.sops.secrets.niks3-api-token.path;

    signKeyFiles = [ config.sops.secrets.niks3-signing-key.path ];

    # GitHub Actions OIDC authentication
    oidc.providers.github = {
      issuer = "https://token.actions.githubusercontent.com";
      audience = "https://niks3.dos.cit.tum.de";
      boundClaims = {
        repository_owner = [ "TUM-DSE" ];
      };
    };

    # TLS termination handled by reverse proxy on doctor
    nginx.enable = false;
  };

  # Allow doctor reverse proxy to reach niks3
  networking.firewall.allowedTCPPorts = [ 5752 ];

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
