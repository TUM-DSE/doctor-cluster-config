{ pkgs, config, lib, ... }:

let
  linux-sgx-driver = pkgs.callPackage ../../pkgs/linux-sgx-driver {
    inherit (config.boot.kernelPackages) kernel;
  };
in {
  boot.kernel.sysctl."vm.mmap_min_addr" = "0";
  boot.extraModulePackages = [ linux-sgx-driver ];
  environment.systemPackages = [
    (pkgs.callPackage ../../pkgs/sgx-enable {})
  ];
}
