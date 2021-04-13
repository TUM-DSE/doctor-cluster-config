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

    # comes from kata-deploy
    [plugins.cri.containerd.runtimes.kata]
      runtime_type = "io.containerd.kata.v2"
      privileged_without_host_devices = true
      pod_annotations = ["io.katacontainers.*"]
      [plugins.cri.containerd.runtimes.kata.options]
        ConfigPath = "/opt/kata/share/defaults/kata-containers/configuration.toml"
    [plugins.cri.containerd.runtimes.kata-fc]
      runtime_type = "io.containerd.kata-fc.v2"
      privileged_without_host_devices = true
      pod_annotations = ["io.katacontainers.*"]
      [plugins.cri.containerd.runtimes.kata-fc.options]
        ConfigPath = "/opt/kata/share/defaults/kata-containers/configuration-fc.toml"
    [plugins.cri.containerd.runtimes.kata-qemu]
      runtime_type = "io.containerd.kata-qemu.v2"
      privileged_without_host_devices = true
      pod_annotations = ["io.katacontainers.*"]
      [plugins.cri.containerd.runtimes.kata-qemu.options]
        ConfigPath = "/opt/kata/share/defaults/kata-containers/configuration-qemu.toml"
    [plugins.cri.containerd.runtimes.kata-clh]
      runtime_type = "io.containerd.kata-clh.v2"
      privileged_without_host_devices = true
      pod_annotations = ["io.katacontainers.*"]
      [plugins.cri.containerd.runtimes.kata-clh.options]
        ConfigPath = "/opt/kata/share/defaults/kata-containers/configuration-clh.toml"
  '';

  # HACK: scripts in /opt/kata/ use /bin/bash
  # atomically replace /usr/bin/env
  system.activationScripts.binbash = ''
    mkdir -m 0755 -p /bin
    ln -sfn /bin/sh /bin/.bash.tmp
    mv /bin/.bash.tmp /bin/bash
   '';

  systemd.services.containerd.path = with pkgs; [ zfs ];

  systemd.services.containerd.serviceConfig = {
    ExecStartPre = "-${pkgs.zfs}/bin/zfs create -o mountpoint=/var/lib/containerd/io.containerd.snapshotter.v1.zfs zroot/containerd";
  };
}
