{
  imports = [ ./. ];

  virtualisation = {
    vfio = {
      enable = true;
      iommuType = "amd";
      iommuDebugFs = true;
    };
  };
}
