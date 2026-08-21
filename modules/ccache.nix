{ config, pkgs, ... }:
let
  cacheDir = config.programs.ccache.cacheDir;
in
{
  environment.systemPackages = [ pkgs.ccache ];
  nix.settings.extra-sandbox-paths = [ cacheDir ];

  # auto-allocate-uids builds run with uids outside `nixbld`, 
  # so we set it to 1777 and not use programs.ccache.enable.
  systemd.tmpfiles.rules = [ "d ${cacheDir} 1777 root root -" ];
}
