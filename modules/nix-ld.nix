{ config, lib, pkgs, ... }:
{
  # Enable nix ld
  programs.nix-ld.enable = true;

  environment.variables = with pkgs;  {
     NIX_LD = toString (pkgs.runCommand "ld.so" {} ''
       ln -s "$(cat '${pkgs.stdenv.cc}/nix-support/dynamic-linker')" $out
     '');
     NIX_LD_LIBRARY_PATH =
      let
        ld_library_path = pkgs.buildEnv {
          name = "lb-library-path";
          paths = map lib.getLib [
            stdenv.cc.cc
            zlib
            fuse3
            alsa-lib
            at-spi2-atk
            atk
            cairo
            cups
            curl
            dbus
            expat
            fontconfig
            freetype
            gdk-pixbuf
            glib
            gtk2
            gtk3
            libGL
            libappindicator-gtk3
            libdrm
            libnotify
            libpulseaudio
            libuuid
            libxkbcommon
            mesa
            nspr
            nss
            pango
            pipewire
            systemd
            xorg.libX11
            xorg.libXScrnSaver
            xorg.libXcomposite
            xorg.libXcursor
            xorg.libXdamage
            xorg.libXext
            xorg.libXfixes
            xorg.libXi
            xorg.libXrandr
            xorg.libXrender
            xorg.libXtst
            xorg.libxkbfile
            xorg.libxshmfence
            xorg.libXft
            xorg.libxcb
            zlib
            (lib.lowPrio ncurses5) # xgdb from xilinx vitis
            ncurses
          ];

          ignoreCollisions = true;
        };
      in
      "${ld_library_path}/lib";
  };
}
