{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    socat
    whois

    psmisc
    bsdtar
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
    python
    python3
    strace
    nethogs
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
