{ config, ... }: {
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
    ../modules/nfs/client.nix

    ../modules/intel-fpgas.nix
    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/xrdp-passwords.nix

    ../modules/amd_sev_snp.nix
    #../modules/amd_sev_svsm.nix
    ../modules/vfio/iommu-amd.nix
    ../modules/dpdk.nix
  ];

  boot.hugepages1GB.number = 0;
  # boot.hugepages2MB.number = 0;
  boot.hugepages2MB.number = let 
    gb = 100;
  in gb * 1024 / 2;
  # blacklist kernel module that conflicts with the Intel FPGA OpenCL driver
  boot.blacklistedKernelModules = [ "altera_cvp" ];

  networking.hostName = "rose";

  simd.arch = "znver3";
  system.stateVersion = "22.11";

  # peters benchmarks seem to trigger envfs to hang up, rendering the enire system unusable
  services.envfs.enable = false;

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
  ];

  # Don't manage vnet interface with systemd-networkd
  systemd.network.networks."05-rose_vnet".extraConfig = ''
    [Match]
    Name = vnet*
    [Link]
    Unmanaged = yes
  '';
}
