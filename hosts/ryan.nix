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
    ../modules/nfs
    ../modules/xilinx.nix
    ../modules/xrdp-passwords.nix
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

  users.xrdpUsers = [ "justusvonderbeek" "rohanfernandez" "alexandermaslew" "zixuanli" ];
}
