{ ... }: {
  fileSystems."/home" = {
    device = "129.215.165.52:/home";
    fsType = "nfs4";
    options = [
      "noauto" "x-systemd.automount" "x-systemd.device-timeout=10" "timeo=14" "x-systemd.idle-timeout=1min"
    ];
  };
}
