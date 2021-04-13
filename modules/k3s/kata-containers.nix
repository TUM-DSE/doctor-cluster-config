{ config, lib, pkgs, ... }:
let
  kata-containers = pkgs.callPackage ../../pkgs/cata-containers {};
  configDir = "${kata-containers}/opt/kata/share/defaults/kata-containers";
  containerdShims = pkgs.runCommand "containerd-shims" {
    nativeBuildInputs = [ pkgs.makeWrapper ];
  } ''
    mkdir -p $out/bin
    for shim in fc qemu qemu-virtiofs clh; do
      makeWrapper ${kata-containers}/opt/kata/bin/containerd-shim-kata-v2 \
        $out/bin/containerd-shim-kata-$shim-v2 \
        --set KATA_CONF_FILE "${kata-containers}/opt/kata/share/defaults/kata-containers/configuration-$shim.toml"
    done
  '';
in
{
  systemd.services.containerd.path = [ containerdShims ];

  virtualization.containerd.configText = ''
    # comes from kata-deploy
    [plugins.cri.containerd.runtimes.kata]
      runtime_type = "io.containerd.kata.v2"
      privileged_without_host_devices = true
      pod_annotations = ["io.katacontainers.*"]
      [plugins.cri.containerd.runtimes.kata.options]
        ConfigPath = "${configDir}/configuration.toml"
    [plugins.cri.containerd.runtimes.kata-fc]
      runtime_type = "io.containerd.kata-fc.v2"
      privileged_without_host_devices = true
      pod_annotations = ["io.katacontainers.*"]
      [plugins.cri.containerd.runtimes.kata-fc.options]
        ConfigPath = "${configDir}/configuration-fc.toml"
    [plugins.cri.containerd.runtimes.kata-qemu]
      runtime_type = "io.containerd.kata-qemu.v2"
      privileged_without_host_devices = true
      pod_annotations = ["io.katacontainers.*"]
      [plugins.cri.containerd.runtimes.kata-qemu.options]
        ConfigPath = "${configDir}/configuration-qemu.toml"
    [plugins.cri.containerd.runtimes.kata-clh]
      runtime_type = "io.containerd.kata-clh.v2"
      privileged_without_host_devices = true
      pod_annotations = ["io.katacontainers.*"]
      [plugins.cri.containerd.runtimes.kata-clh.options]
        ConfigPath = "${configDir}/configuration-clh.toml"
  '';
}
