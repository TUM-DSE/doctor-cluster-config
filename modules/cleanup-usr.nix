{
  # clean-up mess created by `sudo make install`
  systemd.tmpfiles.rules = [
    "R /usr/include/ - - - - -"
    "R /usr/lib/ - - - - -"
    "R /usr/local/ - - - - -"
    "R /usr/sbin/ - - - - -"
    "R /usr/share/ - - - - -"
    "R /usr/libexec/ - - - - -"
  ];
}
