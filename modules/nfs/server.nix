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
# ip addr del 2a09:80c0:102::f000:0/64 dev <public interface>
#
# on the backup machine
# ip addr del 2a09:80c0:102::f000:1/64 dev <public interface>
#
# Than swap the imports for `nfs/server.nix` and `nfs/server-backup.nix` in both nixos configurations.
{
  imports = [ ./. ];

  options = {
    services.nfs-server = {
      backupPublickey = lib.mkOption {
        type = lib.types.str;
        description = "The public key of the syncoid user on the nfs backup server";
      };
    };
  };
  config = {
    sops.secrets.syncoid.sopsFile = ./secrets.yml;
    sops.secrets.syncoid.owner = "syncoid";
    programs.ssh.extraConfig = ''
      Host nfs-backup
        User syncoid
        IdentityFile ${config.sops.secrets.syncoid.path}
    '';

    programs.ssh.knownHosts = {
      nfs-backup.hostNames = [ "nfs-backup" ];
      nfs-backup.publicKey = config.services.nfs-server.backupPublickey;
    };

    services.nfs.server.enable = true;
    # fsid is necessary so that we can failover to the backup nfs, without getting
    # stale mounts on our clients.
    #
    # 2a09:80c0:38::101/128 is our riscv board in the hardware lab
    # 2a09:80c0:38::222/128 is our m1 mac mini

    services.nfs.server.exports =
      let
        allowedHosts = [
          # TODO: also move this in, requires reboot
          # "2a09:80c0:102::/64"
          config.networking.doctorwho.hosts.ruby.ipv6
          config.networking.doctorwho.hosts.tegan.ipv6
          config.networking.doctorwho.hosts.ace.ipv6
          #config.networking.doctorwho.hosts.sarah.ipv6
          config.networking.doctorwho.hosts.donna.ipv6
          config.networking.doctorwho.hosts.joy.ipv6
          # Allow the OrangePiUltra to fetch from the NFS
          "2a09:80c0:38::26"
        ];
        # offset 27 has historically reasons
        exportHome = lib.imap0 (
          index: ip:
          "${ip}(async,rw,nohide,insecure,no_subtree_check,no_root_squash,fsid=${
            builtins.toString (index * 2 + 27)
          })"
        ) allowedHosts;
        exportShare = lib.imap0 (
          index: ip:
          "${ip}(async,rw,nohide,insecure,no_subtree_check,no_root_squash,fsid=${
            builtins.toString (index * 2 + 1 + 27)
          })"
        ) allowedHosts;
      in
      ''
        /export/home 2a09:80c0:102::/64(async,rw,nohide,insecure,no_subtree_check,no_root_squash,fsid=25) ${lib.concatStringsSep " " exportHome}
        /export/share 2a09:80c0:102::/64(async,rw,nohide,insecure,no_subtree_check,no_root_squash,fsid=26) ${lib.concatStringsSep " " exportShare}
      '';

    services.nfs.settings.nfsd = {
      vers3 = true;
      vers4 = true;
    };

    systemd.tmpfiles.rules =
      let
        loginUsers = lib.filterAttrs (_n: v: v.isNormalUser) config.users.users;
      in
      (lib.mapAttrsToList (n: _v: "d /export/share/${n} 0755 ${n} users -") loginUsers)
      ++ (builtins.map (n: "R /export/share/${n} - - - - -") config.users.deletedUsers)
      ++ (builtins.map (n: "R /export/home/${n} - - - - -") config.users.deletedUsers);

    boot.zfs.extraPools = [
      "nfs-data"
      "nfs-home"
    ];

    fileSystems."/export/home" = {
      device = "nfs-home/home";
      fsType = "zfs";
      options = [
        "nofail"
        "zfsutil"
      ];
    };

    fileSystems."/export/share" = {
      device = "nfs-data/share";
      fsType = "zfs";
      options = [
        "nofail"
        "zfsutil"
      ];
    };

    systemd.services.syncoid-setup = {
      wantedBy = [ "multi-user.target" ];
      before = [ "syncoid.service" ];
      after = [ "network.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = [
          # delete nfs backup server ip if present.
          "-${pkgs.iproute2}/bin/ip addr del 2a09:80c0:102::f000:1/64 dev ${config.services.nfs-server.interface}"
          # add nfs server ip
          "-${pkgs.iproute2}/bin/ip addr add 2a09:80c0:102::f000:0/64 dev ${config.services.nfs-server.interface}"
        ];
      };
    };

    services.syncoid = {
      enable = true;
      # every 15 minutes
      interval = "*:0/15";
      commands."nfs-home/home" = {
        target = "syncoid@nfs-backup:nfs-home/home";
        sshKey = config.sops.secrets.syncoid.path;
      };
      commands."nfs-data/share" = {
        target = "syncoid@nfs-backup:nfs-data/share";
        sshKey = config.sops.secrets.syncoid.path;
      };
    };

    systemd.services.syncoid-nfs-home-home = {
      serviceConfig.ExecStopPost = [
        (
          "+${pkgs.writeShellScript "telegraf" ''
            umask 022
            cat > /var/log/telegraf/syncoid-home <<EOF
            task,frequency=tenminutes last_run=$(date +%s)i,state="ok"
            EOF
          ''}"
        )
      ];
    };

    systemd.services.syncoid-nfs-data-share = {
      serviceConfig.ExecStopPost = [
        (
          "+${pkgs.writeShellScript "telegraf" ''
            umask 022
            cat > /var/log/telegraf/syncoid-share <<EOF
            task,frequency=tenminutes last_run=$(date +%s)i,state="ok"
            EOF
          ''}"
        )
      ];
    };

    sops.secrets.tum-borgbackup-password.sopsFile = ./secrets.yml;
    sops.secrets.tum-borgbackup-home-ssh.sopsFile = ./secrets.yml;
    sops.secrets.tum-borgbackup-share-ssh.sopsFile = ./secrets.yml;

    systemd.services.borgbackup-job-nfs-share = {
      path = [ pkgs.zfs ];
      serviceConfig.ReadWritePaths = [ "/var/log/telegraf" ];
      serviceConfig.PrivateDevices = false; # ZFS needs access to /dev/zfs
      # writable mountpoint for the ZFS snapshot (rest of /run is read-only)
      serviceConfig.RuntimeDirectory = "borgbackup/nfs-share";
    };

    services.borgbackup.jobs.nfs-share = {
      paths = [ "/run/borgbackup/nfs-share" ];
      repo = "il1dsenixosbk@doctor.r:/mnt/backup/nfs-share";
      exclude = [
        # large memory traces
        "/run/borgbackup/nfs-share/redha/traces"
        # vm images
        "/run/borgbackup/nfs-share/cmainas/**/*.img"
        "/run/borgbackup/nfs-share/martinL/**/*.img"
        # large google traces
        "/run/borgbackup/nfs-share/cmainas/traces"
        "**/node_modules"
      ];
      extraCreateArgs = [ "--exclude-caches" ];
      encryption = {
        mode = "repokey";
        passCommand = "cat ${config.sops.secrets.tum-borgbackup-password.path}";
      };
      compression = "auto,zstd";
      startAt = "daily";
      environment.BORG_RSH = "ssh -i ${config.sops.secrets.tum-borgbackup-share-ssh.path}";
      preHook = ''
        set -x
        # Mount the snapshot explicitly instead of using the .zfs/snapshot
        # automount, whose device/inode can change mid-backup and make borg
        # skip the tree with "file type or inode changed".
        # clean up leftovers from a previous failed run
        ${pkgs.util-linux}/bin/umount /run/borgbackup/nfs-share 2>/dev/null || true
        ${pkgs.zfs}/bin/zfs destroy -r nfs-data/share@borg 2>/dev/null || true
        ${pkgs.zfs}/bin/zfs snapshot -r nfs-data/share@borg
        ${pkgs.util-linux}/bin/mount -t zfs -o ro nfs-data/share@borg /run/borgbackup/nfs-share
      '';

      postHook = ''
        ${pkgs.util-linux}/bin/umount /run/borgbackup/nfs-share || true
        ${pkgs.zfs}/bin/zfs destroy -r nfs-data/share@borg || true

        cat > /var/log/telegraf/borgbackup-job-nfs-share.service <<EOF
        task,frequency=daily last_run=$(date +%s)i,exit_status=''${exitStatus}i
        EOF
      '';

      prune.keep = {
        within = "1d";
        daily = 7;
        weekly = 4;
        monthly = 0;
      };
    };

    systemd.services.borgbackup-job-nfs-home = {
      path = [ pkgs.zfs ];
      serviceConfig.ReadWritePaths = [ "/var/log/telegraf" ];
      serviceConfig.PrivateDevices = false; # ZFS needs access to /dev/zfs
      # writable mountpoint for the ZFS snapshot (rest of /run is read-only)
      serviceConfig.RuntimeDirectory = "borgbackup/nfs-home";
    };

    services.borgbackup.jobs.nfs-home = {
      paths = [ "/run/borgbackup/nfs-home" ];
      repo = "il1dsenixosbk@doctor.r:/mnt/backup/nfs-home";
      encryption = {
        mode = "repokey";
        passCommand = "cat ${config.sops.secrets.tum-borgbackup-password.path}";
      };
      compression = "auto,zstd";
      startAt = "daily";
      exclude = [
        "*.pyc"
        "*.swp"
        "*.o"
        "/run/borgbackup/nfs-home/*/.direnv"
        "/run/borgbackup/nfs-home/*/.cache"
        "/run/borgbackup/nfs-home/*/.npm"
        "/run/borgbackup/nfs-home/*/.m2"
        "/run/borgbackup/nfs-home/*/.gradle"
        "/run/borgbackup/nfs-home/*/.opam"
        "/run/borgbackup/nfs-home/*/.clangd"
        "**/node_modules"
      ];
      extraCreateArgs = [ "--exclude-caches" ];
      environment.BORG_RSH = "ssh -i ${config.sops.secrets.tum-borgbackup-home-ssh.path}";
      preHook = ''
        set -x
        # Mount the snapshot explicitly instead of using the .zfs/snapshot
        # automount, whose device/inode can change mid-backup and make borg
        # skip the tree with "file type or inode changed".
        # clean up leftovers from a previous failed run
        ${pkgs.util-linux}/bin/umount /run/borgbackup/nfs-home 2>/dev/null || true
        ${pkgs.zfs}/bin/zfs destroy -r nfs-home/home@borg 2>/dev/null || true
        ${pkgs.zfs}/bin/zfs snapshot -r nfs-home/home@borg
        ${pkgs.util-linux}/bin/mount -t zfs -o ro nfs-home/home@borg /run/borgbackup/nfs-home
      '';

      postHook = ''
        ${pkgs.util-linux}/bin/umount /run/borgbackup/nfs-home || true
        ${pkgs.zfs}/bin/zfs destroy -r nfs-home/home@borg || true

        cat > /var/log/telegraf/borgbackup-job-nfs-home.service <<EOF
        task,frequency=daily last_run=$(date +%s)i,exit_status=''${exitStatus}i
        EOF
      '';

      prune.keep = {
        within = "1d";
        daily = 7;
        weekly = 4;
        monthly = 0;
      };
    };
  };
}
