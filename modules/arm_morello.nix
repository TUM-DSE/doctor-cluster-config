{
  pkgs,
  lib,
  stdenv,
  ...
}:
let
  linux = pkgs.callPackage ../pkgs/kernels/linux-morello.nix {};
  linuxPackages = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux);
in
{
  boot.kernelPackages = lib.mkForce linuxPackages;
}
