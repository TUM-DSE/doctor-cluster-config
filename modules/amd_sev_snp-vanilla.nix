{ pkgs, ... }:
{
  # srvos' latest-zfs-kernel mixin picks the newest kernel this zfs supports
  # (>= 6.16 needed).
  boot.zfs.package = pkgs.zfs_unstable;

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
