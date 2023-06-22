{ buildFHSUserEnv
, runScript ? "bash -c"
, xilinxName ? "xilinx-env"
,
}:
buildFHSUserEnv {
  name = xilinxName;
  inherit runScript;
  targetPkgs = pkgs:
    with pkgs; [
      bash
      coreutils
      zlib
      lsb-release
      stdenv.cc.cc
      ncurses5
      xorg.libXext
      xorg.libX11
      xorg.libXrender
      xorg.libXtst
      xorg.libXi
      xorg.libXft
      xorg.libxcb
      xorg.libxcb
      # common requirements
      freetype
      fontconfig
      glib
      libxcrypt
      gtk2
      gtk3

      (libidn.overrideAttrs (old: {
        # we need libidn.so.11 but nixpkgs has libidn.so.12
        src = fetchurl {
          url = "mirror://gnu/libidn/libidn-1.34.tar.gz";
          sha256 = "sha256-Nxnil18vsoYF3zR5w4CvLPSrTpGeFQZSfkx2cK//bjw=";
        };
      }))

      # to compile some xilinx examples
      opencl-clhpp
      ocl-icd
      opencl-headers

      (pkgs.runCommand "firmware" { } ''
        mkdir -p $out/lib/firmware
        ln -s /host/lib/firmware/xilinx $out/lib/firmware/xilinx
      '')

      # from installLibs.sh
      graphviz
      (lib.hiPrio gcc)
      unzip
      nettools
    ];
  multiPkgs = null;
  profile = ''
    source /share/xilinx/Vitis/2022.1/settings64.sh
  '';
}
