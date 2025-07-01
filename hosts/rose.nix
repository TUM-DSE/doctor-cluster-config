{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
    ../modules/nfs/client.nix
    ../modules/disko-zfs.nix

    ../modules/intel-fpgas.nix
    ../modules/xilinx.nix
    ../modules/xrdp.nix

    ../modules/amd_sev_snp.nix
    #../modules/amd_sev_svsm.nix
    ../modules/vfio/iommu-amd.nix
    ../modules/dpdk.nix
    # ../modules/zokelmannvms.nix # ZFS pool import fails currently
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL21T9HCJR-00A07_S64GNA0T724988";

  # Configuration for zokelmannvms module (when enabled)
  # services.zokelmannvms.partitionUuid = "ced04b7c-f718-4997-8306-c33fb44a04e2";

  boot.hugepages1GB.number = 0;
  # boot.hugepages2MB.number = 0;
  boot.hugepages2MB.number =
    let
      gb = 1500;
    in
    gb * 1024 / 2;
  # blacklist kernel module that conflicts with the Intel FPGA OpenCL driver
  boot.blacklistedKernelModules = [ "altera_cvp" ];

  networking.hostName = "rose";

  simd.arch = "znver3";
  system.stateVersion = "22.11";

  # peters benchmarks seem to trigger envfs to hang up, rendering the enire system unusable
  services.envfs.enable = false;

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

  # Don't manage vnet interface with systemd-networkd
  systemd.network.networks."05-rose_vnet".extraConfig = ''
    [Match]
    Name = vnet*
    [Link]
    Unmanaged = yes
  '';
}
