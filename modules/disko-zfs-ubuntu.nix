{ lib, config, ... }:
{
  options = {
    disko.rootDisk = lib.mkOption {
      type = lib.types.str;
      default = "/dev/nvme0n1";
      description = "The device to use for the disk";
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
              ubuntu = {
                size = "512G";
                content = {
                  type = "filesystem";
                  format = "ext4";
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
            };
            "root/tmp" = {
              type = "zfs_fs";
              mountpoint = "/tmp";
            };
          };
        };
      };
    };
  };
}
