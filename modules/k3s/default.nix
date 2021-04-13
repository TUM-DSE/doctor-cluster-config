{ config, lib, pkgs, ... }:
let
  flannel = builtins.toJSON {
    name = "cbr0";
    cniVersion = "0.3.1";
    plugins = [
      {
        type = "flannel";
        delegate = {
          hairpinMode = true;
          forceAddress = true;
          isDefaultGateway = true;
        };
      }
      {
        type = "portmap";
        capabilities = {
          portMappings = true;
        };
      }
    ];
  };
in
{
  # TODO: Upstream this.
  options.virtualization.containerd.configText = lib.mkOption {
    type = lib.types.lines;
    default = "";
    description = ''
      Verbatim lines to add to containerd.toml
    '';
  };
  imports = [
    ./kata-containers.nix
  ];
  config = {
    services.k3s.enable = true;
    services.k3s.docker = lib.mkForce false;
    virtualisation.containerd.enable = true;

    virtualization.containerd.configText = ''
      [plugins.cri.containerd]
        snapshotter = "zfs"
      [plugins.cri.cni]
        bin_dir = "${pkgs.cni-plugins}/bin"
        conf_dir = "${pkgs.writeTextDir "net.d/10-flannel.conflist" flannel}/net.d"
    '';

    virtualisation.containerd.configFile = pkgs.writeText "containerd.toml" config.virtualization.containerd.configText;

    systemd.services.containerd.path = with pkgs; [ zfs ];

    systemd.services.containerd.serviceConfig = {
      ExecStartPre = "-${pkgs.zfs}/bin/zfs create -o mountpoint=/var/lib/containerd/io.containerd.snapshotter.v1.zfs zroot/containerd";
    };
  };
}
