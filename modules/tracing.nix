{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.bcc.enable = !pkgs.stdenv.hostPlatform.isRiscV;
  programs.sysdig.enable = !pkgs.stdenv.isAarch64 && !pkgs.stdenv.hostPlatform.isRiscV;

  # allow perf as user
  boot.kernel.sysctl."kernel.perf_event_paranoid" = -1;
  # allow perf users to see kernel pointers
  boot.kernel.sysctl."kernel.kptr_restrict" = lib.mkForce 0;

  environment.systemPackages = [
    pkgs.strace

    # we want to use trace from bcc
    (pkgs.lowPrio config.boot.kernelPackages.perf)
  ];
}
