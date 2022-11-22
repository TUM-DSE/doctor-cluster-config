{
  imports = [
    ./.
  ];

  virtualisation = {
    vfio = {
      enable = true;
      iommuType = "amd";
      devices = [ "8086:1592"];
    };
  };
}
