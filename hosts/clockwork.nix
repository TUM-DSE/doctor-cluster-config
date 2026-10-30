# Orange Pi 5 Ultra in the hardware lab.
{ lib, pkgs, ... }:
{
  imports = [
    ../modules/hardware/orangepi-5-ultra.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "clockwork";

  # The first partition starts at 30 MiB rather than the usual 1 MiB: the
  # Rockchip idbloader sits at sector 64 and U-Boot at sector 16384 of this
  # device, outside any partition, and the board boots from them.
  disko.devices.disk.emmc = {
    device = "/dev/disk/by-id/mmc-A3V014_0x00130400";
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        boot = {
          type = "EF00";
          attributes = [ 2 ];
          start = "30M";
          size = "1G";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
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
  disko.devices.zpool.zroot = {
    type = "zpool";
    rootFsOptions = {
      compression = "lz4";
      xattr = "sa";
      atime = "off";
      acltype = "posixacl";
      "com.sun:auto-snapshot" = "false";
    };
    options.ashift = "12";
    options.autotrim = "on";
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
        options.sync = "disabled";
      };
    };
  };

  # Cap the ARC size to 2GiB max
  boot.kernelParams = [ "zfs.zfs_arc_max=${toString (2 * 1024 * 1024 * 1024)}" ];

  disko.devices.disk.nvme = {
    device = "/dev/disk/by-id/nvme-WDS200T1X0E-00AFY0_213328800075";
    type = "disk";
    content = {
      type = "gpt";
      partitions.zfs = {
        size = "100%";
        content = {
          type = "zfs";
          pool = "zscratch";
        };
      };
    };
  };
  disko.devices.zpool.zscratch = {
    type = "zpool";
    rootFsOptions = {
      compression = "lz4";
      xattr = "sa";
      atime = "off";
      acltype = "posixacl";
      "com.sun:auto-snapshot" = "false";
    };
    options.ashift = "12";
    options.autotrim = "on";
    datasets = {
      "scratch" = {
        type = "zfs_fs";
        mountpoint = "/scratch";
        mountOptions = [ "nofail" ];
      };
      "nix-build" = {
        type = "zfs_fs";
        mountpoint = "/scratch/.nix-build";
        mountOptions = [ "nofail" ];
        options.sync = "disabled";
      };
    };
  };

  # Point the Nix build to the NVMe to avoid eccessive eMMC wear
  nix.settings.build-dir = "/scratch/.nix-build";
  systemd.tmpfiles.rules = [ "d /scratch/.nix-build 0755 root root -" ];

  # Rockchip BSP kernel with the vendor `rknpu` NPU driver
  boot.kernelPackages = lib.mkForce (
    pkgs.linuxPackagesFor (pkgs.callPackage ../pkgs/kernels/linux-rk3588-vendor.nix { })
  );
  boot.initrd.allowMissingModules = true;

  system.stateVersion = "26.05";
}
