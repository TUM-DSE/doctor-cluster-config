{ pkgs, ... }:
let
  # example: mkNfsMounter nfs:/export/home /home
  mkNfsMounter = nfsUrl: mountpoint: {
    description = "Mount ${mountpoint}";
    after = [ "network.target" ];
    # 1. Mount nfs before making shells available to users:
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      # 2. Retry try a few times on failure, before continuing with boot (1.)
      ExecStart = pkgs.writeShellScript "nfs-mount-wrapper" ''
        # TODO upgrade to nfs4 again, once linux 6.4 (e.g. clara) has working nfs4 again
        mountcmd="${pkgs.util-linux}/bin/mount -t nfs -o nofail,timeo=14 ${nfsUrl} ${mountpoint}"
        restartsec="5"

        mkdir -p ${mountpoint}
        for i in {1..10}; do
          echo "Mounting nfs. Attempt $i/10"
          echo "> $mountcmd"
          $mountcmd
          ret=$?
          if [[ $ret == 0 ]]; then
            exit 0
          else
            echo "Mounting nfs failed. Retrying in $restartsec sec"
            sleep $restartsec
          fi
        done
        exit $ret
      '';
      ExecStop = "${pkgs.util-linux}/bin/umount ${mountpoint}";
      # 3. If (2.) does not suffice, or nfs breaks during runtime, you shall still restart.
      Restart = "on-failure";
      RestartSec = 10;
    };
  };
in
{
  imports = [ ./. ];

  environment.sessionVariables = {
    # Since nix 2.20, nix stores a significant amount of data in $XDG_CACHE_HOME/nix because of the tarball cache.
    XDG_CACHE_HOME = [ "/scratch/$USER/.cache" ];
    # This fixes user profile generation i.e. used by home-manager
    XDG_STATE_HOME = [ "/scratch/$USER/.local/share" ];
  };

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

  boot.supportedFilesystems = [ "nfs" ];
  systemd.services = {
    nfs-home = mkNfsMounter "nfs:/export/home" "/home";
    nfs-share = mkNfsMounter "nfs:/export/share" "/share";
  };
}
