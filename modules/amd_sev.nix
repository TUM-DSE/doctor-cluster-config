{
  config,
  lib,
  pkgs,
  ...
}: {
  # This is used to enable AMD-SEV
  config = {
    # enable libvirtd service
    virtualisation.libvirtd.enable = true;
    
    # enable AMD-SME
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

    # enable AMD-SEV
    # https://libvirt.org/kbase/launch_security_sev.html#enabling-sev-on-the-host
    boot.kernelParams = [
      "mem_encrypt=on"
      "kvm_amd.sev=1"
    ];
  };
}
