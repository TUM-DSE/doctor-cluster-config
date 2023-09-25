{ config
, lib
, ...
}:
with lib; {
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
        Nr of hugepages
      '';
      default = 1000;
    };
    users.addAllToKvm = mkOption {
      type = types.bool;
      description = ''
        Add all normal users to KVM group. (for access to KVM files like /dev/vfio)
      '';
      default = true;
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
      (config.boot.kernelPackages.dpdk.kmod.overrideAttrs (finalAttrs: previousAttrs: {
        postPatch = previousAttrs.postPatch + ''
          substituteInPlace ./kernel/linux/kni/kni_dev.h \
            --replace "#include <linux/if.h>
          " "#include <linux/if.h>
          #include <linux/mm.h>

          // only exists in later versions of the kernel
          #define FOLL_TOUCH	0x02	/* mark page accessed */
          "
        '';
        patches = [
          # ./dpdk-kmod.patch # this doesnt seem to actually be required by dpvs
        ];
      }))
    ];
    boot.kernelModules = [ "igb_uio" ];
    boot.extraModprobeConfig = ''
      blacklist ice
    '';
    users.groups.kvm.members = lib.optionals config.users.addAllToKvm (
      builtins.attrNames (lib.filterAttrs (_userName: user: user.isNormalUser) config.users.users)
    );
    systemd.network.networks = {
      # leave container interfaces alone
      "09-ignore-e810".extraConfig = ''
        [Match]
        Driver = ice

        [Link]
        Unmanaged = yes
      '';
    };
  };
}
