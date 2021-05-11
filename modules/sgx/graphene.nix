{ pkgs, config, ... }:
let
  graphene-sgx-driver = pkgs.callPackage ../../pkgs/graphene-sgx-driver {
    inherit (config.boot.kernelPackages) kernel isgx;
  };
in
{
  imports = [ ./. ];
  boot.extraModulePackages = [ graphene-sgx-driver ];

  # we need linux 5.9+: https://github.com/oscarlab/graphene-sgx-driver/issues/31
  boot.kernelPackages = pkgs.linuxPackages_5_11;
}
