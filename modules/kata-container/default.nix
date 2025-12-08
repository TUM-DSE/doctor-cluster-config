{
  config,
  lib,
  pkgs,
  ...
}:
let
  kata-runtime = pkgs.callPackage ../../pkgs/kata-runtime { };
in
let
  kata-config = pkgs.callPackage ./default-config.nix { kata-runtime = kata-runtime; };
  kata-runtimes = pkgs.callPackage ../../pkgs/kata-runtime/kata-runtimes.nix {
    kata-runtime = kata-runtime;
  };
in
{

  config = {
    environment.etc = {
      "kata-containers/configuration-qemu.toml".text = kata-config.qemu;
      "kata-containers/configuration-fc.toml".text = kata-config.fc;
      "kata-containers/configuration-snp.toml".text = kata-config.snp;
    };

    virtualisation.docker.enable = true;
    virtualisation.docker.daemon.settings = {
      runtimes.kata-qemu.runtimeType = "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-qemu.options = {
        TypeUrl = "io.containerd.kata.v2.options";
        ConfigPath = "/etc/kata-containers/configuration-qemu.toml";
      };
      runtimes.kata-qemu-gpu.runtimeType = "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-qemu-gpu.options = {
	TypeUrl = "io.containerd.kata.v2.options";
	ConfigPath = "/etc/kata-containers/configuration-qemu-gpu.toml";
      };
      runtimes.kata-snp-gpu.runtimeType = "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-snp-gpu.options = {
        TypeUrl = "io.containerd.kata.v2.options";
        ConfigPath = "/etc/kata-containers/configuration-qemu-snp-gpu.toml";
      };
      runtimes.kata-snp.runtimeType = "${kata-runtime}/bin/containerd-shim-kata-v2";
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
		debug.level = "debug";
	 };


  };
}
