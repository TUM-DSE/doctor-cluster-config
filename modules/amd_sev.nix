{
  config,
  lib,
  pkgs,
  ...
}: {
  # This is used to enable AMD-SEV
  config = {
    # enable KVM_AMD and AMD-SME
    # https://cateee.net/lkddb/web-lkddb/KVM_AMD.html
    # https://cateee.net/lkddb/web-lkddb/AMD_MEM_ENCRYPT.html
    boot.kernelPatches = [
      {
        name = "amd_sme-config";
        patch = null;
        extraConfig = ''
          KVM_AMD y
          AMD_MEM_ENCRYPT y
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
