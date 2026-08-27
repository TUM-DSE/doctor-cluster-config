{ ... }:
{
  imports = [ ./. ];

  virtualisation = {
    vfio = {
      enable = true;
      iommuType = "intel";
    };
  };
}
