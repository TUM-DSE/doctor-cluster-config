{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/bonding.nix

    ../modules/hardware/supermicro-X12SCZ-TLN4F.nix
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
}
