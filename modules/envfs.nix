{ lib, ...}: {
  services.envfs.enable = false; # envfs is broken
}
