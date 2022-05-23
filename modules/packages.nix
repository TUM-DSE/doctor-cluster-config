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
    bandwhich
    iotop
    man-pages
    dnsutils
    netcat
    mtr
    (neovim.override {vimAlias = true;})
    ripgrep
    pciutils
  ];
}
