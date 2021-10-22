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

    linklocal = mkOption {
      type = types.str;
      description = ''
        private ipv6 linklocal address (used as fallback)
      '';
    };

    location = mkOption {
      type = types.str;
      description = ''
        Where the server physcally is installed
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
    networking.doctorwho.hosts = {
      amy = {
        ipv4 = "129.215.165.57";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3e:d369";
        linklocal = "fe80:942d:18ab:a4c9::1";
        location = "edinburgh";
      };
      clara = {
        ipv4 = "129.215.165.58";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3d:70f2";
        linklocal = "fe80:942d:18ab:a4c9::2";
        location = "edinburgh";
      };
      donna = {
        ipv4 = "129.215.165.54";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4ab8";
        linklocal = "fe80:942d:18ab:a4c9::3";
        location = "edinburgh";
      };
      martha = {
        ipv4 = "129.215.165.53";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4aba";
        linklocal = "fe80:942d:18ab:a4c9::4";
        location = "edinburgh";
      };
      rose = {
        ipv4 = "129.215.165.52";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4e4b";
        linklocal = "fe80:942d:18ab:a4c9::5";
        location = "edinburgh";
      };
      doctor = {
        ipv4 = "129.215.165.108";
        ipv6 = "2001:630:3c1:164:dea6:32ff:fe42:4f99";
        linklocal = "fe80:942d:18ab:a4c9::6";
        location = "edinburgh";
      };
      sauron = {
        ipv4 = "129.215.165.75";
        #ipv6 = "2001:630:3c1:164:dea6:32ff:fe42:4f99";
        linklocal = "fe80:942d:18ab:a4c9::7";
        location = "edinburgh";
      };
      bill = {
        ipv4 = "131.159.102.1";
        ipv6 = "2a09:80c0:102::1";
        linklocal = "fe80:942d:18ab:a4c9::8";
        location = "munich";
      };
      nardole = {
        ipv4 = "131.159.102.2";
        ipv6 = "2a09:80c0:102::2";
        linklocal = "fe80:942d:18ab:a4c9::9";
        location = "munich";
      };
      yasmin = {
        ipv4 = "131.159.102.7";
        ipv6 = "2a09:80c0:102::7";
        linklocal = "fe80:942d:18ab:a4c9::10";
        location = "munich";
      };

      ryan = {
        ipv4 = "131.159.102.8";
        ipv6 = "2a09:80c0:102::8";
        linklocal = "fe80:942d:18ab:a4c9::12";
        location = "munich";
      };

      graham = {
        ipv4 = "131.159.102.9";
        ipv6 = "2a09:80c0:102::9";
        linklocal = "fe80:942d:18ab:a4c9::11";
        location = "munich";
      };
    };
  };
}
