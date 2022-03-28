{
  lib,
  config,
  ...
}: let
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

    location = mkOption {
      type = types.str;
      description = ''
        Where the server physcally is installed
      '';
    };
  };
in {
  options = with lib; {
    networking.doctorwho.hosts = mkOption {
      type = with types; attrsOf (submodule [{options = hostOptions;}]);
      description = "A host in our cluster";
    };
    networking.doctorwho.currentHost = mkOption {
      type = with types; submodule [{options = hostOptions;}];
      default = config.networking.doctorwho.hosts.${config.networking.hostName};
      description = "The host that is described by this configuration";
    };
  };
  config = {
    warnings =
      lib.optional (!(config.networking.doctorwho.hosts ? ${config.networking.hostName}))
      "no network configuration for ${config.networking.hostName} found in ${./hosts.nix}";

    networking.doctorwho.hosts = {
      amy = {
        ipv4 = "129.215.165.57";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3e:d369";
        location = "edinburgh";
      };
      astrid = {
        ipv4 = "131.159.102.11";
        ipv6 = "2a09:80c0:102::11";
        location = "munich";
      };
      clara = {
        ipv4 = "129.215.165.58";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3d:70f2";
        location = "edinburgh";
      };
      dan = {
        ipv4 = "131.159.102.12";
        ipv6 = "2a09:80c0:102::12";
        location = "munich";
      };
      donna = {
        ipv4 = "129.215.165.54";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4ab8";
        location = "edinburgh";
      };
      martha = {
        ipv4 = "129.215.165.53";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4aba";
        location = "edinburgh";
      };
      rose = {
        ipv4 = "129.215.165.52";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4e4b";
        location = "edinburgh";
      };
      doctor = {
        ipv4 = "129.215.165.108";
        ipv6 = "2001:630:3c1:164:dea6:32ff:fe42:4f99";
        location = "edinburgh";
      };
      sauron = {
        ipv4 = "129.215.165.75";
        #ipv6 = "2001:630:3c1:164:dea6:32ff:fe42:4f99";
        location = "edinburgh";
      };
      bill = {
        ipv4 = "131.159.102.1";
        ipv6 = "2a09:80c0:102::1";
        location = "munich";
      };
      mickey = {
        ipv4 = "131.159.102.10";
        ipv6 = "2a09:80c0:102::10";
        location = "munich";
      };
      nardole = {
        ipv4 = "131.159.102.2";
        ipv6 = "2a09:80c0:102::2";
        location = "munich";
      };
      yasmin = {
        ipv4 = "131.159.102.7";
        ipv6 = "2a09:80c0:102::7";
        location = "munich";
      };

      ryan = {
        ipv4 = "131.159.102.8";
        ipv6 = "2a09:80c0:102::8";
        location = "munich";
      };

      graham = {
        ipv4 = "131.159.102.9";
        ipv6 = "2a09:80c0:102::9";
        location = "munich";
      };
    };
  };
}
