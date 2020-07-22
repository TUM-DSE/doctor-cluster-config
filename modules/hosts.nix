{ lib, config, ...}: let
  hostOptions = with lib; {
    ipv4 = mkOption {
      type = types.str;
      description = ''
        own ipv4 address
      '';
    };

    ipv6 = mkOption {
      type = types.str;
      description = ''
        own ipv4 address
      '';
    };

    publicKey = mkOption {
      type = types.str;
      description = ''
        host ssh key scanned with:
        $ ssh-keyscan <ipaddress>
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
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDL+tDNEzC3TEtdgj8wyzczfeYCp1Eyn6qCFXLtQ6l2j";
      };
      clara = {
        ipv4 = "129.215.165.58";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3d:70f2";
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj5G6JkEpkqkhSdsqc4bF7P6gdcFtBAhDPy7yfjzzEZ";
      };
      donna = {
        ipv4 = "129.215.165.54";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4ab8";
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhYAxcXK/Mpbr5/UVC4wr+KYHV4/g5E2A1DQwKZM+kC";
      };
      martha = {
        ipv4 = "129.215.165.53";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4aba";
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEsPUEQKDRKYzW598gBaGzI++7dkRncHJoXgHzvJ1BuA";
      };
      rose = {
        ipv4 = "129.215.165.52";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4e4b";
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoS3y5uq1BbsZjz88os6G+hPVYHLReqO8PKYXh/b0XT";
      };
    };

    # add each of our server to known hosts
    programs.ssh.knownHosts = lib.mapAttrs (name: host: {
      hostNames = [ name "${name}.r" host.ipv4 host.ipv6 ];
      inherit (host) publicKey;
    }) config.networking.doctorwho.hosts;
  };
}
