{
  imports = [
    ../modules/nspawn-container.nix
    ../modules/borgbackup-repos
    ../modules/buildbot/reverse-proxy.nix
    ../modules/niks3/reverse-proxy.nix
    ../modules/monitoring/prometheus
    ../modules/monitoring/loki.nix
    ../modules/monitoring/telegraf.nix
    ../modules/monitoring/grafana.nix
    ../modules/monitoring/authelia.nix
    # disabled for now since the download is gone
    #../modules/lrz-gitlab-classroom/frontend.nix
  ];

  networking.hostName = "doctor";
  simd.arch = "znver4";

  system.stateVersion = "21.11";
}
