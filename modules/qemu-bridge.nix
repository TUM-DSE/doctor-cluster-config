{
  pkgs,
  lib,
  config,
  ...
}:
{

  # Allow qemu to access bridges
  environment.etc."qemu/bridge.conf" = {
    user = "root";
    group = "qemu";
    mode = "640";
    text = "allow all";
  };

  security.wrappers.qemu-bridge-helper = lib.mkIf (!config.virtualisation.libvirtd.enable) {
    setuid = true;
    owner = "root";
    group = "root";
    source = "${pkgs.qemu_kvm}/libexec/qemu-bridge-helper";
  };

  # Don't manage tap devices with systemd-networkd
  systemd.network.networks."06-tap".extraConfig = ''
    [Match]
    Name = tap*

    [Link]
    Unmanaged = yes
  '';
}
