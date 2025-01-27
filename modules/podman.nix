{ pkgs, lib, ... }:
{
  virtualisation.docker.enable = lib.mkForce false;
  virtualisation = {
    podman.enable = true;
    podman.extraPackages = [ pkgs.zfs ];
    podman.dockerCompat = true;
  };

  virtualisation.containers.storage.settings = {
    storage.driver = "zfs";
    storage.graphroot = "/var/lib/containers/storage";
    storage.runroot = "/run/containers/storage";
    storage.options.zfs.fsname = "zroot/docker";
  };
}
