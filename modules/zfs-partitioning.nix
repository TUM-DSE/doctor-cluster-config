{ lib, config, ... }: {

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
        disk0 = {
          type = "disk";
          device = config.disko.rootDisk;
          content = {
            type = "table";
            format = "gpt";
            partitions = [
            {
              name = "ESP";
              start = "0";
              end = "1GiB";
              fs-type = "fat32";
              bootable = true;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "nofail" ];
              };
            }
            {
              name = "zfs";
              start = "1GiB";
              end = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            }
            ];
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
