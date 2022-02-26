{ lib, config, pkgs, ... }: {
  imports = [
    ../modules/hardware/poweredge7515.nix
    ../modules/nfs/client.nix
  ];

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
}
