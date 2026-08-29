{ config, lib, pkgs, ... }:
let
  domain = "auth.dos.cit.tum.de";
  allowedUids = lib.concatMapStrings (u: "(uid=${u})") config.monitoring.citLogins;
  # login form labels; https://www.authelia.com/reference/guides/server-asset-overrides/
  assets = pkgs.runCommand "authelia-assets" { } ''
    mkdir -p $out/locales/en
    cp ${builtins.toFile "portal.json" (builtins.toJSON {
      "Username" = "RBG/CIT login (as for login.dos.cit.tum.de, not TUM-ID)";
      "Password" = "RBG/CIT password";
      "Sign in" = "Sign in — access is granted via citLogin in doctor-cluster-config";
    })} $out/locales/en/portal.json
  '';
  secret = name: {
    sopsFile = ./secrets.yml;
    owner = config.services.authelia.instances.main.user;
  };
in
{
  # Protect an nginx vhost with Authelia (CIT LDAP password + passkey).
  options.services.nginx.virtualHosts = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule (
        { config, ... }:
        {
          options.authelia = lib.mkEnableOption "authelia forward-auth for location /";
          config = lib.mkIf config.authelia {
            extraConfig = ''
              error_page 401 =302 https://${domain}/?rd=$scheme://$http_host$request_uri;
            '';
            locations."/".extraConfig = ''
              auth_request /internal/authelia/authz;
              auth_request_set $user $upstream_http_remote_user;
              proxy_set_header Remote-User $user;
            '';
            locations."/internal/authelia/authz".extraConfig = ''
              internal;
              proxy_pass http://127.0.0.1:9091/api/authz/auth-request;
              proxy_set_header X-Original-URL $scheme://$http_host$request_uri;
              proxy_set_header X-Original-Method $request_method;
              proxy_set_header X-Forwarded-For $remote_addr;
              proxy_set_header Content-Length "";
              proxy_set_header Connection "";
              proxy_pass_request_body off;
            '';
          };
        }
      )
    );
  };

  imports = [ ./cit-logins.nix ];

  config = {
    sops.secrets.authelia-jwt-secret = secret "authelia-jwt-secret";
    sops.secrets.authelia-storage-encryption-key = secret "authelia-storage-encryption-key";
    sops.secrets.authelia-session-secret = secret "authelia-session-secret";

    services.authelia.instances.main = {
      enable = true;
      secrets = {
        jwtSecretFile = config.sops.secrets.authelia-jwt-secret.path;
        storageEncryptionKeyFile = config.sops.secrets.authelia-storage-encryption-key.path;
        sessionSecretFile = config.sops.secrets.authelia-session-secret.path;
      };
      settings = {
        theme = "auto";
        server.address = "tcp://127.0.0.1:9091/";
        server.asset_path = toString assets;
        server.endpoints.authz.auth-request.implementation = "AuthRequest";
        log.level = "info";

        default_2fa_method = "webauthn";
        webauthn = {
          disable = false;
          display_name = "DSE monitoring";
          enable_passkey_login = true;
          # passkey with user verification counts as both factors
          experimental_enable_passkey_uv_two_factors = true;
          selection_criteria = {
            discoverability = "required";
            user_verification = "required";
          };
        };
        totp.disable = true;

        # https://wiki.ito.cit.tum.de/bin/view/CIT/ITO/Docs/Guides/LDAP-Apps/
        authentication_backend = {
          password_reset.disable = true;
          password_change.disable = true;
          ldap = {
            implementation = "custom";
            address = "ldaps://ldap.cit.tum.de";
            permit_unauthenticated_bind = true;
            base_dn = "ou=dir,dc=cit,dc=tum,dc=de";
            additional_users_dn = "ou=users";
            users_filter = "(&(objectClass=rbgAccount)({username_attribute}={input})(|${allowedUids}))";
            additional_groups_dn = "ou=groups";
            groups_filter = "(&(objectClass=posixGroup)(memberUid={username}))";
            attributes = {
              username = "uid";
              display_name = "cn";
              mail = "mail";
              group_name = "cn";
            };
          };
        };

        session.cookies = [
          {
            domain = "dos.cit.tum.de";
            authelia_url = "https://${domain}";
          }
        ];
        storage.local.path = "/var/lib/authelia-main/db.sqlite3";
        # No SMTP relay yet: the one-time code for registering a passkey ends up
        # here, so an admin has to hand it out (`tail /var/lib/authelia-main/notifications.txt`).
        notifier.filesystem.filename = "/var/lib/authelia-main/notifications.txt";

        access_control = {
          default_policy = "deny";
          rules = [
            {
              domain = [
                "prometheus.dos.cit.tum.de"
                "alertmanager.dos.cit.tum.de"
              ];
              # LDAP password or a registered passkey
              policy = "one_factor";
            }
          ];
        };
      };
    };

    services.nginx.virtualHosts.${domain} = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9091";
        recommendedProxySettings = true;
      };
    };
  };
}
