{
  imports = [
    ../modules/bonding.nix
    ../modules/ipmi-supermicro.nix
    ../modules/sys-prog/users.nix
    ../modules/hardware/supermicro-X12SCZ-TLN4F.nix
  ];

  networking.hostName = "nardole";

  # unused 1Gbit/s port, messes up k3s networking
  systemd.network.networks."05-unmanaged".extraConfig = ''
    [Match]
    MACAddress = b0:3a:f2:b6:05:9f 3c:ec:ef:2c:f5:14 3c:ec:ef:2c:f5:15

    [Link]
    ActivationPolicy = down
  '';

  programs.ssh.knownHosts = {
    bill.hostNames = [ "nfs" "nfs-backup" ];
    bill.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGurhMZktK5kPgxj8GVPEhjH5aa/ZXrG/FjXnWOIjNrS";
  };

  networking.doctowho.bonding.macs = [
    "b8:ce:f6:0b:ee:74"
    "b8:ce:f6:0b:ee:75"
  ];

  simd.arch = "skylake";

  system.stateVersion = "20.09";
}
