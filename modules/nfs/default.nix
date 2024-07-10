{ lib, ... }:
{
  options = {
    services.nfs-server.interface = lib.mkOption {
      type = lib.types.str;
      example = "enp94s0f0np0";
      description = "The network interface to bind the nfs server to.";
    };
  };
  config = {
    networking.extraHosts = ''
      2a09:80c0:102::f000:0 nfs
      2a09:80c0:102::f000:1 nfs-backup
    '';
  };
}
