{ ... }: {
  imports = [ ./. ];

  fileSystems."/home" = {
    device = "nfs:/export/share";
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
