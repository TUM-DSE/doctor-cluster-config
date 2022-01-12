{ pkgs, ... }:
{
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
    ag
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
    manpages
    dnsutils
    netcat
    mtr
    (neovim.override { vimAlias = true; })
    ripgrep
    pciutils
  ];
}
