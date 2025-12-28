{ config, lib, pkgs, ... }:
{
  programs.ccache = {
    enable = true;
    cacheDir = "/var/cache/ccache";
    packageNames = [ "linux" ];
  };

  nix.settings.extra-sandbox-paths = [ config.programs.ccache.cacheDir ];
}
