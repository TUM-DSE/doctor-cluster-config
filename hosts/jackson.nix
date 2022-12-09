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
  systemd.network.networks."05-tmp".extraConfig = ''
    [Match]
    Name = enp81s0f*
    [Link]
    Unmanaged = yes
  '';

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";
}
