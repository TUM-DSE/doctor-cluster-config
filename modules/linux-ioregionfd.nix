{ pkgs, lib, ...}: let 
  linux_ioregionfd = pkgs.callPackage ../pkgs/kernels/linux-ioregionfd-5.14.nix { };
  linuxPackages_ioregionfd = pkgs.recurseIntoAttrs 
    (pkgs.linuxPackagesFor linux_ioregionfd);
in {
  boot.kernelPackages = lib.mkForce linuxPackages_ioregionfd;
}
