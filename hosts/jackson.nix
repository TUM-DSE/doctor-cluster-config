{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "jackson";

  # Don't manage vnet interface with systemd-networkd
  systemd.network.networks."05-jackson_experiments".extraConfig = ''
    [Match]
    Name=enp81s0f1
    [Network]
    Address=192.168.1.11/24
    [Link]
    Description=SN1000 Ethernet Adapter
  '';
#    Unmanaged=yes
  simd.arch = "icelake-server";

  system.stateVersion = "21.11";
}
