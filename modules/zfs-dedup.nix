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
    timer.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.boot.zfs.enabled;
      defaultText = lib.literalExpression "config.boot.zfs.enabled";
      description = "Periodic zfs-dedup run over all mounted ZFS datasets";
    };
  };

  config = {
    # available on all ZFS hosts for manual runs
    environment.systemPackages = lib.mkIf config.boot.zfs.enabled [ package ];

    systemd.services.zfs-dedup = lib.mkIf cfg.timer.enable {
      description = "Offline ZFS block-level deduplication";
      path = [ config.boot.zfs.package ];
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
