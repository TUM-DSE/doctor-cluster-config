{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/hardware/poweredge7515.nix
    ../modules/nfs/client.nix
    ../modules/buildbot/worker.nix
    #../modules/amd_sev.nix
    ../modules/dpdk.nix
    ../modules/iommu-intel.nix
  ];

  boot.hugepages.size = "1GB";
  boot.hugepages.number = 8;

  networking.hostName = "graham";

  # 10GbE NICs for network benchmarks:
  # Broadcom BCM57416 NetXtreme-E Dual-Media
  # - e4:3d:1a:71:d6:b0
  # - e4:3d:1a:71:d6:b1

  # 10GbE NICs for university network
  # Broadcom BCM57416 NetXtreme-E Dual-Media
  # - 2c:ea:7f:af:57:18
  # - 2c:ea:7f:af:57:19
  #
  # IPMI/BMC:
  # - d0:8e:79:ba:02:1a

  system.stateVersion = "21.05";

  # Don't manage vnet interface with systemd-networkd
  #systemd.network.networks."05-vnet".extraConfig = ''
  #  [Match]
  #  Name = vnet*
  #  [Link]
  #  Unmanaged = yes
  #'';
}
