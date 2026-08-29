{ config, pkgs, ... }:
let
  # https://wiki.ito.cit.tum.de/bin/view/CIT/ITO/Docs/Guides/LDAP-Apps/
  # Anonymous bind, only reachable from CIT IP ranges.
  ldapConfig = (pkgs.formats.toml { }).generate "ldap.toml" {
    servers = [
      {
        host = "ldap.cit.tum.de";
        port = 636;
        use_ssl = true;
        search_filter = "(&(objectClass=rbgAccount)(uid=%s))";
        search_base_dns = [ "ou=dir,dc=cit,dc=tum,dc=de" ];
        attributes = {
          username = "uid";
          name = "cn";
          member_of = "memberOf";
          email = "mail";
        };
        group_mappings = [
          {
            group_dn = "cn=dosvm5-admin,ou=groups,ou=machines,ou=dir,dc=cit,dc=tum,dc=de";
            org_role = "Admin";
            grafana_admin = true;
          }
          {
            group_dn = "*";
            org_role = "Viewer";
          }
        ];
      }
    ];
  };
in
{
  sops.secrets.grafana-admin-password = {
    sopsFile = ./secrets.yml;
    owner = "grafana";
    restartUnits = [ "grafana.service" ];
  };
  sops.secrets.grafana-secret-key = {
    sopsFile = ./secrets.yml;
    owner = "grafana";
    restartUnits = [ "grafana.service" ];
  };

  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "127.0.0.1";
        http_port = 3000;
        domain = "grafana.dos.cit.tum.de";
        root_url = "https://grafana.dos.cit.tum.de/";
      };
      security = {
        disable_gravatar = true;
        admin_user = "admin";
        admin_password = "$__file{${config.sops.secrets.grafana-admin-password.path}}";
        secret_key = "$__file{${config.sops.secrets.grafana-secret-key.path}}";
        cookie_secure = true;
      };
      users = {
        allow_sign_up = false;
        allow_org_create = false;
        viewers_can_edit = false;
        home_page = "/d/dse-monitoring/dse-monitoring";
      };
      "auth.ldap" = {
        enabled = true;
        allow_sign_up = true;
        config_file = toString ldapConfig;
      };
      "auth.anonymous".enabled = false;
      analytics = {
        reporting_enabled = false;
        check_for_updates = false;
        check_for_plugin_updates = false;
      };
      alerting.enabled = false;
      unified_alerting.enabled = false;
      snapshots.external_enabled = false;
      news.news_feed_enabled = false;
      # SVG topology diagrams in Business Text panels; dashboards are provisioned from Nix.
      panels.disable_sanitize_html = true;
    };

    declarativePlugins = with pkgs.grafanaPlugins; [
      marcusolsson-dynamictext-panel
    ];

    provision = {
      enable = true;
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          url = "http://127.0.0.1:${toString config.services.prometheus.port}";
          isDefault = true;
          editable = false;
        }
        {
          name = "Loki";
          type = "loki";
          url = "http://127.0.0.1:${toString config.services.loki.configuration.server.http_listen_port}";
          editable = false;
        }
      ];
      dashboards.settings.providers = [
        {
          name = "DSE";
          type = "file";
          options.path = pkgs.linkFarm "grafana-dashboards" (
            map (f: { name = baseNameOf f; path = f; }) [
              ./fpga-dashboard/dashboard.json
              ./fpga-dashboard/switch-dashboard.json
              ./fpga-dashboard/monitoring-dashboard.json
            ]
          );
          options.foldersFromFilesStructure = false;
        }
      ];
    };
  };

  services.nginx.virtualHosts."grafana.dos.cit.tum.de" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:3000";
      proxyWebsockets = true;
      recommendedProxySettings = true;
    };
  };
}
