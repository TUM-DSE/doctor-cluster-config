{
  networking.hostName = "martha";
  networking.retiolum = {
    ipv4 = "10.243.29.179";
    ipv6 = "42:0:3c46:5466:7dbe:f27a:673f:ea64";
  };

  fileSystems."/home" = {
    device = "192.168.2.1:/home";
    fsType = "nfs4";
    options = [
      "noauto" "x-systemd.automount" "x-systemd.device-timeout=10" "timeo=14" "x-systemd.idle-timeout=1min"
    ];
  };
}
