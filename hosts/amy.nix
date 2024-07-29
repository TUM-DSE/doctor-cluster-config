{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
    ../modules/disko-zfs.nix
    ../modules/nfs/client.nix

    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/xrdp-passwords.nix

    ../modules/vfio/iommu-amd.nix
    ../modules/dpdk.nix
  ];

  networking.hostName = "amy";

  # for some reason the disk naming/usage of /dev/nvme{0,1}n1 is
  # inconsistent on this server compared to others. Lets now be
  # super explicit, in case this is due to inconsistent device
  # naming by kernels. 
  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL21T9HCJR-00A07_S64GNA0T724989";

  simd.arch = "znver3";
  system.stateVersion = "22.11";

  boot.hugepages1GB.number = 0;
  # boot.hugepages2MB.number = 0;
  boot.hugepages2MB.number = let
    gb = 1500;
  in gb * 1024 / 2;

  # external deduplicating zfs for large numbers of VMs
  # formating:
  # create linux partition with fdisk
  # sudo zpool create zokelmannvms -O acltype=posixacl -O xattr=sa -O compression=lz4 -O atime=off /dev/disk/by-partuuid/ced04b7c-f718-4997-8306-c33fb44a04e2
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

  # manually added to load xilinx from
  fileSystems."/share" = {
    device = "nfs:/export/share";
    fsType = "nfs4";
    options = [
      "nofail"
      "ro"
      "timeo=14"
    ];
  };
  users.xrdpUsers = [ 
    "xilinx"
    "atsushi" 
    "chenjiyang"
    "anubhav"
  ];
}
