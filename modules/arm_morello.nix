{
  pkgs,
  lib,
  self,
  ...
}:
let
  linuxPackages = pkgs.recurseIntoAttrs (
    pkgs.linuxPackagesFor self.packages.${pkgs.hostPlatform.system}.linux-morello
  );
in
{
  boot.kernelPackages = lib.mkForce linuxPackages;
}
