{ pkgs, config, ... }:

with pkgs;
let
  kernel = config.boot.kernelPackages.kernel;
  kdir = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
  graphene-sgx-driver = stdenv.mkDerivation rec {
    pname = "graphene-sgx-driver";
    src = fetchFromGitHub {
      owner = "oscarlab";
      repo = "graphene-sgx-driver";
      #rev = "sgx_driver_${version}";
      rev = "fd435f02ff526fd4e473de03797b0bbab95fb748";
      sha256 = "17zcx2p8m3m0b6w1r1sf11zznmlq8s4nqhxpc52crgvjaj946d00";
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
  imports = [ ./sgx.nix ];
  boot.kernel.sysctl = [ "vm.mmap_min_addr=0" ];
  boot.extraModulePackages = [ graphene-sgx-driver ];

  # required for ptrace patch
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPatches = [{
    # needed for graphene: https://github.com/oscarlab/graphene/blob/b72786e9ded042b238737f6eb0387becc250ea47/Documentation/building.rst#L72
    name = "fsgsbase.patch";
    patch = pkgs.fetchpatch {
      url = "https://github.com/torvalds/linux/compare/v5.7...Mic92:fsgsbase.patch";
      name = "fsgsbase.patch";
      sha256 = "1g293d2jvqm7q5awdxf9l0bgk2175qkw5jgbr0ma8pyr8jrxckch";
    };
  }];
}
