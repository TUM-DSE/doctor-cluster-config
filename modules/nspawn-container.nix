{
  modulesPath,
  lib,
  pkgs,
  config,
  ...
}:

# NixOS as systemd-nspawn container inside an RBG Ubuntu VM.
# The Ubuntu side (nspawn unit, rootfs, host keys) is set up by
# modules/monitoring/apply.sh (ansible).
{
  imports = [
    (modulesPath + "/virtualisation/lxc-container.nix")
  ];

  # also adds /etc/os-release to the tarball, which machinectl wants
  system.build.tarball = lib.mkForce (
    pkgs.callPackage (pkgs.path + "/nixos/lib/make-system-tarball.nix") {
      extraArgs = "--owner=0";

      storeContents = [
        {
          object = config.system.build.toplevel;
          symlink = "none";
        }
      ];

      contents = [
        {
          source = config.system.build.toplevel + "/init";
          target = "/sbin/init";
        }
        {
          source = config.system.build.toplevel + "/etc/os-release";
          target = "/etc/os-release";
        }
      ];

      extraCommands = "mkdir -p proc sys dev";
    }
  );

  # host sshd owns :22
  services.openssh.ports = [ 2222 ];
  services.openssh.startWhenNeeded = false;

  # shared network namespace, the Ubuntu host manages the uplink
  systemd.network.networks."ethernet".extraConfig = ''
    [Match]
    Type = ether

    [Link]
    Unmanaged = yes
  '';

  services.resolved.enable = false;
}
