{ pkgs, lib, ... }:
let
  linux = pkgs.callPackage ../pkgs/kernels/linux-svsm-host-wallet.nix { };
  linuxPackages = lib.recurseIntoAttrs (pkgs.linuxPackagesFor linux);
in
{
  # Configuration for AMD SEV-SNP with SVSM support

  boot.kernelPackages = lib.mkForce linuxPackages;

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
