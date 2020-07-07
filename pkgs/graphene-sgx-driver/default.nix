{ kernel, stdenv, fetchFromGitHub, python3, linux-sgx-driver }:
let
  kdir = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in stdenv.mkDerivation rec {
  name = "graphene-sgx-driver";
  src = fetchFromGitHub {
    owner = "oscarlab";
    repo = "graphene-sgx-driver";
    rev = "fd435f02ff526fd4e473de03797b0bbab95fb748";
    sha256 = "1ynri4fvqazl47272kkx8ca85ihiznci2fn1h1jmcma7cr4lyddk";
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
