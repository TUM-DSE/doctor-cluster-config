{
  lib,
  config,
  pkgs,
  ...
}:
{
  services.postgresql.enable = true;
  # Keep the current major version until the data directory has been migrated
  # with upgrade-pg-cluster below. Bump this to postgresql_18 afterwards.
  services.postgresql.package = pkgs.postgresql_14;
  services.postgresqlBackup.enable = true;

  environment.systemPackages = [
    (
      let
        # Target version for the next major upgrade.
        newPostgres = pkgs.postgresql_18;
        cfg = config.services.postgresql;
      in
      pkgs.writeScriptBin "upgrade-pg-cluster" ''
        set -eux
        # Stop everything that talks to postgresql first.
        systemctl stop postgresql

        export NEWDATA="/var/lib/postgresql/${newPostgres.psqlSchema}"
        export NEWBIN="${newPostgres}/bin"

        export OLDDATA="${cfg.dataDir}"
        export OLDBIN="${cfg.package}/bin"

        install -d -m 0700 -o postgres -g postgres "$NEWDATA"
        cd "$NEWDATA"
        # postgresql_18 enables data checksums by default; the old cluster
        # was created without them, so disable to keep pg_upgrade happy.
        sudo -u postgres "$NEWBIN/initdb" -D "$NEWDATA" ${lib.escapeShellArgs cfg.initdbArgs}

        sudo -u postgres "$NEWBIN/pg_upgrade" \
          --old-datadir "$OLDDATA" --new-datadir "$NEWDATA" \
          --old-bindir "$OLDBIN" --new-bindir "$NEWBIN" \
          "$@"
      ''
    )
  ];
}
