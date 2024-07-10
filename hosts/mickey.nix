{
  imports = [
    ../modules/k3s/agent.nix
    ../modules/hardware/poweredge-r440.nix
    ../modules/disko-zfs.nix
    ../modules/disko-nfs-storage.nix
    ../modules/nfs/server.nix
  ];


  disko.rootDisk = "/dev/disk/by-id/nvme-Dell_Ent_NVMe_P5600_MU_U.2_1.6TB_PHAB1233010E1P9SGN";

  disko.devices.disk.nfs-home.device = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNT0X115369";
  disko.devices.disk.nfs-data-disk1.device = "/dev/disk/by-id/ata-Samsung_SSD_870_QVO_8TB_S5SSNJ0X300228R";
  disko.devices.disk.nfs-data-disk2.device = "/dev/disk/by-id/ata-Samsung_SSD_870_QVO_8TB_S5SSNJ0X300181Y";

  services.nfs-server.interface = "enp94s0f0np0";
  services.nfs-server.backupPublickey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOpFka8+cr1lvC0bzMqdqP1RRIvnD+nb3Mog56hGGkB5"; # dan

  networking.hostName = "mickey";

  simd.arch = "cascadelake";

  system.stateVersion = "21.11";
}
