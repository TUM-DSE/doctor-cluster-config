{config, ...}: {
  # amy's address
  fileSystems."/home" = {
    device = "[fd9a:5371:cd3f::1]:/home";
    fsType = "nfs4";
    options = [
      "noauto"
      "timeo=14"
      "x-systemd.automount"
      "x-systemd.idle-timeout=1min"
    ];
  };
}
