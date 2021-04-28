{ lib, config, ...}: let
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

    serveBinaryCache = mkOption {
      type = types.bool;
      default = true;
      description = ''
         wether this hosts serve a binary cache on port 5000
      '';
    };
  };
in {
  options = with lib; {
    networking.doctorwho.hosts = mkOption {
      type = with types; attrsOf (submodule [ { options = hostOptions; } ]);
      description = "A host in our cluster";
    };
  };
  config = {
    networking.doctorwho.hosts = {
      amy ={
        ipv4 = "129.215.165.57";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3e:d369";
        linklocal = "fe80:942d:18ab:a4c9::1";
      };
      clara = {
        ipv4 = "129.215.165.58";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3d:70f2";
        linklocal = "fe80:942d:18ab:a4c9::2";
      };
      donna = {
        ipv4 = "129.215.165.54";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4ab8";
        linklocal = "fe80:942d:18ab:a4c9::3";
      };
      martha = {
        ipv4 = "129.215.165.53";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4aba";
        linklocal = "fe80:942d:18ab:a4c9::4";
      };
      rose = {
        ipv4 = "129.215.165.52";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4e4b";
        linklocal = "fe80:942d:18ab:a4c9::5";
      };
      doctor = {
        ipv4 = "129.215.165.108";
        ipv6 = "2001:630:3c1:164:dea6:32ff:fe42:4f99";
        linklocal = "fe80:942d:18ab:a4c9::6";
        serveBinaryCache = false;
      };
      sauron = {
        ipv4 = "129.215.165.75";
        #ipv6 = "2001:630:3c1:164:dea6:32ff:fe42:4f99";
        linklocal = "fe80:942d:18ab:a4c9::7";
      };
      bill = {
        ipv4 = "192.168.32.74";
        #ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4e4b";
        linklocal = "fe80:942d:18ab:a4c9::8";
      };
    };
  };
}
