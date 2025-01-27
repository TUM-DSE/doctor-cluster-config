{ pkgs, lib, ... }:
{
  virtualisation.docker.enable = lib.mkForce false;
  virtualisation.podman = {
    enable = true;
    extraPackages = [ pkgs.zfs ];
    dockerCompat = true;
    dockerSocket.enable = true;
  };

  virtualisation.containers.storage.settings = {
    storage.driver = "zfs";
    storage.graphroot = "/var/lib/containers/storage";
    storage.runroot = "/run/containers/storage";
    storage.options.zfs.fsname = "zroot/docker";
  };
}
