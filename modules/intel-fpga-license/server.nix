# FlexNet license server for the Intel FPGA floating licenses
# (docs/intel-fpgas.md). Runs lmgrd and its vendor daemons from the Quartus
# installation on /share; they are plain glibc binaries started through nix-ld.
{
  config,
  lib,
  pkgs,
  ...
}:
let
  settings = import ./settings.nix;
  flexlm = "${settings.toolsRoot}/${settings.flexlmVersion}/flexlm";
  mgcld = "${settings.toolsRoot}/${settings.mgcldVersion}/questa_fse/linux_x86_64/mgcld";

  # Altera issues the files with placeholders that the site fills in. Write
  # filled-in copies to the runtime directory instead of editing the originals,
  # and keep the license keys out of the Nix store.
  licenseFiles = pkgs.writeShellApplication {
    name = "intel-fpga-license-files";
    runtimeInputs = [
      pkgs.coreutils
      pkgs.gnused
      pkgs.gnugrep
    ];
    text = ''
      out="$RUNTIME_DIRECTORY/licenses"
      rm -rf "$out"
      mkdir -p "$out"
      for file in ${lib.escapeShellArgs settings.licenseFiles}; do
        # The files come with a byte order mark and CRLF line endings.
        sed \
          -e '1s/^\xEF\xBB\xBF//' \
          -e 's/\r$//' \
          -e 's|^SERVER <hostname> \([0-9A-Fa-f]*\) <port number>|SERVER this_host \1 ${toString settings.lmgrdPort}|' \
          -e 's|^VENDOR alterad <path to daemon executable>|VENDOR alterad ${flexlm}/alterad PORT=${toString settings.alteradPort}|' \
          -e 's|^VENDOR mgcld <path to daemon executable>|VENDOR mgcld ${mgcld} PORT=${toString settings.mgcldPort}|' \
          "${settings.licenseDir}/$file" > "$out/''${file%.dat}.lic"
        if grep -q '^\(SERVER\|VENDOR\).*<' "$out/''${file%.dat}.lic"; then
          echo "unexpected placeholder left in $file" >&2
          exit 1
        fi
      done
    '';
  };
in
{
  assertions = [
    {
      assertion = config.networking.hostName == settings.serverHost;
      message = "the Intel FPGA floating licenses are bound to ${settings.serverHost}";
    }
    {
      assertion = config.programs.nix-ld.enable;
      message = "lmgrd and the vendor daemons need nix-ld";
    }
  ];

  systemd.services.intel-fpga-license-server = {
    description = "FlexNet license server for the Intel FPGA floating licenses";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [
      "network-online.target"
      "remote-fs.target"
    ];
    unitConfig.RequiresMountsFor = [
      settings.toolsRoot
      settings.licenseDir
    ];
    serviceConfig = {
      DynamicUser = true;
      RuntimeDirectory = "intel-fpga-license-server";
      # alterad creates its diagnostics socket in the working directory.
      WorkingDirectory = "%t/intel-fpga-license-server";
      # Also hides the lock files in /var/tmp from other users.
      PrivateTmp = true;
      ExecStartPre = lib.getExe licenseFiles;
      # -z stays in the foreground and logs to the journal.
      ExecStart = "${flexlm}/lmgrd -z -c %t/intel-fpga-license-server/licenses";
      Restart = "on-failure";
      RestartSec = 10;
    };
  };

  # The firewall is disabled on the cluster; this documents the ports in case
  # that changes.
  networking.firewall.allowedTCPPorts = [
    settings.lmgrdPort
    settings.alteradPort
    settings.mgcldPort
  ];
}
