{
  config,
  lib,
  pkgs,
  ...
}: {
  # This is used to enable AMD-SEV
  config = {
    boot.kernelParams = [
      "mem_encrypt=on"
      "kvm_amd.sev=1"
    ];
  };
}
