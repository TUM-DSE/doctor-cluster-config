# Reverse proxy for niks3 cache on doctor container
#
# - niks3.dos.cit.tum.de → astrid:5752 (for niks3 push)
# - cache.dos.cit.tum.de → S3 with auth (for nix client reads)
#
# S3 auth uses njs with AWS SigV4 signing.
# Reference: https://github.com/nginxinc/nginx-aws-signature
{ config, pkgs, ... }:
let
  njsScripts = pkgs.runCommand "nginx-njs-scripts" {} ''
    mkdir -p $out
    cp ${./s3_auth.js} $out/s3_auth.js
  '';
in
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

  # Enable njs module for S3 auth
  services.nginx.additionalModules = [ pkgs.nginxModules.njs ];

  # Global nginx config for njs
  services.nginx.appendHttpConfig = ''
    js_path ${njsScripts};
    js_import s3 from s3_auth.js;
  '';

  # Public cache endpoint - proxies to TUM S3 with authentication
  services.nginx.virtualHosts."cache.dos.cit.tum.de" = {
    forceSSL = true;
    enableACME = true;
    extraConfig = ''
      js_set $s3_auth_header s3.authHeader;
      js_set $s3_amz_date s3.amzDate;
    '';
    locations."= /" = {
      return = "302 /index.html";
    };
    locations."/" = {
      proxyPass = "https://dos-s3-1.s3.ito.cit.tum.de";
      extraConfig = ''
        proxy_ssl_server_name on;
        proxy_set_header Host dos-s3-1.s3.ito.cit.tum.de;
        proxy_set_header Authorization $s3_auth_header;
        proxy_set_header x-amz-date $s3_amz_date;
        proxy_set_header x-amz-content-sha256 UNSIGNED-PAYLOAD;
        proxy_hide_header x-amz-id-2;
        proxy_hide_header x-amz-request-id;
        proxy_hide_header x-amz-meta-server-side-encryption;
        proxy_hide_header x-amz-server-side-encryption;
      '';
    };
  };

  # Copy S3 credentials to /run/nginx for njs to read
  systemd.services.nginx.serviceConfig.ExecStartPre = let
    script = pkgs.writeShellScript "nginx-s3-credentials" ''
      mkdir -p /run/nginx
      cp ${config.sops.secrets.niks3-s3-access-key.path} /run/nginx/s3-access-key
      cp ${config.sops.secrets.niks3-s3-secret-key.path} /run/nginx/s3-secret-key
      chown nginx:nginx /run/nginx/s3-access-key /run/nginx/s3-secret-key
      chmod 400 /run/nginx/s3-access-key /run/nginx/s3-secret-key
    '';
  in [ "+${script}" ];
}
