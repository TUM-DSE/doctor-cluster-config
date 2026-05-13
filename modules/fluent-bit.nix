{
  config,
  lib,
  pkgs,
  ...
}:
let
  passwordFile = config.sops.secrets.promtail-password.path;

  labelKeys = [
    "host"
    "unit"
    "coredump_unit"
  ];

  metadataKeys = [
    "priority"
    "syslog_identifier"
    "pid"
    "container_name"
  ];

  luaFilter = pkgs.writeText "fluent-bit-journal.lua" ''
    function process(tag, timestamp, record)
      local msg = record["MESSAGE"]

      -- noise drops (matching the old promtail config)
      if msg ~= nil then
        if string.find(msg, "ignored inotify event for", 1, true)
          or string.find(msg, "PCC check channel failed for ss", 1, true)
          or string.find(msg, "hwmon hwmon1: Undervoltage detected!", 1, true)
          or string.find(msg, "hwmon hwmon1: Voltage normalised", 1, true)
          or string.find(msg, "refused connection: IN=", 1, true)
        then
          return -1, timestamp, record
        end
      end

      -- unit label: fall back to transport (audit/kernel) like promtail did
      local unit = record["_SYSTEMD_UNIT"]
      if unit == nil or unit == "" then
        unit = record["_TRANSPORT"]
      end
      -- collapse session-1234.scope -> session.scope to keep label cardinality low
      if unit ~= nil then
        unit = string.gsub(unit, "^session%-%d+%.scope$", "session.scope")
      end

      -- coredump enrichment so the loki ruler alert keeps firing
      local coredump_unit
      local cgroup = record["COREDUMP_CGROUP"]
      if cgroup ~= nil then
        coredump_unit = string.match(cgroup, "([^/]+)$")
        local exe = record["COREDUMP_EXE"] or "?"
        local uid = record["COREDUMP_UID"] or "?"
        local gid = record["COREDUMP_GID"] or "?"
        local cmd = record["COREDUMP_CMDLINE"] or "?"
        msg = string.format(
          "%s core dumped (user: %s/%s, command: %s)",
          exe, uid, gid, cmd
        )
      end

      local out = {
        MESSAGE = msg,
        host = record["_HOSTNAME"],
        unit = unit,
        coredump_unit = coredump_unit,
        priority = record["PRIORITY"],
        syslog_identifier = record["SYSLOG_IDENTIFIER"],
        pid = record["_PID"],
        container_name = record["CONTAINER_NAME"],
      }
      return 2, timestamp, out
    end
  '';
in
{
  sops.secrets = lib.mkIf (config.users.withSops) {
    promtail-password = {};
    promtail-password.sopsFile = ./secrets.yml;
  };

  services.fluent-bit = {
    enable = config.users.withSops;
    settings = {
      service = {
        flush = 1;
        log_level = "warn";
        http_server = "on";
        http_listen = "127.0.0.1";
        http_port = 9080;
        "storage.path" = "/var/lib/fluent-bit/storage";
        "storage.sync" = "normal";
        "storage.max_chunks_up" = 64;
        "storage.backlog.mem_limit" = "16M";
      };
      pipeline = {
        inputs = [
          {
            name = "systemd";
            tag = "journal";
            db = "/var/lib/fluent-bit/journal.db";
            read_from_tail = "on";
            max_entries = 1000;
            strip_underscores = "off";
            "storage.type" = "filesystem";
          }
        ];
        filters = [
          {
            name = "multiline";
            match = "journal";
            "multiline.key_content" = "MESSAGE";
            "multiline.parser" = "go,python,java";
          }
          {
            name = "lua";
            match = "journal";
            script = "${luaFilter}";
            call = "process";
          }
          {
            name = "throttle";
            match = "journal";
            rate = 200;
            window = 60;
            interval = "1s";
            print_status = false;
          }
        ];
        outputs = [
          {
            name = "loki";
            match = "journal";
            host = "loki.r";
            port = 80;
            uri = "/loki/api/v1/push";
            http_user = "promtail-doctor@thalheim.io";
            http_passwd = "\${LOKI_PASSWORD}";
            labels = "job=systemd-journal";
            label_keys = lib.concatMapStringsSep "," (k: "$" + k) labelKeys;
            structured_metadata = lib.concatMapStringsSep "," (k: "${k}=$" + k) metadataKeys;
            remove_keys = lib.concatStringsSep "," (labelKeys ++ metadataKeys);
            line_format = "key_value";
            drop_single_key = "on";
            "storage.total_limit_size" = "256M";
          }
        ];
      };
    };
  };

  systemd.services.fluent-bit = lib.mkIf (config.users.withSops) {
    serviceConfig = {
      StateDirectory = "fluent-bit";
      RuntimeDirectory = "fluent-bit";
      LoadCredential = "loki-password:${passwordFile}";
      EnvironmentFile = "-/run/fluent-bit/env";
    };
    preStart = ''
      umask 0077
      printf 'LOKI_PASSWORD=%s\n' "$(cat "$CREDENTIALS_DIRECTORY/loki-password")" \
        > /run/fluent-bit/env
    '';
  };
}
