{pkgs, ...}: {
  imports = [./.];

  # linux 5_15 currently causes issues.
  boot.kernelPackages = pkgs.linuxPackages_5_10;

  fileSystems."/home" = {
    device = "nfs:/export/home";
    fsType = "nfs4";
    options = [
      "nofail"
      "timeo=14"
    ];
  };

  fileSystems."/share" = {
    device = "nfs:/export/share";
    fsType = "nfs4";
    options = [
      "nofail"
      "timeo=14"
    ];
  };
}
