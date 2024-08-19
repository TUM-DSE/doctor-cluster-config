{
  imports = [
    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/hardware/poweredge7515.nix
    ../modules/nfs/client.nix
    ../modules/buildbot/worker.nix
    ../modules/amd_sev.nix
    ../modules/dpdk.nix
    ../modules/vfio/iommu-amd.nix
    ../modules/disko-zfs.nix
  ];

  boot.hugepages1GB.number = 8;

  networking.hostName = "graham";

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZ1L23T8HBLA-00A07_S667NJ0T732147";

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

  simd.arch = "znver3";

  system.stateVersion = "21.05";

  networking.doctor-bridge.enable = true;

  # Remove once CGO artifact evaluation is over
  services.openssh.extraConfig = ''
    Match User cgoPixel8
        AllowTcpForwarding yes
        X11Forwarding no
        AllowAgentForwarding no
        PermitTunnel no
        PermitTTY no
        PasswordAuthentication no
    Match all # end match block
  '';
}
