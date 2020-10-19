{ config, lib, pkgs, ... }:

{
  systemd.watchdog.rebootTime = "10m";
  systemd.watchdog.runtimeTime = "30s";

  # Since we can't manually respond to a panic, just reboot.
  boot.kernelParams = [ "panic=1" "boot.panic_on_fail" ];
}
