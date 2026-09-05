{
  config,
  lib,
  pkgs,
  ...
}:
let
  # "Temporarily" disabling these tends to stick for months. A pause
  # therefore carries its own end date, checked when the unit runs, so it
  # lapses without anyone remembering to send a PR.
  pauseOption =
    what:
    lib.mkOption {
      type = lib.types.nullOr (lib.types.strMatching "[0-9]{4}-[0-9]{2}-[0-9]{2}");
      default = null;
      example = "2026-10-01";
      description = "Skip ${what} until this date (YYYY-MM-DD, exclusive). Leave a comment saying why.";
    };
  pausedUntil =
    date:
    lib.optionalString (date != null) ''
      if [[ "$(date +%F)" < "${date}" ]]; then
        echo "paused until ${date} by the host configuration, skipping"
        exit 0
      fi
    '';
in
{
  options.dse = {
    autoUpgrade.pauseUntil = pauseOption "switching to the latest master build";
    autoReboot.pauseUntil = pauseOption "the monthly reboot into a new kernel";
  };

  config = {
    # Fetch and apply system updates from buildbot CI
    # Adapted from: https://github.com/nix-community/infra/blob/master/modules/nixos/common/update.nix
    systemd.services.auto-upgrade = {
      restartIfChanged = false;
      unitConfig.X-StopOnRemoval = false;
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = "30s";
        Type = "oneshot";
      };
      path = [
        config.nix.package
        config.systemd.package
        pkgs.coreutils
        pkgs.curl
      ];
      # nixbot publishes under checks.<buildPlatform.system>, not the runtime arch.
      script = ''
        set -euo pipefail
        ${pausedUntil config.dse.autoUpgrade.pauseUntil}
        hostname=$(uname -n)
        p=$(curl -fsSL "https://buildbot.dse.in.tum.de/nix-outputs/github/TUM-DSE/doctor-cluster-config/master/checks.${pkgs.stdenv.buildPlatform.system}.nixos-$hostname")

        if [[ "$(readlink /run/current-system)" == "$p" ]]; then
          echo "Already at $p, nothing to do"
          exit 0
        fi

        echo "Updating to $p"
        nix-store --option narinfo-cache-negative-ttl 0 --realise "$p"
        nix-env --profile /nix/var/nix/profiles/system --set "$p"

        /nix/var/nix/profiles/system/bin/switch-to-configuration switch
      '';
    };

    systemd.timers.auto-upgrade = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitInactiveSec = "1d";
      };
    };

    # Reboot on the last Saturday of each month if kernel changed
    systemd.timers.auto-reboot.timerConfig.RandomizedDelaySec = 60 * 20;

    systemd.services.auto-reboot = {
      path = [
        pkgs.coreutils
        pkgs.systemd
        pkgs.util-linux
      ];
      startAt = "Sat *-*~07/1"; # Last Saturday of the month
      script = ''
        ${pausedUntil config.dse.autoReboot.pauseUntil}
        booted="$(readlink /run/booted-system/{initrd,kernel,kernel-modules})"
        built="$(readlink /nix/var/nix/profiles/system/{initrd,kernel,kernel-modules})"
        if [ "''${booted}" = "''${built}" ]; then
          echo "No kernel update... skipping reboot"
        else
          # reboot in 24 hours
          msg=$(shutdown -r +${toString (60 * 24)} 2>&1)
          echo "$msg" | wall
        fi
      '';
    };

    assertions =
      map
        (u: {
          message = "Do not disable ${u.unit}; set dse.${u.option}.pauseUntil = \"YYYY-MM-DD\" instead so it comes back by itself.";
          assertion = config.systemd.services.${u.unit}.enable && config.systemd.timers.${u.unit}.enable;
        })
        [
          {
            unit = "auto-upgrade";
            option = "autoUpgrade";
          }
          {
            unit = "auto-reboot";
            option = "autoReboot";
          }
        ];
  };
}
