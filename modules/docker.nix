{
  lib,
  pkgs,
  config,
  ...
}:
let
  useOverlayStorageDriver = pkgs.hostPlatform.isRiscV || config.networking.hostName == "ace";
in
{
  # For docker
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = if useOverlayStorageDriver then "overlay2" else "zfs";
    extraOptions = "--userland-proxy=false --ip-masq=true ${
      lib.optionalString (!useOverlayStorageDriver) "--storage-opt=zfs.fsname=zroot/docker"
    }";

    # not compatible with docker swarm
    liveRestore = false;
  };
}
