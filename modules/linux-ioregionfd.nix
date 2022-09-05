{ pkgs, lib, ...}: let 
  linux_ioregionfd = pkgs.callPackage ../pkgs/linux-ioregionfd.nix { };
  linuxPackages_ioregionfd = pkgs.recurseIntoAttrs 
    (pkgs.linuxPackagesFor linux_ioregionfd);
in {
  boot.kernelPackages = lib.mkForce linuxPackages_ioregionfd;
}
