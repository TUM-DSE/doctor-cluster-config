{ config, lib, ... }:
let
  report = ../hosts + "/${config.networking.hostName}-facter.json";
in
{
  hardware.facter.reportPath = lib.mkIf (builtins.pathExists report) report;
}
