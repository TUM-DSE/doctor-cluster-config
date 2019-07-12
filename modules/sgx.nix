{ pkgs, config, ... }:

with pkgs;
let
  kernel = config.boot.kernelPackages.kernel;
  kdir = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
  sgx-driver = stdenv.mkDerivation {
    name = "sgx-lkl";
    src = fetchFromGitHub {
      owner = "intel";
      repo = "linux-sgx-driver";
      rev = "5d6abcc3fed7bb7e6aff09814d9f692999abd4dc";
      sha256 = "1mvkpng8fhwa5vsp40a4hsm4dhkl0nplwqrfd4fy8z3mji9786qq";
    };

    makeFlags = [
      "KDIR=${kdir}"
    ];

    nativeBuildInputs = [ perl ] ++ kernel.moduleBuildDependencies;

    installPhase = ''
      make INSTALL_MOD_PATH=$out -C ${kdir} M=$(pwd) modules_install
    '';
  };
in {
  boot.extraModulePackages = [
    sgx-driver
  ];
  environment.systemPackages = [
    (callPackage ../pkgs/sgx-enable {})
  ];
}
