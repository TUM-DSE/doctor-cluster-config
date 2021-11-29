{ lib, config, pkgs, ... }: {
  imports = [
    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/hardware/poweredge7515.nix
    ../modules/nfs/client.nix
  ];
  networking.hostName = "graham";
  networking.retiolum = {
    ipv4 = "10.243.29.199";
    ipv6 = "42:0:3c46:ab64:fa7c:171a:c94a:ac19";
  };

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
}
