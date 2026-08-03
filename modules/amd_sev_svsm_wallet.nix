{ pkgs, lib, ... }:
let
  linux = pkgs.callPackage ../pkgs/kernels/linux-svsm-host-wallet.nix { };
  linuxPackages = lib.recurseIntoAttrs (
    (pkgs.linuxPackagesFor linux).extend (
      _final: prev: {
        # Kernel modules inherit the kernel's gcc13 stdenv (see
        # linux-svsm-host-wallet.nix), but sysdig's userland half links
        # gcc15-built libraries (onetbb), which needs the matching
        # libstdc++. The kmod part still gets -std=gnu11 from Kbuild.
        sysdig = prev.sysdig.override { stdenv = pkgs.stdenv; };
      }
    )
  );
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
