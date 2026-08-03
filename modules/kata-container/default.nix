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
  kata-qemu-wrapper = pkgs.writeShellScript "kata-qemu-wrapper" ''
    # for some reason i cant get cata containers to come online without this wrapper
    echo "=== QEMU wrapper invoked ===" >> /tmp/kata-serial.log
    echo "args: $@" >> /tmp/kata-serial.log

    args=()
    for arg in "$@"; do
        if [[ "$prev" == "-append" ]]; then
            arg="$arg console=ttyS0"
        fi
        args+=("$arg")
        prev="$arg"
    done

    exec /nix/store/imgp0yqf4d6g8q57lmz6xkb95q5gk25w-qemu-8.2.0/bin/qemu-system-x86_64 "''${args[@]}" -serial file:/tmp/kata-serial.log
  '';
  kata-qemu-slick-toml = pkgs.runCommand "configuration-qemu-slick.toml" { } ''
    sed -E 's|^[[:space:]]*path[[:space:]]*=.*|path = "${kata-qemu-wrapper}"|' \
      ${pkgs.writeText "configuration-qemu.toml" kata-config.qemu.content} > $out
  '';
  kata-qemu-snp-wrapper = pkgs.writeShellScript "kata-qemu-snp-wrapper" ''
    echo "=== QEMU SNP wrapper invoked ===" >> /tmp/kata-serial.log
    echo "args: $@" >> /tmp/kata-serial.log

    # Boot via the COCONUT SVSM IGVM (contains SVSM + OVMF) instead of kata's
    # AMDSEV.fd, which this AMD-patched QEMU 8.2.0 cannot parse
    # (snp_populate_metadata_pages: Invalid memory type '4' = SVSM_CAA section).
    igvm="/scratch/okelmann/Wallet-VMPL4/svsm/bin/coconut-qemu.igvm"

    args=()
    skip=""
    prev=""
    for arg in "$@"; do
        if [[ -n "$skip" ]]; then
            skip=""
            continue
        fi
        case "$arg" in
            -bios)
                # firmware comes from the IGVM; drop "-bios <AMDSEV.fd>"
                skip=1
                continue
                ;;
            sev-snp-guest,*)
                # kernel-hashes needs a hashes table in a -bios image; not usable with igvm-file
                arg="''${arg//,kernel-hashes=on/}"
                arg="$arg,init-flags=4,igvm-file=$igvm"
                ;;
        esac
        if [[ "$prev" == "-append" ]]; then
            arg="$arg console=ttyS0"
        fi
        args+=("$arg")
        prev="$arg"
    done

    exec /nix/store/imgp0yqf4d6g8q57lmz6xkb95q5gk25w-qemu-8.2.0/bin/qemu-system-x86_64 "''${args[@]}" -serial file:/tmp/kata-serial.log
  '';
  kata-qemu-snp-slick-toml = pkgs.runCommand "configuration-qemu-snp-slick.toml" { } ''
    sed -E \
      -e 's|^[[:space:]]*path[[:space:]]*=.*|path = "${kata-qemu-snp-wrapper}"|' \
      -e 's|^[[:space:]]*default_memory[[:space:]]*=.*|default_memory = 16384|' \
      -e 's|^[[:space:]]*shared_fs[[:space:]]*=.*|shared_fs = "virtio-fs"|' \
      ${pkgs.writeText "configuration-qemu-snp.toml" kata-config.snp.content} > $out
  '';
in
{

  config = {
    environment.etc = {
      "kata-containers/configuration-qemu.toml".text = kata-config.qemu;
      "kata-containers/configuration-qemu-slick.toml".source = kata-qemu-slick-toml;
      "kata-containers/configuration-qemu-snp-slick.toml".source = kata-qemu-snp-slick-toml;
      "kata-containers/configuration-fc.toml".text = kata-config.fc;
      "kata-containers/configuration-snp.toml".text = kata-config.snp;
    };

    virtualisation.docker.enable = true;
    virtualisation.docker.package = pkgs.docker_25; # docker 25 is the last version where kata-container's networking works (https://github.com/kata-containers/kata-containers/issues/12284)
    virtualisation.docker.daemon.settings = {
      runtimes.kata-qemu.runtimeType = "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-qemu.options = {
        TypeUrl = "io.containerd.kata.v2.options";
        ConfigPath = "/etc/kata-containers/configuration-qemu.toml";
      };
      runtimes.kata-qemu-slick.runtimeType = "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-qemu-slick.options = {
        TypeUrl = "io.containerd.kata.v2.options";
        ConfigPath = "/etc/kata-containers/configuration-qemu-slick.toml";
      };
      runtimes.kata-qemu-snp-slick.runtimeType = "${kata-runtime}/bin/containerd-shim-kata-v2";
      runtimes.kata-qemu-snp-slick.options = {
        TypeUrl = "io.containerd.kata.v2.options";
        ConfigPath = "/etc/kata-containers/configuration-qemu-snp-slick.toml";
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
