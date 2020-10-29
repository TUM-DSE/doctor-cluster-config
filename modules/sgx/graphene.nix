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
  boot.kernelPackages = pkgs.linuxPackages_5_4;
  boot.kernelPatches = [{
    # needed for graphene: https://github.com/oscarlab/graphene/blob/b72786e9ded042b238737f6eb0387becc250ea47/Documentation/building.rst#L72
    name = "fsgsbase.patch";
    patch = pkgs.fetchpatch {
      url = "https://github.com/torvalds/linux/compare/v5.4...Mic92:fsgsbase-5.4.patch";
      name = "fsgsbase.patch";
      sha256 = "0dwz5cndac5n4na08v5b2m2qh3bf1pw7yhb1psavj3pjxj3nabxp";
    };
  }];
}
