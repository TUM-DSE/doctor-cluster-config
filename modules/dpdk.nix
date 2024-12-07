{ config, lib, ... }:
let
  # see #383
  currentlyIncompatibleKernelVersion = "6.5";
in
with lib;
{
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
    systemd.network.ignorePci = mkOption {
      type = types.listOf types.nonEmptyStr;
      description = ''
        Pci addresses to be ignored by systemd-networkd.
      '';
      default = [];
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
      options = [
        "nosuid"
        "nodev"
        "pagesize=1G"
      ];
    };
    boot.extraModulePackages =
      lib.mkIf (config.boot.kernelPackages.kernel.version != currentlyIncompatibleKernelVersion)
        [
          # provide igb_uio:
          config.boot.kernelPackages.dpdk-kmods
        ];
    boot.kernelModules = [ "igb_uio" ];
    boot.extraModprobeConfig = ''
      blacklist ice
    '';
    users.groups.kvm.members = lib.optionals config.users.addAllToKvm (
      builtins.attrNames (lib.filterAttrs (_userName: user: user.isNormalUser) config.users.users)
    );
    systemd.network.networks = let 
      ignoreConfig = pciAddress: ''
        [Match]
        Property=DEVPATH=/devices/pci0000:00/${pciAddress}/*

        [Link]
        Unmanaged = yes
      '';
      pciIgnoreRules = builtins.listToAttrs ( builtins.map (
        pciAddress: { 
          name = "09-ignore-${pciAddress}"; 
          value = { extraConfig = (ignoreConfig pciAddress); }; 
        }) config.systemd.network.ignorePci);
    in pciIgnoreRules // {
      # leave 100G interfaces alone
      "09-ignore-e810".extraConfig = ''
        [Match]
        Driver = ice

        [Link]
        Unmanaged = yes
      '';
    };
  };
}
