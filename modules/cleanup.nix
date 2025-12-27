{
  systemd.tmpfiles.rules = [
     # clean-up mess created by `sudo make install`
    "R /usr/include/ - - - - -"
    "R /usr/lib/ - - - - -"
    "R /usr/local/ - - - - -"
    "R /usr/sbin/ - - - - -"
    "R /usr/share/ - - - - -"
    "R /usr/libexec/ - - - - -"

    # Remove leftover nix channel directories (channels are disabled)
    # See https://github.com/NixOS/nix/issues/9574
    "R /root/.nix-defexpr/channels - - - - -"
    "R /nix/var/nix/profiles/per-user/root/channels - - - - -"
  ];
}
