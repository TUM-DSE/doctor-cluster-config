
{
  imports = [
    ../modules/hardware/poweredge-r770.nix
    ../modules/nfs/client.nix
    ../modules/disko-zfs.nix

    ../modules/vfio/iommu-intel.nix
    ../modules/dpdk.nix
  ];

  networking.hostName = "martha";

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNJ0X815781";

  system.stateVersion = "24.11";

  boot.hugepages1GB.number = 0;
  boot.hugepages2MB.number =
    let
      gb = 600;
    in
    gb * 1024 / 2;

  # external deduplicating zfs for large numbers of VMs
  # formating:
  # create linux partition with fdisk
  # sudo zpool create zokelmannvms -O acltype=posixacl -O xattr=sa -O compression=lz4 -O atime=off /dev/disk/by-partuuid/8523992b-aa9b-4d77-b23b-4ab0b20f0de4
  # sudo zfs create -o mountpoint=legacy zokelmannvms/vms
  fileSystems."/scratch/okelmann/vmuxIO/VMs" = {
    device = "zokelmannvms/vms";
    fsType = "zfs";
    # options = [ "uid=${builtins.toString config.users.users.okelmann.uid}" ];
  };
  systemd.services.set-vmount-owner = {
    description = "Set ownership of /scratch/okelmann/vmuxIO/VMs";
    after = [ "local-fs.target" ];
    wantedBy = [ "multi-user.target" ];
    script = "chown -R okelmann:users /scratch/okelmann/vmuxIO/VMs";
  };
}
