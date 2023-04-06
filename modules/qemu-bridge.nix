{ pkgs, ... }: {
  # Allow qemu to access bridges
  environment.etc."qemu/bridge.conf" = {
    user = "root";
    group = "qemu";
    mode = "640";
    text = "allow all";
  };

  # bridge.conf location is hardcoded in qemu-bridge-helper. Thus we expose a correct qemu-bridge-helper globally
  environment.systemPackages = [
    (pkgs.writeShellApplication {
      name = "qemu-bridge-helper";
      text = ''
        ${pkgs.qemu}/libexec/qemu-bridge-helper "$@"
      '';
    })
  ];

  # Don't manage tap devices with systemd-networkd
  systemd.network.networks."06-tap".extraConfig = ''
    [Match]
    Name = tap*

    [Link]
    Unmanaged = yes
  '';
}
