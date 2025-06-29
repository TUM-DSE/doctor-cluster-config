{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.zokelmannvms;
in
{
  options.services.zokelmannvms = {
    partitionUuid = mkOption {
      type = types.str;
      description = "Partition UUID for the ZFS pool device";
      example = "ced04b7c-f718-4997-8306-c33fb44a04e2";
    };

    mountPath = mkOption {
      type = types.str;
      default = "/scratch/${cfg.owner}/vmuxIO/VMs";
      description = "Mount path for the ZFS filesystem";
    };

    owner = mkOption {
      type = types.str;
      default = "okelmann";
      description = "Owner of the mounted filesystem";
    };

    group = mkOption {
      type = types.str;
      default = "users";
      description = "Group of the mounted filesystem";
    };
  };

  config = {
    # Ensure ZFS dataset exists and set ownership
    systemd.services.zokelmannvms-setup = {
      description = "Setup zokelmannvms ZFS dataset and permissions";
      after = [ "zfs-import.target" ];
      before = [ "local-fs.target" ];
      wantedBy = [ "multi-user.target" ];
      script = ''
        # Check if the pool exists, create it if not
        if ! ${pkgs.zfs}/bin/zpool list zokelmannvms >/dev/null 2>&1; then
          echo "Creating ZFS pool 'zokelmannvms'"
          ${pkgs.zfs}/bin/zpool create zokelmannvms \
            -o ashift=12 \
            -O acltype=posixacl \
            -O xattr=sa \
            -O compression=lz4 \
            -O atime=off \
            /dev/disk/by-partuuid/${cfg.partitionUuid}
        fi

        # Check if the dataset exists, create it if not
        if ! ${pkgs.zfs}/bin/zfs list zokelmannvms/vms >/dev/null 2>&1; then
          echo "Creating ZFS dataset zokelmannvms/vms"
          ${pkgs.zfs}/bin/zfs create -o mountpoint=legacy zokelmannvms/vms
        fi

        # Ensure mount directory exists
        mkdir -p ${cfg.mountPath}

        # Mount the dataset if not already mounted
        if ! mountpoint -q ${cfg.mountPath}; then
          mount -t zfs zokelmannvms/vms ${cfg.mountPath}
        fi

        # Set ownership
        chown -R ${cfg.owner}:${cfg.group} ${cfg.mountPath}
      '';
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
    };
  };
}
