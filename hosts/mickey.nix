{
  imports = [
    ../modules/k3s/agent.nix
    ../modules/hardware/poweredge-r440.nix
    ../modules/disko-zfs.nix
    ../modules/nfs/client.nix
  ];
  disko.rootDisk = "/dev/disk/by-id/nvme-Dell_Ent_NVMe_P5600_MU_U.2_1.6TB_PHAB1233010E1P9SGN";

  networking.hostName = "mickey";

  simd.arch = "cascadelake";

  system.stateVersion = "21.11";
}
