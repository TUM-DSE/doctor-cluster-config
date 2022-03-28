{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "sgx-enable";
  version = "0.0.1";
  src = fetchFromGitHub {
    owner = "Mic92";
    repo = "sgx-enable";
    rev = version;
    sha256 = "193qmafnzhx6mkq9x9wh758pbrl1w6w0axndbijrnrmr6g4dvshr";
  };
  installFlags = ["PREFIX=${placeholder "out"}"];
}
