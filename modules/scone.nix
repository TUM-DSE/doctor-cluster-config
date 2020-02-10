{ ... }: {
  environment.etc."sgx-musl.conf".text = ''
    Q 8
    e -1 0 0
    s -1 0 0
    s -1 0 0
    e -1 1 0
    s -1 1 0
    s -1 1 0
    e -1 2 0
    s -1 2 0
    s -1 2 0
    e -1 3 0
    s -1 3 0
    s -1 3 0
    e -1 4 0
    s -1 4 0
    s -1 4 0
    e -1 5 0
    s -1 5 0
    s -1 5 0
    e -1 6 0
    s -1 6 0
    s -1 6 0
    e -1 7 0
    s -1 7 0
    s -1 7 0
  '';
}
