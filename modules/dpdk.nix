{ config
, lib
, ...
}:
let
  # see #383
  currentlyIncompatibleKernelVersion = "6.5";
in
with lib; {
  options = {
    boot.hugepages1GB.number = mkOption {
      type = types.int;
      description = ''
        Nr of 1GB hugepages
      '';
      default = 0;
    };
    boot.hugepages2MB.number = mkOption {
      type = types.int;
      description = ''
        Nr of 2MB hugepages
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
      "hugepagesz=1GB"
      "hugepages=${toString config.boot.hugepages1GB.number}"
      "hugepagesz=2MB"
      "hugepages=${toString config.boot.hugepages2MB.number}"
    ];
    # 2k hugepages are automatically mounted by nixos
    fileSystems."/dev/hugepages1G" = {
      device = "hugetlbfs";
      fsType = "hugetlbfs";
      options = [ "nosuid" "nodev" "pagesize=1G" ];
    };
    boot.extraModulePackages = lib.mkIf (config.boot.kernelPackages.kernel.version != currentlyIncompatibleKernelVersion) [
      # provide igb_uio:
      config.boot.kernelPackages.dpdk-kmods
      # provide rte_kni:
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
