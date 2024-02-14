{ lib, ...}: {
  services.envfs.enable = lib.mkDefault true;
}
