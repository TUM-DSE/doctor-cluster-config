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
    /export/home 2a09:80c0:102::/64(rw,nohide,insecure,no_subtree_check,no_root_squash)
    /export/share 2a09:80c0:102::/64(rw,nohide,insecure,no_subtree_check,no_root_squash)
  '';

  systemd.tmpfiles.rules =
    let
      loginUsers = lib.filterAttrs (n: v: v.isNormalUser) config.users.users;
    in
      (lib.mapAttrsToList (n: v: "d /export/share/${n} 0755 ${n} users -") loginUsers)
      ++ (builtins.map (n: "R /export/share/scratch/${n} - - - - -") config.users.deletedUsers);

  # this extends 05-bond1 from modules/bonding.nix
  systemd.network.networks."05-bond1".extraConfig = ''
    [Network]
    Address = 2a09:80c0:102::f000:0/64
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
  services.znapzend.zetup = let
    postsend = task: toString (pkgs.writeScript "postsend" ''
      cat > /var/log/telegraf/${task} <<EOF
      task,frequency=tenminutes last_run=$(date +%s)i,state="ok"
      EOF
    '');
  in {
    "zpool1" = {
      plan = "1h=>10min";
      recursive = true;
      destinations.remote = {
        host = "znapzend@nfs-backup";
        dataset = "zpool1";
        postsend = postsend "znapzend-home";
      };
    };
    "zpool2" = {
      plan = "1h=>10min";
      recursive = true;
      destinations = {
        remote = {
          host = "znapzend@nfs-backup";
          dataset = "zpool2";
          postsend = postsend "znapzend-share";
        };
      };
    };
  };
}
