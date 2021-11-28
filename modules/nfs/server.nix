{ config, lib, pkgs, ... }:
{
  imports = [ ./. ];

  sops.secrets.znapzend = {};
  programs.ssh.extraConfig = ''
    Host nfs-backup
      User znapzend
      IdentityFile ${config.sops.secrets.znapzend.path}
  '';

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /home/ 2a09:80c0:102::/64(rw,nohide,insecure,no_subtree_check,no_root_squash)
  '';

  boot.zfs.extraPools = [ "zpool1" "zpool2" ];

  fileSystems."/export/home" = {
    device = "zpool1/home";
    fsType = "zfs";
    options = [ "nofail" ];
  };

  fileSystems."/export/share" = {
    device = "zpool2/share";
    fsType = "zfs";
    options = [ "nofail" ];
  };

  services.znapzend.enable = true;
  services.znapzend.zetup = {
    "zpool1" = {
      plan = "1h=>10min";
      recursive = true;
      destinations.remote = {
        host = "znapzend@nfs-backup";
        dataset = "zpool1";
      };
    };
    "zpool2" = {
      plan = "1h=>10min";
      recursive = true;
      destinations = {
        remote = {
          host = "znapzend@nfs-backup";
          dataset = "zpool2";
        };
      };
    };
  };
}
