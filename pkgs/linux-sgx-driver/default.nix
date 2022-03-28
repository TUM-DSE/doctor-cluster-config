{
  kernel,
  stdenv,
  fetchFromGitHub,
  perl,
}: let
  kdir = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
  stdenv.mkDerivation rec {
    pname = "linux-sgx-driver";
    version = "2.11";

    src = fetchFromGitHub {
      owner = "intel";
      repo = "linux-sgx-driver";
      rev = "sgx_driver_${version}";
      sha256 = "sha256-zZ0FgCx63LCNmvQ909O27v/o4+93gefhgEE/oDr/bHw=";
    };

    makeFlags = [
      "KDIR=${kdir}"
    ];

    nativeBuildInputs = [perl] ++ kernel.moduleBuildDependencies;

    installPhase = ''
      make INSTALL_MOD_PATH=$out -C ${kdir} M=$(pwd) modules_install
    '';
  }
