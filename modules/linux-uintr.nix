{ pkgs, lib, ... }:
let
  linux_uintr = pkgs.callPackage ../pkgs/kernels/linux-uintr.nix { };
  linuxPackages_uintr = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_uintr);
in
{
  boot.kernelPackages = lib.mkForce linuxPackages_uintr;
}
