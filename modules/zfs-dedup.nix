{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.services.zfs-dedup;
  package = inputs.zfs-dedup.packages.${pkgs.stdenv.hostPlatform.system}.zfs-dedup;
in
{
  options.services.zfs-dedup = {
    timer.enable = lib.mkEnableOption "periodic zfs-dedup run over all mounted ZFS datasets";
  };

  config = {
    # available on all ZFS hosts for manual runs
    environment.systemPackages = [ package ];

    systemd.services.zfs-dedup = lib.mkIf cfg.timer.enable {
      description = "Offline ZFS block-level deduplication";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${package}/bin/zfs-dedup";
        Nice = 19;
        IOSchedulingClass = "idle";
        CacheDirectory = "zfs-dedup";
        Environment = "XDG_CACHE_HOME=/var/cache";
      };
    };

    systemd.timers.zfs-dedup = lib.mkIf cfg.timer.enable {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "weekly";
        Persistent = true;
        RandomizedDelaySec = "1h";
      };
    };
  };
}
