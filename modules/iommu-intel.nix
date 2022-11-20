{...}: {
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
  ];

  # make available iommu mappings via /sys/kernel/debug/iommu
  boot.kernelPatches = [
    {
      name = "iommu_debug_files";
      patch = null;
      extraConfig = ''
        IOMMU_DEBUGFS y
        INTEL_IOMMU_DEBUGFS y
      '';
    }
  ];
}