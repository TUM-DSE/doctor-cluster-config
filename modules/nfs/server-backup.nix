{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [ ./. ];

  config = {
    systemd.services.syncoid-setup = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = [
          # drop nfs server ip if present
          "-${pkgs.iproute2}/bin/ip addr del 2a09:80c0:102::f000:0/64 dev ${config.services.nfs-server.interface}"

          "${pkgs.zfs}/bin/zfs allow syncoid compression,create,destroy,mount,mountpoint,receive,rollback,send,snapshot,bookmark,hold nfs-home"
          "${pkgs.zfs}/bin/zfs allow syncoid compression,create,destroy,mount,mountpoint,receive,rollback,send,snapshot,bookmark,hold nfs-data"
          # when switching out nfs server and server backup, we want telegraf no
          # longer to serve stale monitoring files.
          "${pkgs.coreutils}/bin/rm -rf /var/log/telegraf/syncoid-home /var/log/telegraf/syncoid-share"
          # add nfs server backup ip
          "-${pkgs.iproute2}/bin/ip addr add 2a09:80c0:102::f000:1/64 dev ${config.services.nfs-server.interface}"
        ];
        RemainAfterExit = true;
      };
    };

    # speedup syncoid
    environment.systemPackages = [
      pkgs.mbuffer
      pkgs.lzop
    ];

    users.users.syncoid = {
      isSystemUser = true;
      useDefaultShell = true;
      group = "syncoid";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIORiUPbKrKzb55DrqDK4YXmqM5L1Qo8mDhmbdvKu+nIi"
      ];
    };
    users.groups.syncoid = { };

    # Syncoid leaves zfs-auto-snap behind, that we cleanup simply like this.
    systemd.services.prune-auto-snaps = {
      path = [ config.boot.zfs.package ];
      startAt = "daily";
      serviceConfig.ExecStart = "${pkgs.zfs-prune-snapshots}/bin/zfs-prune-snapshots  -p 'zfs-auto-snap' 1w nfs-data nfs-home";
    };
  };

}
