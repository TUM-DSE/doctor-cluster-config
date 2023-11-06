{
  # we don't really have services that need a long shutdown.
  systemd.extraConfig = ''
    DefaultTimeoutStopSec = 20s
  '';

  # allow scheduling of jobs at arbitrary times
  services.atd.enable = true;
}
