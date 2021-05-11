{ kernel, stdenv, fetchFromGitHub, python3, linux-sgx-driver }:
let
  kdir = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
stdenv.mkDerivation rec {
  name = "graphene-sgx-driver";
  src = fetchFromGitHub {
    owner = "oscarlab";
    repo = "graphene-sgx-driver";
    rev = "4386dbeb1260d8743ea3a5fbe4fc5fd61322008c";
    sha256 = "sha256-zZ0FgCx63LCNmvQ909O27v/o4+93gefhgEE/oDr/bHw=";
  };

  ISGX_DRIVER_PATH = linux-sgx-driver.src;

  makeFlags = [
    "KDIR=${kdir}"
  ];

  postPatch = ''
    patchShebangs .
  '';

  nativeBuildInputs = [ python3 ] ++ kernel.moduleBuildDependencies;

  installPhase = ''
    make INSTALL_MOD_PATH=$out -C ${kdir} M=$(pwd) modules_install
  '';
}
