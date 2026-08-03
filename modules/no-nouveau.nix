{ lib, pkgs, ... }:
{
  boot.blacklistedKernelModules = [ "nouveau" ];
}
