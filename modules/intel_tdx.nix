{ pkgs, lib, ... }:
{
  # srvos' latest-zfs-kernel mixin picks the newest kernel this zfs supports
  # (>= 6.18 needed for TDX kexec).
  boot.zfs.package = pkgs.zfs_unstable;

  boot.kernelPatches = [
    {
      name = "tdx-config";
      patch = null;
      # TDX now supports kexec as of kernel 6.18 (commit 80804847269e)
      structuredExtraConfig = with lib.kernel; {
        X86_X2APIC = yes;
        X86_MCE = yes;
        KVM = yes;
        KVM_INTEL = yes;
        INTEL_TDX_HOST = yes;
      };
    }
  ];

  boot.kernelParams = [
    "kvm_intel.tdx=1"
    # TDX cannot survive from S3 and deeper states
    "nohibernate"
  ];

  virtualisation.libvirtd.enable = true;
}
