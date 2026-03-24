{ pkgs, ... }:

let
  serverCollectorScript = ./server_collector.sh;
  serverCollectorLoop = pkgs.writeShellScript "server-collector-loop" ''
    while true; do
      ${serverCollectorScript} 2>/dev/null
      sleep 10
    done
  '';
in
{
  # node-exporter with textfile collector
  services.prometheus.exporters.node = {
    enable = true;
    enabledCollectors = [ "textfile" ];
    extraFlags = [
      "--collector.textfile.directory=/var/lib/node_exporter/textfile_collector"
    ];
  };

  # Create textfile collector directory with correct permissions
  systemd.tmpfiles.rules = [
    "d /var/lib/node_exporter/textfile_collector 0777 root root -"
  ];

  # Server metrics collector service
  systemd.services.server-collector = {
    description = "FPGA Server Metrics Collector";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    path = with pkgs; [ bash coreutils procps gnugrep gawk util-linux pciutils lsof ];
    serviceConfig = {
      ExecStart = serverCollectorLoop;
      Restart = "always";
      RestartSec = 5;
    };
  };
}
