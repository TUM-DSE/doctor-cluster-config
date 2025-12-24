{ pkgs, lib, ... }:
let
  linux = pkgs.callPackage ../pkgs/kernels/linux-tdx.nix { };
  linuxPackages = lib.recurseIntoAttrs (pkgs.linuxPackagesFor linux);
in
{
  # Configuration for Intel TDX

  boot.kernelPackages = lib.mkForce linuxPackages;
  boot.zfs.package = pkgs.zfs_unstable; # needed for 6.9

  boot.kernelParams = [
    "kvm_intel.tdx=1"
    # TDX cannot survive from S3 and deeper states
    "nohibernate"
  ];

  # enable libvirtd service
  virtualisation.libvirtd.enable = true;
}
