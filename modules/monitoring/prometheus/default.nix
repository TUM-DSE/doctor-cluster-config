{ config, ... }:
{
  sops.secrets.alertmanager = { };

  imports = [
    ./nginx.nix
    ./rules.nix
  ];

  services.prometheus = {
    enable = true;
    webExternalUrl = "https://prometheus.dos.cit.tum.de";
    scrapeConfigs = [
      {
        job_name = "telegraf";
        scrape_interval = "60s";
        metrics_path = "/metrics";
        static_configs = [
          {
            targets = map (host: "${host}.r:9273") [
              # university
              "ace"
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
              "river"
              "rose"
              "ruby"
              "ryan"
              "tegan"
              "vislor"
              "wilfred"
              "xavier"
              "yasmin"
            ];

            labels.org = "uni";
          }
        ];
      }
    ];
    alertmanagers = [ { static_configs = [ { targets = [ "localhost:9093" ]; } ]; } ];
  };
  services.prometheus.alertmanager = {
    enable = true;
    environmentFile = config.sops.secrets.alertmanager.path;
    webExternalUrl = "https://alertmanager.dos.cit.tum.de";
    listenAddress = "[::1]";
    # FIXME: can be dropped when upgrading to 23.11
    extraFlags = [ "--cluster.listen-address= " ];
    configuration = {
      route = {
        receiver = "default";
        routes = [
          {
            group_by = [ "host" ];
            group_wait = "30s";
            group_interval = "2m";
            repeat_interval = "2h";
            receiver = "default";
          }
        ];
      };
      receivers = [ { name = "default"; } ];
    };
  };
}
