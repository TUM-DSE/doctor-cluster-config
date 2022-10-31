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
    ../modules/dpdk.nix
    # disable home because ryan is used for teaching this semester.
    #../modules/nfs/client.nix
  ];

  boot.hugepages.size = "1GB";
  boot.hugepages.number = 8;

  networking.hostName = "ryan";

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
  system.stateVersion = "21.05";

  # Don't manage tap devices with systemd-networkd
  systemd.network.networks."06-peter".extraConfig = ''
    [Match]
    Name = enp129s0f?

    [Link]
    Unmanaged = yes
  '';
}
