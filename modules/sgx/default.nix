{
  pkgs,
  config,
  lib,
  ...
}: {
  boot.kernel.sysctl."vm.mmap_min_addr" = "0";
  boot.extraModulePackages = [
    config.boot.kernelPackages.isgx
  ];
  environment.systemPackages = [
    (pkgs.callPackage ../../pkgs/sgx-enable {})
  ];
}
