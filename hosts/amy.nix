{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
    ../modules/disko-zfs.nix
    ../modules/nfs/client.nix

    ../modules/xilinx.nix
    ../modules/xrdp.nix

    ../modules/amd_sev_snp.nix
    # ../modules/vfio/iommu-amd.nix
    ../modules/dpdk.nix
    # ../modules/zokelmannvms.nix # ZFS pool import fails currently
  ];

  networking.hostName = "amy";

  # Configuration for zokelmannvms module (when enabled)
  # services.zokelmannvms.partitionUuid = "ced04b7c-f718-4997-8306-c33fb44a04e2";

  # for some reason the disk naming/usage of /dev/nvme{0,1}n1 is
  # inconsistent on this server compared to others. Lets now be
  # super explicit, in case this is due to inconsistent device
  # naming by kernels.
  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL21T9HCJR-00A07_S64GNA0T724989";

  simd.arch = "znver3";
  system.stateVersion = "22.11";

  boot.hugepages1GB.number = 0;
  # boot.hugepages2MB.number = 0;
  boot.hugepages2MB.number =
    let
      gb = 1500;
    in
    gb * 1024 / 2;

  networking.doctor-bridge.enable = true;

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
}
