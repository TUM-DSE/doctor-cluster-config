{ pkgs, ... }:

{
  imports = [
    ./server-collector.nix
  ];

  # Grafana service
  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "127.0.0.1";
        http_port = 3000;
        domain = "grafana.dos.cit.tum.de";
      };
      security = {
        disable_gravatar = true;
      };
      users = {
        allow_sign_up = false;
        allow_org_create = false;
        viewers_can_edit = false;
        home_page = "/d/f833d9a0-24ed-4808-bc90-a874dc9173f3/dse-fpga";
      };
      analytics = {
        reporting_enabled = false;
        check_for_updates = false;
        check_for_plugin_updates = false;
      };
      explore.enabled = false;
      alerting.enabled = false;
      unified_alerting.enabled = false;
      snapshots.external_enabled = false;
      news.news_feed_enabled = false;
      panels.disable_sanitize_html = false;
      "auth.anonymous" = {
        enabled = true;
        org_role = "Viewer";
      };
      auth.disable_login_form = false;
      auth.disable_signout_menu = false;
    };

    declarativePlugins = with pkgs.grafanaPlugins; [
      yesoreyeram-infinity-datasource
    ];

    provision = {
      enable = true;

      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          url = "http://127.0.0.1:9090";
          isDefault = true;
          editable = false;
        }
        {
          name = "Infinity";
          type = "yesoreyeram-infinity-datasource";
          uid = "bffhp1y5wgkjke";
          editable = false;
        }
      ];

      dashboards.settings.providers = [
        {
          name = "FPGA Dashboard";
          type = "file";
          options.path = ./dashboard.json;
          options.foldersFromFilesStructure = false;
        }
      ];
    };
  };

  # Local Prometheus instance scraping node-exporters
  services.prometheus = {
    enable = true;
    listenAddress = "127.0.0.1";
    port = 9090;
    globalConfig = {
      scrape_interval = "10s";
    };
    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets = [ "localhost:9100" ];
            labels.host = "Clara";
          }
          {
            targets = [ "amy:9100" ];
            labels.host = "Amy";
          }
          {
            targets = [ "rose:9100" ];
            labels.host = "Rose";
          }
          {
            targets = [ "christina:9100" ];
            labels.host = "Christina";
          }
        ];
      }
    ];
  };

  # Nginx reverse proxy for Grafana (HTTP on port 80)
  services.nginx = {
    enable = true;
    virtualHosts."grafana-local" = {
      listen = [
        { addr = "0.0.0.0"; port = 80; }
        { addr = "[::]"; port = 80; }
      ];
      serverName = "grafana.dos.cit.tum.de clara.i clara 131.159.102.22";
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000";
        proxyWebsockets = true;
        recommendedProxySettings = true;
      };
    };
  };
}
