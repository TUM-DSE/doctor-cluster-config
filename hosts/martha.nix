{ config, pkgs, lib, ... }:
{
  imports = [
    ../modules/edinburgh/nfs-home.nix
    ../modules/ci.nix
    ../modules/xfstest.nix
    ../modules/eurosys-reviewer.nix
  ];

  networking.hostName = "martha";
  networking.retiolum = {
    ipv4 = "10.243.29.179";
    ipv6 = "42:0:3c46:5466:7dbe:f27a:673f:ea64";
  };

  users.extraUsers.joerg.home = lib.mkForce "/scratch/joerg";

  system.stateVersion = "19.09";
}
