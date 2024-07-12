{ lib, config, ... }:
let
  hostOptions = with lib; {
    ipv4 = mkOption {
      type = types.str;
      description = ''
        own ipv4 address
      '';
    };

    ipv6 = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        own ipv4 address
      '';
    };

    mac = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        MAC address of the NIC port used as a gateway
      '';
    };
  };
in
{
  options = with lib; {
    networking.doctorwho.hosts = mkOption {
      type = with types; attrsOf (submodule [{ options = hostOptions; }]);
      description = "A host in our cluster";
    };
    networking.doctorwho.currentHost = mkOption {
      type = with types; submodule [{ options = hostOptions; }];
      default = config.networking.doctorwho.hosts.${config.networking.hostName};
      description = "The host that is described by this configuration";
    };
  };
  config = {
    warnings =
      lib.optional (!(config.networking.doctorwho.hosts ? ${config.networking.hostName}) && 
        config.networking.hostName != "nixos" # we dont care about nixos netboot/installer images
      )
        "Please add network configuration for ${config.networking.hostName}. None found in ${./hosts.nix}";

    # usually, for each host there is a hostname.dos.cit.tum.de and hostname.r domain
    # TODO add all macs:
    networking.doctorwho.hosts = {
      astrid = {
        ipv4 = "131.159.102.11";
        ipv6 = "2a09:80c0:102::11";
      };
      bill = {
        ipv4 = "131.159.102.1";
        ipv6 = "2a09:80c0:102::1";
      };
      dan = {
        ipv4 = "131.159.102.12";
        ipv6 = "2a09:80c0:102::12";
      };
      mickey = {
        ipv4 = "131.159.102.10";
        ipv6 = "2a09:80c0:102::10";
      };
      nardole = {
        ipv4 = "131.159.102.2";
        ipv6 = "2a09:80c0:102::2";
      };
      yasmin = {
        ipv4 = "131.159.102.7";
        ipv6 = "2a09:80c0:102::7";
      };
      ryan = {
        ipv4 = "131.159.102.8";
        ipv6 = "2a09:80c0:102::8";
      };
      graham = {
        ipv4 = "131.159.102.9";
        ipv6 = "2a09:80c0:102::9";
        mac = "2c:ea:7f:af:57:18";
      };
      christina = {
        ipv4 = "131.159.102.14";
        ipv6 = "2a09:80c0:102::14";
      };
      jackson = {
        ipv4 = "131.159.102.3";
        ipv6 = "2a09:80c0:102::3";
      };
      adelaide = {
        ipv4 = "131.159.102.13";
        ipv6 = "2a09:80c0:102::13";
      };
      wilfred = {
        ipv4 = "131.159.102.15";
        ipv6 = "2a09:80c0:102::15";
        mac = "00:1b:21:c3:82:2c";
      };
      river = {
        ipv4 = "131.159.102.16";
        ipv6 = "2a09:80c0:102::16";
      };
      jack = {
        ipv4 = "131.159.102.17";
        ipv6 = "2a09:80c0:102::17";
      };
      amy = {
        ipv4 = "131.159.102.20";
        ipv6 = "2a09:80c0:102::20";
      };
      clara = {
        ipv4 = "131.159.102.22";
        ipv6 = "2a09:80c0:102::22";
      };
      rose = {
        ipv4 = "131.159.102.21";
        ipv6 = "2a09:80c0:102::21";
      };
      vislor = {
        ipv4 = "131.159.102.25";
        ipv6 = "2a09:80c0:102::25";
      };
      # {loki, grafana, prometheus, alertmanager}.dos.cit.tum.de and vmbhatotia43.in.tum.de
      doctor = {
        ipv4 = "131.159.102.4";
        ipv6 = "2a09:80c0:102::4";
      };
      # ruby.dos.cit.tum.de
      ruby = {
        ipv4 = "131.159.38.70";
        ipv6 = "2a09:80c0:38::70";
      };
      tegan = {
        ipv4 = "131.159.38.2";
        ipv6 = "2a09:80c0:38::2";
      };
      #vicky = {
      #  ipv4 = "131.159.102.?";
      #  ipv6 = "2a09:80c0:102::?";
      #};
      xavier = {
        ipv4 = "131.159.102.27";
        ipv6 = "2a09:80c0:102::27";
      };
    };
  };
}
