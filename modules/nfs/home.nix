{ config, ... }: {
  fileSystems."/home" = {
    device = "nfs:/export/home";
    fsType = "nfs4";
    options = [
      "nofail"
      "timeo=14"
    ];
  };
}
