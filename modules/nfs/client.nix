{ ... }: {
  imports = [ ./. ];

  #fileSystems."/home" = {
  #  device = "nfs1:/home";
  #  fsType = "nfs4";
  #  options = [
  #    "noauto"
  #    "timeo=14"
  #    "x-systemd.automount"
  #    "x-systemd.idle-timeout=1min"
  #  ];
  #};

  fileSystems."/share" = {
    device = "nfs:/export/share";
    fsType = "nfs4";
    options = [
      "noauto"
      "timeo=14"
      "x-systemd.automount"
      "x-systemd.idle-timeout=1min"
    ];
  };
}
