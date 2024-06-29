# A host that imports this module needs to set this:
# Replace device names with the disks you want to use
#  disko.devices.disk.nfs-home.device = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNT0X115369";
#  disko.devices.disk.nfs-data-disk1.device = "/dev/disk/by-id/ata-Samsung_SSD_870_QVO_8TB_S5SSNJ0X300228R";
#  disko.devices.disk.nfs-data-disk2.device = "/dev/disk/by-id/ata-Samsung_SSD_870_QVO_8TB_S5SSNJ0X300181Y";
{
  disko.devices = {
    disk = {
      nfs-home = {
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "nfs-home";
              };
            };
          };
        };
      };
      nfs-data-disk1 = {
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "nfs-data";
              };
            };
          };
        };
      };
      nfs-data-disk2 = {
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "nfs-data";
              };
            };
          };
        };
      };
    };
    zpool = {
      nfs-home = {
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
          "home" = {
            type = "zfs_fs";
            mountpoint = "/export/home";
            options."com.sun:auto-snapshot" = "true";
          };
        };
      };
      nfs-data = {
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
          "data" = {
            type = "zfs_fs";
            mountpoint = "/export/data";
            options."com.sun:auto-snapshot" = "true";
          };
        };
      };
    };
  };
}
