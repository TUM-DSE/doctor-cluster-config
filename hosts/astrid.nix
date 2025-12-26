{
  imports = [
    ../modules/k3s/server.nix
    ../modules/k3s/runner-monitoring.nix
    ../modules/hardware/poweredge-r440.nix
    ../modules/disko-zfs.nix
    ../modules/nfs/client.nix

    ../modules/jumphost
    ../modules/buildbot/master.nix
    ../modules/niks3
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-Dell_Ent_NVMe_P5600_MU_U.2_1.6TB_PHAB123301411P9SGN";

  # TODO: migrate to native mountpoints
  disko.zfs.legacyMounts.enable = true;

  networking.hostName = "astrid";

  simd.arch = "cascadelake";

  system.stateVersion = "21.11";
}
