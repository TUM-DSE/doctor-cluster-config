{ kernel
, stdenv
, fetchFromGitHub
, python3
, isgx
}:
let
  kdir = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
stdenv.mkDerivation rec {
  name = "graphene-sgx-driver";
  src = fetchFromGitHub {
    owner = "oscarlab";
    repo = "graphene-sgx-driver";
    rev = "4386dbeb1260d8743ea3a5fbe4fc5fd61322008c";
    sha256 = "sha256-bhNtYFXQlJjm73n+De3hoT5Svvyb2r1E6KfmdNMV8Es=";
  };

  ISGX_DRIVER_PATH = isgx.src;

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
