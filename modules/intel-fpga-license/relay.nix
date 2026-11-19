# Lets sandboxed Nix builds check out Intel FPGA floating licenses
# (docs/intel-fpgas.md).
#
# FlexNet clients talk TCP to the license server, but a sandboxed build has no
# network. Each server port is exposed as a Unix socket in relayDir, which the
# sandbox includes. fpga-nix's licenseRelay listens on 127.0.0.1 inside the
# build and forwards to these sockets.
{ config, lib, ... }:
let
  settings = import ./settings.nix;
  ports = [
    settings.lmgrdPort
    settings.alteradPort
    settings.mgcldPort
  ];
  name = port: "intel-fpga-license-relay-${toString port}";
in
{
  systemd.sockets = lib.listToAttrs (
    map (
      port:
      lib.nameValuePair (name port) {
        description = "Relay to the Intel FPGA license server, port ${toString port}";
        wantedBy = [ "sockets.target" ];
        socketConfig = {
          ListenStream = "${settings.relayDir}/${toString port}.sock";
          # Builds run as nixbld users.
          SocketMode = "0666";
        };
      }
    ) ports
  );

  systemd.services = lib.listToAttrs (
    map (
      port:
      lib.nameValuePair (name port) {
        description = "Relay to the Intel FPGA license server, port ${toString port}";
        requires = [ "${name port}.socket" ];
        after = [ "${name port}.socket" ];
        serviceConfig = {
          ExecStart = "${config.systemd.package}/lib/systemd/systemd-socket-proxyd ${settings.serverName}:${toString port}";
          DynamicUser = true;
          PrivateTmp = true;
        };
      }
    ) ports
  );

  # The Quartus installations and the relay. nixbot is not a trusted user, so
  # the FPGA flakes' nixConfig does not apply. The "?" keeps other builds
  # working while /share is not mounted or the relay is not set up.
  nix.settings.extra-sandbox-paths = [
    "${settings.toolsRoot}?"
    "${settings.relayDir}?"
  ];
}
