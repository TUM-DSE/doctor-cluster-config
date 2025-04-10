{ config, lib, ... }:
{
  options = {
    disko.rootDisk = lib.mkOption {
      type = lib.types.str;
      description = "The device to use for the disk";
    };
  };
  config = {
    disko.devices = {
      disk = {
        main = {
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
              root = {
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };
    };
  };
}
