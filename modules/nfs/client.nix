{ pkgs, ... }: let
  # example: mkNfsMounter nfs:/export/home /home
  mkNfsMounter = nfsUrl: mountpoint: {
    description = "Mount ${mountpoint}";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.util-linux}/bin/mount -t nfs4 -o nofail,timeo=14 ${nfsUrl} ${mountpoint}";
      ExecStop = "${pkgs.util-linux}/bin/umount ${mountpoint}";
      Restart = "on-failure";
      RestartSec = 10;
    };
  };
in {
  imports = [ ./. ];

  # How should we mount NFS?

  # This (using systemd.mount) fails sometimes, because network isn't ready yet:
  # fileSystems."/home" = {
  #   device = "nfs:/export/home";
  #   fsType = "nfs4";
  #   options = [
  #     "nofail"
  #     "timeo=14"
  #   ];
  # };
  # That is likely, because systemd-networkd-wait-online.target cannot determine, when we can start mounting nfs: Sometimes, additional links used for experimentation come online faster than the uplink, other times, other links do not come up at all. If we tracked manually, which link is the uplink/link for nfs, we could wait specifically for that link. But i don't want to do that manual labor. 
  # Instead we just add a retry to the NFS mount. However:
  # Neither NFS nor systemd.mount has an option for retries. See https://github.com/systemd/systemd/issues/4468

  systemd.services = {
    nfs-home = mkNfsMounter "nfs:/export/home" "/home";
    nfs-share = mkNfsMounter "nfs:/export/share" "/share";
  };
}
