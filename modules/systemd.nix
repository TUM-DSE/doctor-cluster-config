{ pkgs, ... }: {
  # we don't really have services that need a long shutdown.
  systemd.extraConfig = ''
    DefaultTimeoutStopSec = 20s
  '';

  # allow scheduling of jobs at arbitrary times
  # (atd doesnt build for riscv64-linux)
  services.atd.enable = !(pkgs.stdenv.hostPlatform == "riscv64-linux"); # if system != "riscv64-linux" then true else false;
}
