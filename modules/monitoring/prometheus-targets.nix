# Prometheus HTTP Service Discovery target definitions
# These are exported as JSON via the flake and published as a GitHub release.
# Both prometheus instances (doctor-cluster and dotfiles/eva) can fetch this
# using http_sd_configs.
{
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
        "river"
        "rose"
        # currently turned off
        #"ruby"
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
