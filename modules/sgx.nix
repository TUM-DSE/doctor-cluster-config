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
  options.boot.graphenePatches.enable = lib.mkEnableOption "Enable Graphene kernel patches";

  config = {
    # required for ptrace patch
    boot.kernelPackages = lib.mkIf (config.boot.graphenePatches.enable) pkgs.linuxPackages_latest;
    boot.kernelPatches = lib.mkIf (config.boot.graphenePatches.enable) [{
      # needed for graphene: https://github.com/oscarlab/graphene/blob/b72786e9ded042b238737f6eb0387becc250ea47/Documentation/building.rst#L72
      name = "fsgsbase.patch";
      patch = fetchpatch {
        url = "https://github.com/torvalds/linux/compare/v5.7...Mic92:fsgsbase.patch";
        name = "fsgsbase.patch";
        sha256 = "1g293d2jvqm7q5awdxf9l0bgk2175qkw5jgbr0ma8pyr8jrxckch";
      };
    }];

    boot.extraModulePackages = [ sgx-driver ];
    environment.systemPackages = [
      (callPackage ../pkgs/sgx-enable {})
    ];
  };

}
