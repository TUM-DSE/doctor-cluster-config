{ callPackage
, buildFHSUserEnv
, runScript ? "bash -c"
, xilinxName ? "xilinx-env"
}:

let
  xrt = callPackage ./xrt.nix { };
in
buildFHSUserEnv {
  name = xilinxName;
  inherit runScript;
  targetPkgs = pkgs: with pkgs; [
    bash
    xrt
    coreutils
    zlib
    stdenv.cc.cc
    ncurses
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
    gtk2
    gtk3

    # from installLibs.sh
    graphviz
    gcc
    unzip
    nettools
  ];
  multiPkgs = null;
  profile = ''
    source /opt/xilinx/Vitis/*/settings64.sh
    export XILINX_XRT="${xrt}"
  '';
}
