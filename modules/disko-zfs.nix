 { lib, config, ... }: { 
  options = {
    disko.rootDisk = lib.mkOption {
      type = lib.types.str;
      default = "/dev/nvme0n1";
      description = "The device to use for the disk";
    };
    disko.zfs.legacyMounts.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable legacy mountpoints for ZFS datasets";
    };
  };
  config = {
    disko.devices = {
      disk = {
        vdb = {
          device = config.disko.rootDisk;
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                type = "EF00";
                size = "1G";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                };
              };
              zfs = {
                size = "100%";
                content = {
                  type = "zfs";
                  pool = "zroot";
                };
              };
            };
          };
        };
      };
      zpool = {
        zroot = {
          type = "zpool";
          rootFsOptions = {
            compression = "lz4";
            xattr = "sa";
            atime = "off";
            acltype = "posixacl";
            "com.sun:auto-snapshot" = "false";
          };
          options.ashift = "12";

          datasets = {
            "docker".type = "zfs_fs";
            "root".type = "zfs_fs";
            "root/nixos" = {
              type = "zfs_fs";
              mountpoint = "/";
              options."com.sun:auto-snapshot" = "true";
              options."mountpoint" = lib.mkIf config.disko.zfs.legacyMounts.enable "legacy";
            };
            "root/tmp" = {
              type = "zfs_fs";
              mountpoint = "/tmp";
              options.sync = "disabled";
            };
          };
        };
      };
    };
  };
}
