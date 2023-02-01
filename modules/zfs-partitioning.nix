{ disk ? "/dev/nvme0n1", ... }: {
  disk = {
    disk0 = {
      type = "disk";
      device = disk;
      content = {
        type = "table";
        format = "gpt";
        partitions = [
          {
            type = "partition";
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
            type = "partition";
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
        "docker".zfs_type = "filesystem";
        "root".zfs_type = "filesystem";
        "root/nixos" = {
          zfs_type = "filesystem";
          mountpoint = "/";
          options."com.sun:auto-snapshot" = "true";
        };
        "root/tmp" = {
          zfs_type = "filesystem";
          mountpoint = "/tmp";
        };
      };
    };
  };
}
