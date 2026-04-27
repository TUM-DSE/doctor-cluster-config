{ pkgs, ... }:

let
  pythonEnv = pkgs.python3.withPackages (ps: [ ps.pyserial ps.pexpect ]);
  switchCollectorScript = ./switch_collector.py;
  switchCollectorLoop = pkgs.writeShellScript "switch-collector-loop" ''
    while true; do
      # Clear any stale picocom lock from a crashed previous run
      rm -f /var/lock/LCK..ttyUSB0

      # Hard timeout: if the script hangs (serial stuck, login loop), kill it
      # so the outer loop can retry. 120s is well under the 300s cadence.
      timeout --kill-after=10s 120s \
        ${pythonEnv}/bin/python3 ${switchCollectorScript} 2>&1 | logger -t switch-collector
      sleep 300
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

  # Switch metrics collector service
  systemd.services.switch-collector = {
    description = "Adric N8550-32C Switch Metrics Collector";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    path = with pkgs; [ picocom coreutils ];
    serviceConfig = {
      ExecStart = switchCollectorLoop;
      Restart = "always";
      RestartSec = 10;
      # Needs access to /dev/ttyUSB0
      SupplementaryGroups = [ "dialout" ];
    };
  };

  # Ensure serial device is accessible
  services.udev.extraRules = ''
    SUBSYSTEM=="tty", ATTRS{idVendor}=="*", GROUP="dialout", MODE="0660"
  '';
}
