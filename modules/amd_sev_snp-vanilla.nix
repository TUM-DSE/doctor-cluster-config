{ pkgs, lib, ... }:
{
  # Use 6.16 (or newer) kernel
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
  boot.zfs.package = pkgs.zfsUnstable; # needed for 6.9

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
          VFIO_NOIOMMU y
        '';
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
