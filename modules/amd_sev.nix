{ config, ... }:
{
  # This is used to enable AMD-SEV
  config = {
    # enable libvirtd service
    virtualisation.libvirtd.enable = true;

    # enable AMD-SME & AMD-SEV
    # https://cateee.net/lkddb/web-lkddb/KVM_AMD.html
    boot.kernelPatches = [
      {
        name = "amd_sme-config";
        patch = null;
        extraConfig = ''
          AMD_MEM_ENCRYPT y
          CRYPTO_DEV_CCP y
          CRYPTO_DEV_CCP_DD y
          CRYPTO_DEV_SP_PSP y
          KVM_AMD_SEV y
        '';
      }
    ];

    # enable AMD-SEV and SEV-ES
    # https://libvirt.org/kbase/launch_security_sev.html#enabling-sev-on-the-host
    # For SEV-ES the BIOS parameter the defines the Min SEV ASIDs has to be updated
    # For more information specifically for our Dell Poweredge 7515 
    # see here: https://www.dell.com/support/manuals/en-us/idrac9-lifecycle-controller-v4.x-series/idrac_4.00.00.00_racadm_ar_referenceguide/bios.procsettings.cpuminsevasid-(read-or-write)?guid=guid-4bdaeaa7-d054-4fd1-bd84-0cd71d7aec1e&lang=en-us
    boot.kernelParams = [
      #"mem_encrypt=on"
      "kvm_amd.sev=1"
      "kvm_amd.sev_es=1"
      #"kvm.mmio_caching=on"
    ];
  };
}
