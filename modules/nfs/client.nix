{ ... }: {
  imports = [ ./. ];

  fileSystems."/home" = {
    device = "nfs1:/home";
    fsType = "nfs4";
    options = [
      "noauto"
      "x-systemd.automount"
      "x-systemd.device-timeout=10"
      "timeo=14"
      "x-systemd.idle-timeout=1min"
    ];
  };

  fileSystems."/share" = {
    device = "nfs1:/share";
    fsType = "nfs4";
    options = [
      "noauto"
      "x-systemd.automount"
      "x-systemd.device-timeout=10"
      "timeo=14"
      "x-systemd.idle-timeout=1min"
    ];
  };
}
