{ pkgs, ... }: {
  # this extends the list from:
  # https://github.com/numtide/srvos/blob/master/server.nix#L10
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
    ripgrep
    lsof
    tcpdump
    rsync
    git
    tig
    lazygit
    python3
    iotop
    man-pages
    netcat
    mtr
    (neovim.override { vimAlias = true; })

    pciutils
    ethtool
    usbutils

    ipmitool
    # tries to default to soft-float due to out-dated cc-rs
  ] ++ lib.optional (!stdenv.hostPlatform.isRiscV) bandwhich;
}
