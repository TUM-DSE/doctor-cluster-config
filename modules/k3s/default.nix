{ config, lib, pkgs, ... }:
let
  flannel = builtins.toJSON {
    name = "cbr0";
    cniVersion = "0.3.1";
    plugins = [{
      type = "flannel";
      delegate = {
        hairpinMode = true;
        forceAddress = true;
        isDefaultGateway = true;
      };
    } {
      type = "portmap";
      capabilities = {
        portMappings = true;
      };
    }];
  };
in {
  services.k3s.enable = true;
  services.k3s.docker = lib.mkForce false;
  virtualisation.containerd.enable = true;

  virtualisation.containerd.configFile = pkgs.writeText "containerd.toml" ''
    [plugins.cri.containerd]
      snapshotter = "zfs"
    [plugins.cri.cni]
      bin_dir = "${pkgs.cni-plugins}/bin"
      conf_dir = "${pkgs.writeTextDir "net.d/10-flannel.conflist" flannel}/net.d"
  '';
  systemd.services.containerd.path = with pkgs; [ zfs ];

  systemd.services.containerd.serviceConfig = {
    ExecStartPre = "-${pkgs.zfs}/bin/zfs create -o mountpoint=/var/lib/containerd/io.containerd.snapshotter.v1.zfs zroot/containerd";
  };
}
