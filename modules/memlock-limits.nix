{
  # Dimitria needs this for io_uring.
  security.pam.loginLimits = [
    { domain = "@users"; type = "-"; item = "memlock"; value = "unlimited"; }
  ];
}
