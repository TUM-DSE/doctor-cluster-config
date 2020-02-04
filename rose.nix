{ lib, config, ...}: {
  networking.hostName = "rose";
  networking.retiolum = {
    ipv4 = "10.243.29.178";
    ipv6 = "42:0:3c46:a5a1:618d:663a:f0f1:ec88";
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /home/ ${lib.concatMapStringsSep " " (host:
      ''${host.ipv4}(rw,nohide,insecure,no_subtree_check,no_root_squash)'')
      (lib.attrValues config.networking.doctorwho.hosts)}
  '';

  services.borgbackup.jobs.joerg = {
    paths = [
      "/home/joerg"
    ];
    doInit = true;
    repo = "borgbackup@eddie.thalheim.io:rose";
    encryption.mode = "none";
    compression = "auto,zstd";
    startAt = "daily";
    prune.keep = {
      within = "1d"; # Keep all archives from the last day
      daily = 7;
      weekly = 4;
      monthly = 0;
    };
  };

  fileSystems."/home" = {
    device = "zroot/root/home";
    fsType = "zfs";
  };
}
