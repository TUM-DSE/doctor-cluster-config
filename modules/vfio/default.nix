{ lib, config, ... }:
with lib;
let
  cfg = config.virtualisation.vfio;
in
{
  options.virtualisation.vfio = {
    enable = mkEnableOption "VFIO Configuration";
    iommuType = mkOption {
      type = types.enum [ "intel" "amd" ];
      example = "intel";
      description = "Type of the IOMMU used";
    };
    iommuDebugFs = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "make available iommu mappings via /sys/kernel/debug/iommu";
    };
    devices = mkOption {
      type = types.listOf (types.strMatching "[0-9a-f]{4}:[0-9a-f]{4}");
      default = [ ];
      example = [ "10de:1b80" "10de:10f0" ];
      description = "PCI IDs of devices to bind to vfio-pci";
    };
    disableEfiFb = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Disables the usage of the EFI framebuffer on boot.";
    };
    blacklistNvidia = mkOption {
      type = types.bool;
      default = false;
      description = "Add Nvidia GPU modules to blacklist";
    };
    ignoreMSRs = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description =
        "Enables or disables kvm guest access to model-specific registers";
    };
  };

  config = lib.mkIf cfg.enable {
    services.udev.extraRules = ''
      SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm"
    '';

    boot.kernelParams = (if cfg.iommuType == "intel" then [
      "intel_iommu=on"
      # "intel_iommu=igfx_off" # turns off integrated graphics
    ] else
      [ "amd_iommu=on" ]) ++ (optional (builtins.length cfg.devices > 0)
      ("vfio-pci.ids=" + builtins.concatStringsSep "," cfg.devices))
    ++ (optional cfg.disableEfiFb "video=efifb:off")
    ++ (optionals cfg.ignoreMSRs [
      "kvm.ignore_msrs=1"
      "kvm.report_ignored_msrs=0"
    ]);

    boot.kernelModules = [ "vfio_pci" "vfio_iommu_type1" "vfio" ];

    boot.initrd.kernelModules = [ "vfio_pci" "vfio_iommu_type1" "vfio" ];
    boot.blacklistedKernelModules =
      optionals cfg.blacklistNvidia [ "nvidia" "nouveau" ];

    boot.kernelPatches = (optionals cfg.iommuDebugFs [
      {
        name = "iommu_debug_files";
        patch = null;
        extraConfig = (if cfg.iommuType == "intel" then ''
          IOMMU_DEBUGFS y
          INTEL_IOMMU_DEBUGFS y
        '' else ''
          IOMMU_DEBUGFS y
          AMD_IOMMU_DEBUGFS y
        '');
      }
    ]);
  };
}
