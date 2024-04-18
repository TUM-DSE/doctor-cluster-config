{ config, lib, pkgs, ... }:
{
  services.zfs = {
    autoSnapshot.enable = true;
    autoSnapshot.monthly = 1;
    autoScrub.enable = true;
  };
  networking.hostId = "8425e348";
  boot.kernelPackages =
    lib.mkDefault
      (pkgs.zfsUnstable.override { removeLinuxDRM = pkgs.hostPlatform.isAarch64; })
      .latestCompatibleLinuxPackages;
  boot.zfs.enableUnstable = true;
  boot.zfs.removeLinuxDRM = pkgs.hostPlatform.isAarch64;

  # ZFS already has its own scheduler. Without this my(@Artturin) computer froze for a second when i nix build something.
  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="sd[a-z]*[0-9]*|mmcblk[0-9]*p[0-9]*|nvme[0-9]*n[0-9]*p[0-9]*", ENV{ID_FS_TYPE}=="zfs_member", ATTR{../queue/scheduler}="none"
  '';

  boot.kernelPatches =
    lib.optional (config.boot.zfs.removeLinuxDRM && pkgs.stdenv.hostPlatform.system == "aarch64-linux")
      {
        name = "export-neon-symbols-as-gpl";
        patch = pkgs.fetchpatch {
          url = "https://github.com/torvalds/linux/commit/aaeca98456431a8d9382ecf48ac4843e252c07b3.patch";
          hash = "sha256-L2g4G1tlWPIi/QRckMuHDcdWBcKpObSWSRTvbHRIwIk=";
          revert = true;
        };
      };
}
