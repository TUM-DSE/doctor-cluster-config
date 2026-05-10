{ buildFHSEnv
, runScript ? "bash -c"
, xilinxName ? "xilinx-env"
, vivadoVersion ? "2023.2"
,
}:
let
  # Map Vivado version to its top-level settings64.sh.
  # Sourcing this single file pulls in Vivado + Vitis (+ Vitis HLS, which is
  # bundled inside Vitis from 2024.x onward) + Model Composer + DocNav.
  settingsScript =
    if vivadoVersion == "2023.2" then "/share/xilinx/Vitis/2023.2/settings64.sh"
    else if vivadoVersion == "2025.1" then "/share/xilinx/2025.1/Vivado/settings64.sh"
    else throw "fhs-env.nix: unsupported vivadoVersion ${vivadoVersion}";
in
buildFHSEnv {
  name = xilinxName;
  inherit runScript;
  targetPkgs = pkgs:
    with pkgs; let
      ncurses' = ncurses5.overrideAttrs (old: {
        configureFlags = old.configureFlags ++ ["--with-termlib"];
        postFixup = "";
      });
    in [
      bash
      coreutils
      zlib
      lsb-release
      stdenv.cc.cc
      # https://github.com/NixOS/nixpkgs/issues/218534
      # postFixup would create symlinks for the non-unicode version but since it breaks
      # in buildFHSEnv, we just install both variants
      ncurses'
      (ncurses'.override { unicodeSupport = false; })
      # Vivado 2025.1 looks for libtinfo.so.6, which lives in ncurses6 (the default `ncurses`).
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
      libxcrypt-legacy
      gtk2
      gtk3
      cmake
      gnumake
      binutils
      nasm
      glibc.dev

      # dtc libraries
      libyaml

      # vivado-riscv libraries
      libmpc
      mpfr
      gmp

      (python3.withPackages (ps: with ps; [ jinja2 ]))

      (libidn.overrideAttrs (_old: {
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
  multiPkgs = ps: [];
  profile = ''
    source ${settingsScript}
  '';
}
