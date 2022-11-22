{...}: {
  imports = [./vfio.nix];

  virtualisation = {
    vfio = {
      enable = true;
      IOMMUType = "amd";
      devices = [ "8086:1592"];
    };
  };
}
