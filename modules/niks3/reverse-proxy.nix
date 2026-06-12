# Reverse proxy for niks3 cache on doctor container
#
# - niks3.dos.cit.tum.de → astrid:5752 (for niks3 push)
# - cache.dos.cit.tum.de → S3 with auth (for nix client reads)
#
# S3 auth uses a Rust nginx module (./nginx-s3-auth) that exposes AWS SigV4
# signing variables.
{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Load S3 credentials from shared niks3 secrets
  sops.secrets.niks3-s3-access-key.sopsFile = ./secrets.yml;
  sops.secrets.niks3-s3-secret-key.sopsFile = ./secrets.yml;

  # niks3 server endpoint for pushing to cache
  services.nginx.virtualHosts."niks3.dos.cit.tum.de" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://astrid.dos.cit.tum.de:5752";
      extraConfig = ''
        proxy_connect_timeout 300s;
        proxy_send_timeout 300s;
        proxy_read_timeout 300s;
      '';
    };
  };

  # Rust module providing $s3v4_authorization and $s3v4_amz_date
  services.nginx.additionalModules = [ (pkgs.callPackage ./nginx-s3-auth/package.nix { }) ];

  # Public cache endpoint - proxies to TUM S3 with authentication
  services.nginx.virtualHosts."cache.dos.cit.tum.de" = {
    forceSSL = true;
    enableACME = true;
    extraConfig = ''
      s3_auth_access_key_file /run/nginx/s3-access-key;
      s3_auth_secret_key_file /run/nginx/s3-secret-key;
      s3_auth_host dos-s3-1.s3.ito.cit.tum.de;
      s3_auth_region global;
    '';
    locations."= /" = {
      return = "302 /index.html";
    };
    locations."/" = {
      proxyPass = "https://dos-s3-1.s3.ito.cit.tum.de";
      extraConfig = ''
        # Public read-only cache: never forward mutating requests to S3.
        limit_except GET {
          deny all;
        }
        proxy_ssl_server_name on;
        proxy_set_header Host dos-s3-1.s3.ito.cit.tum.de;
        proxy_set_header Authorization $s3v4_authorization;
        proxy_set_header x-amz-date $s3v4_amz_date;
        proxy_set_header x-amz-content-sha256 UNSIGNED-PAYLOAD;
        proxy_hide_header x-amz-id-2;
        proxy_hide_header x-amz-request-id;
        proxy_hide_header x-amz-meta-server-side-encryption;
        proxy_hide_header x-amz-server-side-encryption;
      '';
    };
  };

  # Copy S3 credentials to /run/nginx for nginx to read at config load.
  # Must run before NixOS's nginx-pre-start (nginx -t), which needs the files.
  systemd.services.nginx.serviceConfig.ExecStartPre = lib.mkBefore (let
    script = pkgs.writeShellScript "nginx-s3-credentials" ''
      install -d /run/nginx
      install -o nginx -g nginx -m 400 ${config.sops.secrets.niks3-s3-access-key.path} /run/nginx/s3-access-key
      install -o nginx -g nginx -m 400 ${config.sops.secrets.niks3-s3-secret-key.path} /run/nginx/s3-secret-key
    '';
  in [ "+${script}" ]);
}
