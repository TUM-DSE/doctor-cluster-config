{
  config,
  pkgs,
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
      default = "1GB";
    };
    boot.hugepages.number = mkOption {
      type = types.int;
      description = ''
        own ipv6 address
      '';
      default = 8;
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
