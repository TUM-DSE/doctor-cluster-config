{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./.];

  systemd.services.znapzend-setup = {
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [
        # drop nfs server ip if present
        "-${pkgs.iproute2}/bin/ip addr del 2a09:80c0:102::f000:0/64 dev bond1"
        "${pkgs.zfs}/bin/zfs allow znapzend create,destroy,mount,receive,userprop zpool1"
        "${pkgs.zfs}/bin/zfs allow znapzend create,destroy,mount,receive,userprop zpool2"
        # when switching out nfs server and server backup, we want telegraf no
        # longer to serve stale monitoring files.
        "${pkgs.coreutils}/bin/rm -rf /var/log/telegraf/znapzend-home /var/log/telegraf/znapzend-share"
        # add nfs server backup ip
        "-${pkgs.iproute2}/bin/ip addr add 2a09:80c0:102::f000:1/64 dev bond1"
      ];
      RemainAfterExit = true;
    };
  };

  boot.zfs.extraPools = ["zpool1" "zpool2"];

  users.users.znapzend = {
    isSystemUser = true;
    useDefaultShell = true;
    group = "znapzend";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIORiUPbKrKzb55DrqDK4YXmqM5L1Qo8mDhmbdvKu+nIi"
    ];
  };
  users.groups.znapzend = {};
}
