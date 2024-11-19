{ lib, ...}: {
  services.envfs.enable = lib.mkDefault false; # envfs is broken
}
