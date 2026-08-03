{ pkgs, lib, ... }:
{
  # Use 6.18 kernel with KVM certificate patches for SNP
  # These kernel patches are upstream in 6.20 kvm-next
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_18;
  boot.zfs.package = pkgs.zfs_unstable; # needed for 6.9

  boot.kernelPatches = [
      {
        name = "amd_sme-config";
        patch = null;
        extraConfig = ''
          AMD_MEM_ENCRYPT y
          CRYPTO_DEV_CCP y
          CRYPTO_DEV_CCP_DD m
          CRYPTO_DEV_SP_PSP y
          KVM_AMD_SEV y
          VFIO_DEVICE_CDEV y
        '';
      }
      {
        name = "KVM-Introduce-KVM_EXIT_SNP_REQ_CERTS";
        patch = ./patches/0001-KVM-Introduce-KVM_EXIT_SNP_REQ_CERTS-for-SNP-certifi.patch;
      }
      {
        name = "KVM-SEV-Add-KVM_SEV_SNP_ENABLE_REQ_CERTS";
        patch = ./patches/0002-KVM-SEV-Add-KVM_SEV_SNP_ENABLE_REQ_CERTS-command.patch;
      }
  ];

  boot.kernelParams = [
    #"mem_encrypt=on"
    "kvm_amd.sev=1"
    "kvm_amd.sev_es=1"
    "kvm_amd.sev_snp=1"
    #"kvm.mmio_caching=on"
    "sp5100_tco.blacklist=yes"

    # this parameter exists on 6.9-
    "kvm.gmem_2m_enabled=1"
  ];

  # enable libvirtd service
  virtualisation.libvirtd.enable = true;
}
