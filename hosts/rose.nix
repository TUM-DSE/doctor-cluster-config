{ config, ...}: {
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
    ../modules/nfs/client.nix

    ../modules/intel-fpgas.nix
    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/xrdp-passwords.nix

    ../modules/amd_sev_snp.nix
    #../modules/amd_sev_svsm.nix
    ../modules/vfio/iommu-amd.nix
    ../modules/dpdk.nix
  ];

  boot.hugepages.size = "1GB";
  boot.hugepages.number = 8;

  networking.hostName = "rose";

  simd.arch = "znver3";
  system.stateVersion = "22.11";

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
  users.xrdpUsers = [ 
    "xilinx"
    "atsushi" 
  ];

  # Don't manage vnet interface with systemd-networkd
  systemd.network.networks."05-rose_vnet".extraConfig = ''
    [Match]
    Name = vnet*
    [Link]
    Unmanaged = yes
  '';
}
