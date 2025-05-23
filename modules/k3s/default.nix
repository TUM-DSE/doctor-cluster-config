{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = {
    services.k3s.enable = true;
    virtualisation.containerd.enable = true;
    virtualisation.containerd.settings = {
      version = 2;
      plugins."io.containerd.grpc.v1.cri" = {
        cni.conf_dir = "/var/lib/rancher/k3s/agent/etc/cni/net.d/";
        # FIXME: upstream
        cni.bin_dir = "${pkgs.runCommand "cni-bin-dir" { } ''
          mkdir -p $out
          ln -sf ${pkgs.cni-plugins}/bin/* ${pkgs.cni-plugin-flannel}/bin/* $out
        ''}";
      };
    };

    environment.systemPackages = [
      (pkgs.writeShellScriptBin "k3s-reset-node" (builtins.readFile ./k3s-reset-node))
    ];

    systemd.services.k3s = {
      wants = [ "containerd.service" ];
      after = [ "containerd.service" ];
    };

    systemd.services.containerd.serviceConfig = {
      ExecStartPre = [
        "-${config.boot.zfs.package}/bin/zfs create -o mountpoint=/var/lib/containerd/io.containerd.snapshotter.v1.zfs zroot/containerd"
      ];
    };

    sops.secrets.k3s-server-token.sopsFile = ./secrets.yml;
    services.k3s.tokenFile = lib.mkDefault config.sops.secrets.k3s-server-token.path;
  };
}
