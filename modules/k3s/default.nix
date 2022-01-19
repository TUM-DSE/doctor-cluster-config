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
  config = {
    services.k3s.enable = true;
    services.k3s.docker = lib.mkForce false;
    virtualisation.containerd.enable = true;
    virtualisation.containerd.settings = {
      version = 2;
      plugins."io.containerd.grpc.v1.cri" = {
        cni.conf_dir = "${pkgs.writeTextDir "net.d/10-flannel.conflist" flannel}/net.d";
        # FIXME: upstream
        cni.bin_dir = "${pkgs.runCommand "cni-bin-dir" {} ''
          mkdir -p $out
          ln -sf ${pkgs.cni-plugins}/bin/* ${pkgs.cni-plugin-flannel}/bin/* $out
        ''}";
      };
    };

    environment.systemPackages = [
      (pkgs.writeShellScriptBin "k3s-reset-node" (builtins.readFile ./k3s-reset-node))
    ];
    systemd.services.containerd.serviceConfig = {
      ExecStartPre = [
        "-${pkgs.zfs}/bin/zfs create -o mountpoint=/var/lib/containerd/io.containerd.snapshotter.v1.zfs zroot/containerd"
      ];
    };
  };
}
