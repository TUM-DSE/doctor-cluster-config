{
  imports = [ ./. ];

  virtualisation = {
    vfio = {
      enable = true;
      iommuType = "amd";
    };
  };
}
