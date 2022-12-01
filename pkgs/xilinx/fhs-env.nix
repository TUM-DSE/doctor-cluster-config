{
  callPackage,
  buildFHSUserEnv,
  runScript ? "bash -c",
  xilinxName ? "xilinx-env",
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

      # to compile some xilinx examples
      opencl-clhpp
      ocl-icd
      opencl-headers

      (pkgs.runCommand "firmware" {} ''
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
    source /share/xilinx/Vitis/2021.2/settings64.sh
  '';
}
