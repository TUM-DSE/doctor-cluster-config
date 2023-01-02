{
  config,
  lib,
  ...
}:
with lib; {
  options = {
    boot.hugepages.size = mkOption {
      type = types.enum ["1GB" "2MB"];
      description = ''
        Size of one hugetable
      '';
      default = "2MB";
    };
    boot.hugepages.number = mkOption {
      type = types.int;
      description = ''
        Nr of hugepages
      '';
      default = 1000;
    };
  };
  config = {
    boot.kernelParams = [
      # spdk/dpdk hugepages
      "default_hugepagesz=${config.boot.hugepages.size}"
      "hugepagesz=${config.boot.hugepages.size}"
      "hugepages=${toString config.boot.hugepages.number}"
    ];
    boot.extraModulePackages = [
      config.boot.kernelPackages.dpdk-kmods
    ];
    boot.kernelModules = ["igb_uio"];
    boot.extraModprobeConfig = ''
      blacklist ice
    '';
  };
}
