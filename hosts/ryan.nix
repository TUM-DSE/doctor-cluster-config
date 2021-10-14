{ lib, config, pkgs, ... }: {
  imports = [
    ../modules/hardware/poweredge7515.nix
  ];
  networking.hostName = "ryan";
  networking.retiolum = {
    ipv4 = "10.243.29.198";
    ipv6 = "42:0:3c46:53a7:e0e3:a2b6:471d:44a";
  };

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

  networking.interfaces.eno8303.macAddress = "3c:ec:ef:2c:f5:15";

  system.stateVersion = "21.05";
}
