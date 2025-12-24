{ pkgs, lib, ... }:
let
  linux_ioregionfd = pkgs.callPackage ../pkgs/kernels/linux-ioregionfd-5.15.nix { };
  linuxPackages_ioregionfd = lib.recurseIntoAttrs (pkgs.linuxPackagesFor linux_ioregionfd);
in
{
  boot.kernelPackages = lib.mkForce linuxPackages_ioregionfd;
}
