{ lib, ... }:
{
  imports = [
    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/hardware/poweredge7515.nix
    ../modules/dpdk.nix
    ../modules/nfs/client.nix
    ../modules/nfs
    ../modules/xilinx.nix
    # ../modules/amd_sev.nix
    ../modules/amd_sev_svsm_wallet.nix
    #../modules/amd_sev_snp.nix
    ../modules/vfio/iommu-amd.nix

    ../modules/kata-container

    # since the disk failure, ryan is partitioned with disko
    ../modules/disko-zfs.nix
  ];

  networking.hostName = "ryan";
  disko.rootDisk = "/dev/disk/by-id/nvme-eui.36314130547000630025384100000002";

  # 10GbE NICs for network benchmarks:
  # Broadcom BCM57416 NetXtreme-E Dual-Media
  # - e4:3d:1a:72:00:f0
  # - e4:3d:1a:72:00:f1

  # 10GbE NICs for university network
  # Broadcom BCM57416 NetXtreme-E Dual-Media
  # - 2c:ea:7f:af:56:78
  # - 2c:ea:7f:af:56:79
  #
  # IPMI/BMC:
  # -  d0:8e:79:ba:1a:22

  simd.arch = "znver3";

  system.stateVersion = "21.05";

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
  systemd.network.networks."05-ryan_vnet".extraConfig = ''
    [Match]
    Name = vnet*
    [Link]
    Unmanaged = yes
  '';
  systemd.network.networks."05-ryan_sn1000_host".extraConfig = ''
    [Match]
    Name=enp198s0f0
    [Network]
    Address=192.168.1.10/24
    [Link]
    Description=SN1000 Host Interface
  '';
  systemd.network.networks."05-ryan_sn1000_host_alt".extraConfig = ''
    [Match]
    Name=enp198s0f0np0
    [Network]
    Address=192.168.1.10/24
    [Link]
    Description=SN1000 Host Interface
  '';
  systemd.network.networks."05-ryan_sn1000_arm".extraConfig = ''
    [Match]
    Name=eth5
    [Network]
    Address=192.168.1.20/24
    [Link]
    Description=SN1000 Arm Representor Interface
  '';
}
