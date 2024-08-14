{config
, lib
, pkgs
, ...
}:
with lib; {
  config = {
    services.elasticsearch = {
      enable = true;
      dataDir = "/scratch/lan/es_home";
      extraConf = ''
        xpack.security.enabled: false
      '';
    };
    environment.systemPackages = with pkgs; [
        elasticsearch
        jdk
    ];
  };
}
# setup with ES_HOME = /scratch/lan/es_home
# then sudo ln -s $(nix eval --raw nixpkgs#jdk)/* /scratch/lan/es_home/jdk/
