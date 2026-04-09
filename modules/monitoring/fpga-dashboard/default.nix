{ pkgs, lib, ... }:

let
  monitoredHosts = [
    "adelaide"
    "amy"
    "astrid"
    "christina"
    "clara"
    "dan"
    "doctor"
    "donna"
    "graham"
    "ian"
    "irene"
    "jack"
    "jackson"
    "mickey"
    "polly"
    "river"
    "rose"
    "ryan"
    "steve"
    "tegan"
    "vislor"
    "wilfred"
    "xavier"
    "yasmin"
  ];
in
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
      marcusolsson-dynamictext-panel
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
        {
          name = "Switch Dashboard";
          type = "file";
          options.path = ./switch-dashboard.json;
          options.foldersFromFilesStructure = false;
        }
        {
          name = "Monitoring Dashboard";
          type = "file";
          options.path = ./monitoring-dashboard.json;
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
      {
        job_name = "telegraf";
        scrape_interval = "60s";
        static_configs = [
          {
            targets = map (host: "${host}:9273") monitoredHosts;
          }
        ];
      }
    ];
  };

  # Telegraf ping and SSH checks for all monitored hosts
  services.telegraf.extraConfig.inputs.ping = map (host: {
    method = "native";
    urls = [ "6.${host}.r" ];
    ipv6 = true;
    count = 3;
    tags = {
      inherit host;
    };
  }) monitoredHosts;

  services.telegraf.extraConfig.inputs.net_response = map (host: {
    protocol = "tcp";
    address = "${host}.r:22";
    send = "SSH-2.0-Telegraf";
    expect = "SSH-2.0";
    timeout = "10s";
    tags = {
      host = "${host}.r";
    };
  }) monitoredHosts;

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
