{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-120U-TNR.nix
    ../modules/nfs/client.nix
    ../modules/dax.nix
  ];

  networking.hostName = "jack";

  system.stateVersion = "21.11";
}
