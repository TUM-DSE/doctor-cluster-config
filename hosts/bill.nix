{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/bonding.nix

    ../modules/hardware/supermicro-X12SCZ-TLN4F.nix
    ../modules/disko-zfs.nix
    ../modules/nfs/client.nix
    ../modules/dpdk.nix

    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/xrdp-passwords.nix
  ];

  networking.hostName = "bill";

  networking.doctowho.bonding.macs = [
    "b8:ce:f6:0b:ee:64"
    "b8:ce:f6:0b:ee:65"
  ];

  simd.arch = "skylake";

  # unused 1Gbit/s port, messes up k3s networking
  systemd.network.networks."05-unmanaged".extraConfig = ''
    [Match]
    MACAddress = b0:3a:f2:b6:05:9f 3c:ec:ef:2c:f5:54 3c:ec:ef:2c:f5:55

    [Link]
    ActivationPolicy = down
  '';

  system.stateVersion = "20.09";

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL21T9HCJR-00A07_S64GNA0T724988";

  boot.hugepages1GB.number = 8;

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

}
