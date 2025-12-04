{ pkgs, lib, ... }:
let
  linux = pkgs.callPackage ../pkgs/kernels/linux-tdx.nix { };
  linuxPackages = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux);
in
{
  # Configuration for Intel TDX

  boot.kernelPackages = lib.mkForce linuxPackages;
  boot.zfs.package = pkgs.zfsUnstable; # needed for 6.9

  boot.kernelParams = [
    "kvm_intel.tdx=1"
    "kvm_intel.pkvm=1"
    # TDX cannot survive from S3 and deeper states
    "nohibernate"
  ];

  # enable libvirtd service
  virtualisation.libvirtd.enable = true;
}
