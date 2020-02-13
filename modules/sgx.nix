{ pkgs, config, ... }:

with pkgs;
let
  kernel = config.boot.kernelPackages.kernel;
  kdir = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
  sgx-driver = stdenv.mkDerivation rec {
    pname = "linux-sgx-driver";
    version = "2.6";
    src = fetchFromGitHub {
      owner = "intel";
      repo = "linux-sgx-driver";
      rev = "sgx_driver_${version}";
      sha256 = "0y5i71p2vzjiq47hy5v3a11iyy5qp8s3v0jgbjjpaqx6hqrpb7bj";
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
