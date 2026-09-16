{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.services.grading-infrastructure;
  app = inputs.srg-grading.packages.${pkgs.stdenv.hostPlatform.system}.default;
  runner = import ./runner.nix { inherit pkgs inputs; };
  postgres = pkgs.postgresql_18;
  roles = [
    "owner"
    "web"
    "operator"
    "admin"
  ];
  socket = "/run/grading-postgresql";
  staff = builtins.attrNames (
    lib.filterAttrs (_: user: builtins.elem "staff" user.extraGroups) config.users.users
  );
  databaseURL = role: "postgresql://grading_${role}@localhost/grading?host=${socket}";
  hba = pkgs.writeText "grading-pg_hba.conf" ''
    local all postgres peer map=grading
    local grading grading_owner,grading_web,grading_operator,grading_admin peer map=grading
    local all all reject
  '';
  ident = pkgs.writeText "grading-pg_ident.conf" (
    ''
      grading grading-postgres postgres
      grading grading-postgres grading_owner
    ''
    + lib.concatMapStringsSep "\n" (role: "grading grading-${role} grading_${role}") [
      "web"
      "operator"
    ]
    + "\n"
    + lib.concatMapStringsSep "\n" (
      name: "grading ${name} grading_operator\ngrading ${name} grading_admin"
    ) staff
  );
  pgConfig = pkgs.writeText "grading-postgresql.conf" ''
    listen_addresses = ${"''"}
    unix_socket_directories = '${socket}'
    unix_socket_group = 'grading-db'
    unix_socket_permissions = 0770
    hba_file = '${hba}'
    ident_file = '${ident}'
    max_connections = 50
    shared_buffers = '256MB'
  '';
  common = {
    User = "grading-web";
    Group = "grading-data";
    SupplementaryGroups = [ "grading-db" ];
    UMask = "0007";
    NoNewPrivileges = true;
    PrivateTmp = true;
    ProtectSystem = "strict";
    ProtectHome = true;
    ReadWritePaths = [ "/var/lib/grading/artifacts" ];
    Restart = "on-failure";
    RestartSec = "5s";
  };
  appArgs = "--database-url-file /etc/grading/web.url --github-config /run/grading-github/github.json --artifact-dir /var/lib/grading/artifacts";
  dependencies = [
    "grading-migrate.service"
    "grading-github.service"
  ];
in
{
  imports = [
    ./node.nix
    ./executor.nix
    ./proxy.nix
  ];
  options.services.grading-infrastructure.enable = lib.mkEnableOption "SRG grading service";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      app
      pkgs.git
    ];
    environment.variables = {
      GRADING_DATABASE_URL_FILE = lib.mkDefault "/etc/grading/operator.url";
      GRADING_GITHUB_CONFIG = lib.mkDefault "/run/grading-github/github.json";
    };
    environment.extraInit = ''
      export GRADING_RUNNER_IMAGE="$(cat /etc/grading/runner-image)"
    '';
    environment.etc = {
      "grading/runner-image".source = "${runner}/reference";
    }
    // lib.genAttrs (map (r: "grading/${r}.url") roles) (name: {
      text = databaseURL (lib.removeSuffix ".url" (lib.removePrefix "grading/" name)) + "\n";
    });
    users.groups = {
      grading-db.members = staff;
      grading-data.members = staff;
      grading-postgres = { };
      grading-operator.members = staff;
    };
    users.users = {
      grading-postgres = {
        isSystemUser = true;
        uid = 10002;
        group = "grading-postgres";
        extraGroups = [ "grading-db" ];
      };
      grading-web = {
        isSystemUser = true;
        uid = 10001;
        group = "grading-data";
        extraGroups = [ "grading-db" ];
      };
      grading-operator = {
        isSystemUser = true;
        group = "grading-operator";
        extraGroups = [
          "grading-db"
          "grading-data"
        ];
      };
    };
    sops.secrets = {
      "grading-github/github.json".key = "grading-github-config";
      "grading-github/github.json".restartUnits = [ "grading-github.service" ];
      "grading-github/github.pem".key = "grading-github-private-key";
      "grading-github/github.pem".restartUnits = [ "grading-github.service" ];
      "grading-github/webhook".key = "grading-github-webhook-secret";
      "grading-github/webhook".restartUnits = [ "grading-github.service" ];
    };
    services.k3s.manifests.grading-sandboxes.content =
      (import ./kubernetes.nix {
        inherit lib;
        stagingServer = config.networking.doctorwho.currentHost.ipv4;
      }).foundation;
    systemd.services.grading-storage = {
      wantedBy = [ "multi-user.target" ];
      after = [ "zfs-mount.service" ];
      path = [
        config.boot.zfs.package
        pkgs.coreutils
      ];
      script = ''
        if ! zfs list zroot/grading >/dev/null 2>&1; then
          zfs create -o mountpoint=/var/lib/grading zroot/grading
        fi
        for item in postgres:32G:grading-postgres:grading-postgres artifacts:256G:grading-web:grading-data courses:8G:grading-operator:grading-operator; do
          IFS=: read -r name quota owner group <<< "$item"
          if ! zfs list "zroot/grading/$name" >/dev/null 2>&1; then
            zfs create -o quota="$quota" "zroot/grading/$name"
          fi
          zfs set quota="$quota" "zroot/grading/$name"
          chown "$owner:$group" "/var/lib/grading/$name"
          if [ "$name" = postgres ]; then chmod 0700 "/var/lib/grading/$name"
          else chmod 2770 "/var/lib/grading/$name"; fi
        done
      '';
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
    };
    systemd.services.grading-postgresql = {
      wantedBy = [ "multi-user.target" ];
      requires = [ "grading-storage.service" ];
      after = [ "grading-storage.service" ];
      path = [ postgres ];
      preStart = ''
        if [ ! -f /var/lib/grading/postgres/PG_VERSION ]; then
          initdb -D /var/lib/grading/postgres --username=postgres --auth-local=peer --auth-host=reject --encoding=UTF8 --no-locale
        fi
      '';
      postStart = ''
        psql -h ${socket} -U postgres -d postgres -v ON_ERROR_STOP=1 <<'SQL'
        SELECT 'CREATE ROLE ' || quote_ident(role) || ' LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION'
          FROM unnest(ARRAY['grading_owner','grading_web','grading_operator','grading_admin']) AS role
          WHERE NOT EXISTS (SELECT FROM pg_roles WHERE rolname=role) \gexec
        SELECT 'CREATE DATABASE grading OWNER grading_owner' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname='grading') \gexec
        REVOKE ALL ON DATABASE grading FROM PUBLIC;
        GRANT CONNECT ON DATABASE grading TO grading_owner, grading_web, grading_operator, grading_admin;
        SQL
        psql -h ${socket} -U postgres -d grading -v ON_ERROR_STOP=1 <<'SQL'
        REVOKE CREATE ON SCHEMA public FROM PUBLIC;
        ALTER SCHEMA public OWNER TO grading_owner;
        SQL
      '';
      serviceConfig = {
        User = "grading-postgres";
        Group = "grading-db";
        RuntimeDirectory = "grading-postgresql";
        RuntimeDirectoryMode = "0750";
        Type = "notify";
        ExecStart = "${postgres}/bin/postgres -D /var/lib/grading/postgres -c config_file=${pgConfig}";
        KillSignal = "SIGINT";
        TimeoutSec = "5min";
        Restart = "on-failure";
        ProtectSystem = "strict";
        ProtectHome = true;
        PrivateTmp = true;
        NoNewPrivileges = true;
        ReadWritePaths = [ "/var/lib/grading/postgres" ];
      };
    };
    systemd.services.grading-migrate = {
      wantedBy = [ "multi-user.target" ];
      requires = [ "grading-postgresql.service" ];
      after = [ "grading-postgresql.service" ];
      partOf = [ "grading-postgresql.service" ];
      before = [
        "grading-web.service"
        "grading-tasks.service"
        "grading-sync.service"
      ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        User = "grading-postgres";
        Group = "grading-db";
        ExecStart = "${app}/bin/gradingctl --database-url-file /etc/grading/owner.url migrate";
        NoNewPrivileges = true;
        ProtectSystem = "strict";
        ProtectHome = true;
        PrivateTmp = true;
      };
    };
    # Render the key's host path without requiring a change to the existing SOPS JSON.
    systemd.services.grading-github = {
      wantedBy = [ "multi-user.target" ];
      after = [
        "sops-nix.service"
        "grading-storage.service"
      ];
      requires = [ "grading-storage.service" ];
      path = [
        pkgs.jq
        pkgs.coreutils
        pkgs.openssl
      ];
      script = ''
        if [ ! -s /var/lib/grading/worker-token ]; then
          (umask 077; openssl rand -hex 32 > /var/lib/grading/worker-token)
        fi
        chown root:grading-operator /var/lib/grading/worker-token
        chmod 0440 /var/lib/grading/worker-token
        install -m 0440 -o root -g grading-data /run/secrets/grading-github/github.pem /run/grading-github/github.pem
        install -m 0440 -o root -g grading-data /run/secrets/grading-github/webhook /run/grading-github/webhook
        jq '.private_key_file = "/run/grading-github/github.pem"' /run/secrets/grading-github/github.json > /run/grading-github/github.json
        chown root:grading-data /run/grading-github/github.json
        chmod 0440 /run/grading-github/github.json
      '';
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        RuntimeDirectory = "grading-github";
        RuntimeDirectoryMode = "0750";
        Group = "grading-data";
        UMask = "0027";
      };
    };
    systemd.services.grading-web = {
      environment.RUST_LOG = "info";
      wantedBy = [ "multi-user.target" ];
      requires = dependencies;
      after = dependencies;
      partOf = dependencies ++ [ "grading-postgresql.service" ];
      serviceConfig = common // {
        ExecStart = "${app}/bin/grading-web ${appArgs} --listen 127.0.0.1:8080 --internal-listen 127.0.0.1:8081 --public-url https://grading.dos.cit.tum.de --webhook-secret-file /run/grading-github/webhook";
      };
    };
    systemd.services.grading-tasks = {
      wantedBy = [ "multi-user.target" ];
      requires = dependencies;
      after = dependencies;
      partOf = dependencies ++ [ "grading-postgresql.service" ];
      path = [ pkgs.git ];
      serviceConfig = common // {
        ExecStart = "${app}/bin/gradingctl ${appArgs} work";
      };
    };
    systemd.services.grading-sync = {
      requires = dependencies;
      after = dependencies;
      partOf = dependencies ++ [ "grading-postgresql.service" ];
      path = [ pkgs.git ];
      serviceConfig = common // {
        Type = "oneshot";
        User = "grading-operator";
        Restart = "no";
        TimeoutStartSec = "65min";
        ExecStart = "${app}/bin/gradingctl --database-url-file /etc/grading/operator.url --github-config /run/grading-github/github.json sync";
      };
    };
    systemd.timers.grading-sync = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
        RandomizedDelaySec = "10min";
      };
    };
    systemd.services.grading-status = {
      after = [ "grading-web.service" ];
      path = [
        pkgs.coreutils
        pkgs.systemd
        pkgs.curl
        pkgs.gawk
      ];
      script = ''
        fields="last_run=$(date +%s)i"
        for name in postgresql migrate web tasks github sync backup web-provision; do
          result=$(systemctl show "grading-$name.service" --property=Result --value)
          failed=0
          case "$result" in ""|success) ;; *) failed=1 ;; esac
          case "$name" in
            postgresql|web|tasks) if ! systemctl is-active --quiet "grading-$name.service"; then failed=1; fi ;;
          esac
          fields="$fields,''${name//-/_}_failed=''${failed}i"
        done
        age=2147483647
        if [ -f /share/.grading-backup/current/completed ]; then
          age=$(( $(date +%s) - $(stat -c %Y /share/.grading-backup/current/completed) ))
        fi
        fields="$fields,backup_age_seconds=''${age}i"
        printf 'Authorization: Bearer %s\n' "$(cat /var/lib/grading/worker-token)" > /run/grading-status/header
        if curl -fsS --max-time 10 --header @/run/grading-status/header http://127.0.0.1:8081/internal/metrics > /run/grading-status/metrics; then
          fields="$fields,metrics_failed=0i"
          fields="$fields$(awk 'NF == 2 && $1 ~ /^grading_[a-z_]+$/ && $2 ~ /^[0-9]+$/ {sub(/^grading_/, "", $1); printf ",%s=%si", $1, $2}' /run/grading-status/metrics)"
        else fields="$fields,metrics_failed=1i"; fi
        mkdir -p /var/log/telegraf
        printf 'grading %s\n' "$fields" > /var/log/telegraf/grading.new
        chmod 0644 /var/log/telegraf/grading.new
        mv /var/log/telegraf/grading.new /var/log/telegraf/grading
      '';
      serviceConfig = {
        Type = "oneshot";
        RuntimeDirectory = "grading-status";
        RuntimeDirectoryMode = "0700";
        UMask = "0077";
      };
    };
    systemd.timers.grading-status = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5min";
        OnUnitActiveSec = "5min";
      };
    };
    systemd.services.grading-backup = {
      requires = [
        "grading-postgresql.service"
        "nfs-share.service"
      ];
      after = [
        "grading-postgresql.service"
        "nfs-share.service"
      ];
      path = [
        postgres
        pkgs.util-linux
        pkgs.rsync
        pkgs.coreutils
      ];
      script = ''
        umask 077
        mountpoint -q /share
        install -d -m 0700 /share/.grading-backup
        staging=$(mktemp -d /share/.grading-backup/incoming.XXXXXX)
        trap 'rm -rf "$staging"' EXIT
        runuser -u grading-postgres -- pg_dump -h ${socket} -U postgres -Fc grading > "$staging/database.dump"
        for dir in artifacts courses; do
          rsync -a /var/lib/grading/"$dir"/ "$staging/$dir/"
        done
        rsync -aL /run/secrets/grading-github/ "$staging/github/"
        rsync -a /var/lib/grading-tls/ "$staging/tls/"
        cp /var/lib/grading/worker-token "$staging/worker-token"
        date -u +%FT%TZ > "$staging/completed"
        rm -rf /share/.grading-backup/previous
        if [ -d /share/.grading-backup/current ]; then mv /share/.grading-backup/current /share/.grading-backup/previous; fi
        mv "$staging" /share/.grading-backup/current
      '';
      serviceConfig = {
        Type = "oneshot";
        UMask = "0077";
      };
    };
    systemd.timers.grading-backup = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 02:00:00";
        Persistent = true;
        RandomizedDelaySec = "10min";
      };
    };
  };
}
