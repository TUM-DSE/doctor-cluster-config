{
  stdenv,
  fetchFromGitHub,
  libndctl,
  systemd,
  cmake,
  python3,
  pkg-config,
  asciidoctor,
  asciidoc,
  lib
}:
stdenv.mkDerivation rec {
  pname = "ipmctl";
  version = "2022-05-30";
  #version = "03.00.00.0438";
  src = fetchFromGitHub {
    repo = "ipmctl";
    owner = "intel";
    rev = "b1e79d7e04eeac3a656e09a3bda76784b1e132a5";
    #rev = "v${version}";
    sha256 = "sha256-0MbWucezbLaHvQ5uENnj5u2wG1BwRIzWFdfrQrT+dHs=";
  };
  buildInputs = [libndctl systemd];
  nativeBuildInputs = [cmake python3 pkg-config asciidoctor asciidoc];
  cmakeFlags = ["-DBUILDNUM=1"];

  meta = with lib; {
    description = "Utility for configuring and managing Intel Optane Persistent Memory modules";
    homepage = "https://github.com/intel/ipmctl";
    license = licenses.mit;
    maintainers = with maintainers; [mic92];
    platforms = platforms.unix;
  };
}
