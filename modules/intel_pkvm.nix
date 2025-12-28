{ pkgs, lib, config, ... }:
let
  ccacheWrapper = pkgs.writeShellScriptBin "ccache-gcc" ''
    export CCACHE_DIR=/var/cache/ccache
    export CCACHE_UMASK=000
    export CCACHE_SLOPPINESS=random_seed
    export CCACHE_MAXSIZE=20G
    exec ${pkgs.ccache}/bin/ccache ${pkgs.gcc}/bin/gcc "$@"
  '';
  linux = if config.programs.ccache.enable then
    (pkgs.callPackage ../pkgs/kernels/linux-pkvm.nix {
      /* stdenv = pkgs.ccacheStdenv; */
    }).overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ pkgs.ccache ];

      preConfigure = ''
        export KBUILD_BUILD_TIMESTAMP=""
        export SOURCE_DATE_EPOCH=0
        echo "Using ccache:"
        ccache -s
      '';

      makeFlags = (old.makeFlags or []) ++ [
        "CC=${ccacheWrapper}/bin/ccache-gcc"
        "HOSTCC=${ccacheWrapper}/bin/ccache-gcc"
      ];
    })
  else
    pkgs.callPackage ../pkgs/kernels/linux-pkvm.nix { };
  linuxPackages = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux);
in
{
  boot.kernelPackages = lib.mkForce linuxPackages;
  boot.zfs.package = pkgs.zfs_unstable; # needed for 6.18

  boot.kernelParams = [
    "kvm_intel.pkvm=1"
    "kvm_intel.tdx=1"
    "nohibernate"
  ];

  programs.ccache.packageNames = [ "zfs_unstable" ];
}
