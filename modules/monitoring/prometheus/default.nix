{ config
, lib
, pkgs
, ...
}:
{
  sops.secrets.alertmanager = { };

  imports = [
    ./nginx.nix
  ];

  services.prometheus = {
    enable = true;
    # checks fail because of missing secrets in the sandbox
    checkConfig = false;
    ruleFiles = [
      (pkgs.writeText "prometheus-rules.yml" (builtins.toJSON {
        groups = [
          {
            name = "alerting-rules";
            rules = import ./alert-rules.nix { inherit lib; };
          }
        ];
      }))
    ];
    webExternalUrl = "https://prometheus.dse.in.tum.de";
    scrapeConfigs = [
      {
        job_name = "telegraf";
        scrape_interval = "60s";
        metrics_path = "/metrics";
        static_configs = [
          {
            targets = map (host: "${host}.r:9273") [
              # university
              "astrid"
              "dan"
              "mickey"
              "bill"
              "nardole"
              "yasmin"
              "ryan"
              "graham"

              "astrid"
              "dan"
              "mickey"

              "jackson"
              "christina"
              "adelaide"
              "wilfred"
              "river"
              "jack"

              "ruby"
            ];

            labels.org = "uni";
          }
        ];
      }
    ];
    alertmanagers = [
      {
        static_configs = [
          { targets = [ "localhost:9093" ]; }
        ];
      }
    ];
  };
  services.prometheus.alertmanager = {
    enable = true;
    environmentFile = config.sops.secrets.alertmanager.path;
    webExternalUrl = "https://alertmanager.thalheim.io";
    listenAddress = "[::1]";
    configuration = {
      route = {
        receiver = "default";
        routes = [
          {
            group_by = [ "host" ];
            group_wait = "30s";
            group_interval = "2m";
            repeat_interval = "2h";
            receiver = "all";
          }
        ];
      };
      receivers = [
        {
          name = "all";
          pushover_configs = [
            {
              user_key = "$PUSHOVER_USER_KEY";
              token = "$PUSHOVER_TOKEN";
              priority = "0";
            }
          ];
        }
        {
          name = "default";
        }
      ];
    };
  };
}
