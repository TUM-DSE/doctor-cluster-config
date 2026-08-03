{ lib, pkgs, ... }:
{
  # Enable nix ld
  programs.nix-ld.enable = !pkgs.stdenv.hostPlatform.isRiscV;
  programs.nix-ld.libraries = with pkgs; [
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
    icu
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
    libx11
    libxscrnsaver
    libxcomposite
    libxcursor
    libxdamage
    libxext
    libxfixes
    libxi
    libxrandr
    libxrender
    libxtst
    libxkbfile
    libxshmfence
    libxft
    libxcb
    zlib
    (lib.lowPrio ncurses5) # xgdb from xilinx vitis
    ncurses
    libxcrypt
  ];
}
