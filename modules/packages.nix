{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    socat
    whois

    jq
    psmisc
    libarchive
    sipcalc
    iperf
    openssl
    binutils
    file
    wget
    htop
    silver-searcher
    lsof
    tcpdump
    tmux
    rsync
    git
    tig
    python3
    strace
    iotop
    man-pages
    dnsutils
    netcat
    mtr
    (neovim.override {vimAlias = true;})
    ripgrep
    pciutils

    # tries to default to soft-float due to out-dated cc-rs
  ] ++ lib.optional (!stdenv.hostPlatform.isRiscV) bandwhich
    # avoid compiling desktop stuff when doing cross nixos
    ++ lib.optionals (stdenv.hostPlatform == stdenv.buildPlatform) [
    # various terminfo packages
    termite.terminfo
    wezterm.terminfo
    kitty.terminfo
    foot.terminfo
  ];
}
