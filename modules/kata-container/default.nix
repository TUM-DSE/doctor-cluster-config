{ config, lib, pkgs, ... }:
let kata-runtime = pkgs.callPackage ../../pkgs/kata-runtime { };
in let
  kata-config =
    pkgs.callPackage ./default-config.nix { kata-runtime = kata-runtime; };
  kata-runtimes =
    pkgs.callPackage ../../pkgs/kata-runtime/kata-runtimes.nix { kata-runtime = kata-runtime; };
in {

  config = {
    environment.etc = {
      "kata-containers/configuration-qemu.toml".text = kata-config.qemu;
      "kata-containers/configuration-fc.toml".text = kata-config.fc;      
      "kata-containers/configuration-snp.toml".text = kata-config.snp;
    };

    virtualisation.docker.enable = true;
    virtualisation.docker.daemon.settings = {
      runtimes.kata-qemu.runtimeType =
        "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-qemu.options = {
        TypeUrl = "io.containerd.kata.v2.options";
        ConfigPath = "/etc/kata-containers/configuration-qemu.toml";
      };
      runtimes.kata-fc.runtimeType =
        "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-fc.options = {
        TypeUrl = "io.containerd.kata.v2.options";
        ConfigPath = "/etc/kata-containers/configuration-fc.toml";
      };
      runtimes.kata-snp.runtimeType =
        "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-snp.options = {
        TypeUrl = "io.containerd.kata.v2.options";
        ConfigPath = "/etc/kata-containers/configuration-snp.toml";
      };
    };

    virtualisation.containerd.enable = true;

    systemd.services.containerd.path = [
      "${kata-runtime}"
      pkgs.lvm2
      pkgs.util-linux
      pkgs.e2fsprogs
      "${kata-runtimes}"
    ];

    virtualisation.containerd.settings = {
      version = lib.mkForce 1;
      debug.level = "debug";
      plugins = {
        cri.cni = { bin_dir = "${pkgs.cni-plugins}/bin"; };

        "io.containerd.grpc.v1.cri".containerd = {
          default_runtime_name = "kata";
          runtimes = {
            kata-qemu = {
              runtime_type = "io.containerd.kata-qemu.v2";
              privileged_without_host_devices = true;
            };
            kata-fc = {
              runtime_type = "io.containerd.kata-fc.v2";
              privileged_without_host_devices = true;

            };
            kata-snp = {

              runtime_type = "io.containerd.kata-snp.v2";
              privileged_without_host_devices = true;
            };
          };
        };
      };
      plugins.devmapper = {
        pool_name = "devpool";
        root_path = "/var/lib/containerd/devmapper";
        base_image_size = "10GB";
        discard_blocks = true;
      };
    };
  };
}
