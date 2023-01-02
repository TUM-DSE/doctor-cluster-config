{ modulesPath, ... }:

# To deploy as a systemd-nspawn container on a new host:
# $ nix run github:nix-community/nixos-generators -- --format lxc --flake '.#eva'
# $ cat /etc/systemd/nspawn/eva.nspawn
# [Exec]
# Capability = all
# PrivateUsers = no
#
# [Network]
# VirtualEthernet = no
# $ mkdir -p /var/lib/machines/eva
# $ tar -C /var/lib/machines/eva -xf nixos-system-x86_64-linux.tar
# # provision /etc/os-release, the command will fail but systemd-nspawn will be
# # able to boot our directory afterwards
# $ unshare --mount -- chroot /var/lib/machines/eva /sbin/init
# $ systemd-nspawn --capability=CAP_NET_ADMIN -D /var/lib/machines/eva -b
# or
# $ machinectl start eva

{
  imports = [
    (modulesPath + "/virtualisation/lxc-container.nix")
    ../modules/borgbackup-repos
    ../modules/buildbot/reverse-proxy.nix
    ../modules/monitoring/prometheus
    ../modules/monitoring/loki.nix
    ../modules/monitoring/telegraf.nix
  ];

  services.openssh.extraConfig = ''
    ListenAddress 10.243.29.185
    ListenAddress [42:0:3c46:8a42:2b1:5ef8:7562:676a]
  '';
  services.openssh.startWhenNeeded = false;

  networking.hostName = "doctor";

  # let the host manage these
  systemd.network.networks."ethernet".extraConfig = ''
    [Match]
    Type = ether

    [Link]
    Unmanaged = yes
  '';

  services.resolved.enable = false;

  # TODO
  #simd.arch = "cascadelake";

  system.stateVersion = "21.11";
}
