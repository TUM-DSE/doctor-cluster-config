{
  config,
  lib,
  pkgs,
  ...
}:
# NFS failover setup based on syncoid.
#
# This setup works as follow:
# - The nfs server uses zsnapzend to sync its zfs pools to the nfs backup every 10 minutes
# - Both nfs server and nfs backup have a dedicated ip address: 2a09:80c0:102::f000:0/64 for the server
# - If the nfs server becomes unavailable the backup server can become the nfs
#   server by importing `nfs/server.nix` instead of `nfs/server-backup.nix`
# To migrate nfs service from one machine to another while both machines are still online, first remove
# their ipv6 addresses to avoid ipv6 duplicate address detection to fail:
#
# on the server
# ip addr del 2a09:80c0:102::f000:0/64 dev bond1
#
# on the backup machine
# ip addr del 2a09:80c0:102::f000:1/64 dev bond1
#
# Than swap the imports for `nfs/server.nix` and `nfs/server-backup.nix` in both nixos configurations.
{
  imports = [./.];

  sops.secrets.syncoid.sopsFile = ./secrets.yml;
  sops.secrets.syncoid.owner = "syncoid";
  programs.ssh.extraConfig = ''
    Host nfs-backup
      User syncoid
      IdentityFile ${config.sops.secrets.syncoid.path}
  '';

  services.nfs.server.enable = true;
  # fsid is necessary so that we can failover to the backup nfs, without getting
  # stale mounts on our clients.
  services.nfs.server.exports = ''
    /export/home 2a09:80c0:102::/64(async,rw,nohide,insecure,no_subtree_check,no_root_squash,fsid=25)
    /export/share 2a09:80c0:102::/64(async,rw,nohide,insecure,no_subtree_check,no_root_squash,fsid=26)
  '';

  systemd.tmpfiles.rules = let
    loginUsers = lib.filterAttrs (n: v: v.isNormalUser) config.users.users;
  in
    (lib.mapAttrsToList (n: v: "d /export/share/${n} 0755 ${n} users -") loginUsers)
    ++ (builtins.map (n: "R /export/share/${n} - - - - -") config.users.deletedUsers);

  boot.zfs.extraPools = ["zpool1" "zpool2"];

  fileSystems."/export/home" = {
    device = "zpool1/home";
    fsType = "zfs";
    options = ["nofail"];
  };

  fileSystems."/export/share" = {
    device = "zpool2/share";
    fsType = "zfs";
    options = ["nofail"];
  };

  systemd.services.syncoid-setup = {
    wantedBy = ["multi-user.target"];
    before = ["syncoid.service"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [
        # delete nfs backup server ip if present.
        "-${pkgs.iproute2}/bin/ip addr del 2a09:80c0:102::f000:1/64 dev bond1"
        # add nfs server ip
        "-${pkgs.iproute2}/bin/ip addr add 2a09:80c0:102::f000:0/64 dev bond1"
      ];
    };
  };

  services.syncoid = {
    enable = true;
    # every 15 minutes
    interval = "*:0/15";
    commands."zpool1/home" = {
      target = "syncoid@nfs-backup:zpool1/home";
      sshKey = config.sops.secrets.syncoid.path;
    };
    commands."zpool2/share" = {
      target = "syncoid@nfs-backup:zpool2/share";
      sshKey = config.sops.secrets.syncoid.path;
    };
  };

  systemd.services.syncoid-zpool1-home = {
    serviceConfig.ExecStopPost = [("+${pkgs.writeShellScript "telegraf" ''
      umask 022
      cat > /var/log/telegraf/syncoid-home <<EOF
      task,frequency=tenminutes last_run=$(date +%s)i,state="ok"
      EOF
    ''}")];
  };

  systemd.services.syncoid-zpool2-share = {
    serviceConfig.ExecStopPost = [("+${pkgs.writeShellScript "telegraf" ''
      umask 022
      cat > /var/log/telegraf/syncoid-share <<EOF
      task,frequency=tenminutes last_run=$(date +%s)i,state="ok"
      EOF
    ''}")];
  };

  sops.secrets.tum-borgbackup-password.sopsFile = ./secrets.yml;
  sops.secrets.tum-borgbackup-home-ssh.sopsFile = ./secrets.yml;
  sops.secrets.tum-borgbackup-share-ssh.sopsFile = ./secrets.yml;

  systemd.services.borgbackup-job-eva-share.serviceConfig.ReadWritePaths = [
    "/var/log/telegraf"
  ];

  services.borgbackup.jobs.eva-share = {
    paths = [
      "/export/share"
    ];
    repo = "il1dsenixosbk@eva.r:/mnt/backup/nfs-share";
    exclude = [
      # large memory traces
      "/export/share/redha/traces"
    ];
    encryption = {
      mode = "repokey";
      passCommand = "cat ${config.sops.secrets.tum-borgbackup-password.path}";
    };
    compression = "auto,zstd";
    startAt = "daily";
    preHook = ''
      set -x
      eval $(ssh-agent)
      ssh-add ${config.sops.secrets.tum-borgbackup-share-ssh.path}
    '';

    postHook = ''
      cat > /var/log/telegraf/borgbackup-nfs-share <<EOF
      task,frequency=daily last_run=$(date +%s)i,state="$([[ $exitStatus == 0 ]] && echo ok || echo fail)"
      EOF
    '';

    prune.keep = {
      within = "1d"; # Keep all archives from the last day
      daily = 7;
      weekly = 4;
      monthly = 0;
    };
  };

  systemd.services.borgbackup-job-eva-home.serviceConfig.ReadWritePaths = [
    "/var/log/telegraf"
  ];

  services.borgbackup.jobs.eva-home = {
    paths = [
      "/export/home"
    ];
    repo = "il1dsenixosbk@eva.r:/mnt/backup/nfs-home";
    encryption = {
      mode = "repokey";
      passCommand = "cat ${config.sops.secrets.tum-borgbackup-password.path}";
    };
    compression = "auto,zstd";
    startAt = "daily";
    preHook = ''
      set -x
      eval $(ssh-agent)
      ssh-add ${config.sops.secrets.tum-borgbackup-home-ssh.path}
    '';

    postHook = ''
      cat > /var/log/telegraf/borgbackup-nfs-home <<EOF
      task,frequency=daily last_run=$(date +%s)i,state="$([[ $exitStatus == 0 ]] && echo ok || echo fail)"
      EOF
    '';

    prune.keep = {
      within = "1d"; # Keep all archives from the last day
      daily = 7;
      weekly = 4;
      monthly = 0;
    };
  };
}
