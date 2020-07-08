{ pkgs, config, ... }:

let
  graphene-sgx-driver = pkgs.callPackage ../../pkgs/graphene-sgx-driver {
    linux-sgx-driver = pkgs.callPackage ../../pkgs/linux-sgx-driver {
      inherit (config.boot.kernelPackages) kernel;
    };
    inherit (config.boot.kernelPackages) kernel;
  };
in {
  imports = [ ./. ];
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
