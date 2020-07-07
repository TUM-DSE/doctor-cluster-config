{ pkgs, config, lib, ... }:

let
  linux-sgx-driver = pkgs.callPackage ../../pkgs/linux-sgx-driver {
    inherit (config.boot.kernelPackages) kernel;
  };
in {
  config = {
    boot.extraModulePackages = [ linux-sgx-driver ];
    environment.systemPackages = [
      (pkgs.callPackage ../../pkgs/sgx-enable {})
    ];
  };
}
