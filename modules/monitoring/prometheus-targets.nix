# Prometheus HTTP Service Discovery target definitions
# These are exported as JSON via the flake and published as a GitHub release.
# Both prometheus instances (doctor-cluster and dotfiles/eva) can fetch this
# using http_sd_configs.
let
  farm = import ../nix-farm/settings.nix;
in
{
  # Build farm (docs/nix-farm.md): the daemons and the balancer's envoy.
  nix-farm = [
    {
      targets = map (host: "${host}.r:${toString farm.metricsPort}") [
        "eliza"
        "graham"
        "irene"
        "polly"
      ];
    }
    {
      targets = [ "${farm.lbHost}.r:${toString farm.lbMetricsPort}" ];
      labels.__metrics_path__ = "/stats/prometheus";
    }
  ];

  # Prometheus HTTP SD format: list of target groups
  # Each group has "targets" (list of host:port) and optional "labels" (attrset)
  telegraf = [
    {
      targets = map (host: "${host}.r:9273") [
        # university machines
        # runs debian at the moment
        #"ace"
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
        # currently turned off
        #"ruby"
        "ryan"
        "steve"
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
