{ config, lib, pkgs, ... }:
let
  kata-runtime = pkgs.callPackage ../../pkgs/kata-runtime { };
  kata-images = pkgs.callPackage ../../pkgs/kata-images { };
  settingsFormat = pkgs.formats.toml { };
  cfg = config.virtualisation.kata-containers;
  configFile = settingsFormat.generate "configuration.toml" cfg.settings;
in
{
  options = {
    virtualisation.kata-containers.settings = lib.mkOption {
      type = settingsFormat.type;
      default = { };
      description = ''
        Settings for kata's configuration.toml
      '';
    };
  };
  config = {
    virtualisation.kata-containers.settings = {
      hypervisor.qemu = {
        path = lib.mkDefault "${pkgs.qemu_kvm}/bin/qemu-kvm";
        kernel = lib.mkDefault "${kata-images}/share/kata-containers/vmlinux.container";
        image = lib.mkDefault "${kata-images}/share/kata-containers/kata-containers.img";
        machine_type = lib.mkDefault "pc";
        valid_hypervisor_paths = lib.mkDefault [
          cfg.settings.hypervisor.qemu.path
        ];
        cpu_features = lib.mkDefault "pmu=off";
        virtio_fs_daemon = lib.mkDefault "${pkgs.qemu_kvm}/libexec/virtiofsd";
        valid_virtio_fs_daemon_paths = lib.mkDefault [
          cfg.settings.hypervisor.qemu.virtio_fs_daemon
        ];
      };
      netmon.path = lib.mkDefault "${kata-runtime}/libexec/kata-containers/kata-netmon";
      runtime.internetworking_model = lib.mkDefault "tcfilter";
      runtime.sandbox_cgroup_only = lib.mkDefault config.systemd.enableUnifiedCgroupHierarchy;
    };
    systemd.services.containerd.path = [ kata-runtime ];

    virtualisation.containerd.settings = {
      version = 2;
      debug.level = "debug";
      plugins = {
        "io.containerd.grpc.v1.cri".containerd.untrusted_workload_runtime = {
          runtime_type = "io.containerd.kata.v2";
          options.ConfigPath = configFile;
        };
        "io.containerd.grpc.v1.cri".containerd.runtimes.runc.runtime_type = "io.containerd.runc.v2";
      };
    };
  };
}
