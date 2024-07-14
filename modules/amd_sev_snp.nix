{ pkgs, lib, ... }:
let
  linux = pkgs.callPackage ../pkgs/kernels/linux-sev-snp.nix { };
  linuxPackages = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux);
in
{
  # Configuration for AMD SEV-SNP with AMD versions' kernel

  boot.kernelPackages = lib.mkForce linuxPackages;
  boot.zfs.package = pkgs.zfsUnstable; # needed for 6.9

  boot.kernelParams = [
    #"mem_encrypt=on"
    "kvm_amd.sev=1"
    "kvm_amd.sev_es=1"
    "kvm_amd.sev_snp=1"
    #"kvm.mmio_caching=on"
    "sp5100_tco.blacklist=yes"
  ];

  # enable libvirtd service
  virtualisation.libvirtd.enable = true;
}
