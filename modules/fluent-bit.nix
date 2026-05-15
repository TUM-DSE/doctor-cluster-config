{
  config,
  lib,
  pkgs,
  ...
}:
let
  passwordFile = config.sops.secrets.promtail-password.path;

  wasmFilter = pkgs.callPackage ./fluent-bit-filter-go/package.nix {};

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
            name = "wasm";
            match = "journal";
            wasm_path = "${wasmFilter}/lib/fluent_bit_journal_filter.wasm";
            function_name = "go_filter";
            accessible_paths = ".";
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
