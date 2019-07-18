{ config, ... }: {
  boot.kernelParams = [
    # spdk/dpdk hugepages
    "default_hugepagesz=1G" "hugepagesz=1G" "hugepages=16"
  ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.dpdk.kmod
  ];
  boot.kernelModules = [ "igb_uio" ];
}
