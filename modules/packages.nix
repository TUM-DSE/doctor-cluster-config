{ pkgs, inputs, ... }:
{
  # this extends the list from:
  # https://github.com/numtide/srvos/blob/master/server.nix#L10
  environment.systemPackages =
    with pkgs;
    [
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
      (
        # needs luajit: https://github.com/LuaJIT/LuaJIT/pull/1267
        if stdenv.hostPlatform.isRiscV then
          vim
        else
          neovim.override {
            vimAlias = true;
            withRuby = false;
          }
      )
      pciutils
      ethtool
      usbutils
      smartmontools # smartctl
      nvme-cli # nvmectl
      edac-utils # edac-util: memory/pci errors

      # cluster management
      inputs.hosthog

      ipmitool
      # tries to default to soft-float due to out-dated cc-rs
    ]
    ++ lib.optional (!stdenv.hostPlatform.isRiscV) bandwhich;
}
