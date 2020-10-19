{
  # For docker
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "zfs";
    extraOptions = "--userland-proxy=false --ip-masq=true --storage-opt=zfs.fsname=zroot/docker";
  };
}
