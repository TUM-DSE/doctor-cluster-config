{ config, pkgs, lib, ... }:
with lib;
{
  options = {
    boot.hugepages.size = mkOption {
      type = types.enum [ "1GB" "2MB" ];
      description = ''
        Size of one hugetable
      '';
      default = "2MB";
    };
    boot.hugepages.number = mkOption {
      type = types.int;
      description = ''
        own ipv6 address
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
      # https://github.com/NixOS/nixpkgs/pull/91823
      (config.boot.kernelPackages.dpdk.overrideAttrs (old: rec {
        pname = "dpdk";
        version = "20.05";

        src = pkgs.fetchurl {
          url = "https://fast.dpdk.org/rel/dpdk-${version}.tar.xz";
          sha256 = "0h0xv2zwb91b9n29afg5ihn06a8q28in64hag2f112kc19f79jj8";
        };

        postPatch = ''
          patchShebangs config/arm buildtools
        '';
      })).kmod
    ];
    boot.kernelModules = [ "igb_uio" ];

    # From the output of udevadm info -a -p /sys/bus/pci/devices/0000:03:00.0,
    # where 0000:03:00.0 is our NVME device
    services.udev.extraRules = ''
      # Intel Corporation Express Flash NVMe P4500/P4600
      ATTR{vendor}=="0x8086" ATTR{device}=="0x0a54", RUN+="${pkgs.coreutils}/bin/chmod 666 /sys/bus/pci/devices/$kernel/resource0"

      # Intel Corporation Ethernet Controller XL710 for 40GbE QSFP+
      ATTR{vendor}=="0x8086" ATTR{device}=="0x1583", RUN+="${pkgs.coreutils}/bin/chmod 666 /sys/bus/pci/devices/$kernel/resource0"
      ATTR{vendor}=="0x8086" ATTR{device}=="0x1583", RUN+="${pkgs.coreutils}/bin/chmod 666 /sys/bus/pci/devices/$kernel/resource3"
    '';
  };
}
