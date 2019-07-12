{
  networking.hostName = "donna";
  networking.retiolum = {
    ipv4 = "10.243.29.180";
    ipv6 = "42:0:3c46:7f2f:ed62:c6fd:9f1b:9900";
  };

  fileSystems."/home" = {
    device = "192.168.3.1:/home";
    fsType = "nfs4";
    options = [
      "noauto" "x-systemd.automount" "x-systemd.device-timeout=10" "timeo=14" "x-systemd.idle-timeout=1min"
    ];
  };
}
