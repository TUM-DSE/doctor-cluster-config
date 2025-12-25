{ pkgs, lib, ... }:
let
  linux = pkgs.callPackage ../pkgs/kernels/linux-pkvm.nix { };
  linuxPackages = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux);
in
{
  boot.kernelPackages = lib.mkForce linuxPackages;
  boot.zfs.package = pkgs.zfs_unstable; # needed for 6.18

  boot.kernelParams = [
    "kvm_intel.pkvm=1"
  ];

  virtualisation.libvirtd.enable = true;
}
