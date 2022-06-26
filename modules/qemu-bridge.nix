{
  # Allow qemu to access bridges
  environment.etc."qemu/bridge.conf" = {
    user = "root";
    group = "qemu";
    mode = "640";
    text = "allow all";
  };

  # Don't manage tap devices with systemd-networkd
  systemd.network.networks."06-tap".extraConfig = ''
    [Match]
    Name = tap*

    [Link]
    Unmanaged = yes
  '';
}
