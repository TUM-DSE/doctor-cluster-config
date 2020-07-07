{ pkgs, config, lib, ... }:

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
      #rev = "sgx_driver_${version}";
      rev = "602374c738ca58f83a1c17574d08e5d5e6341953";
      sha256 = "17zcx2p8m3m0b6w1r1sf11zznmlq8s4nqhxpc52crgvjaj946d0c";
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
  config = {
    boot.extraModulePackages = [ sgx-driver ];
    environment.systemPackages = [
      (callPackage ../pkgs/sgx-enable {})
    ];
  };

}
