{ pkgs, ... }: {
  # only exists on graham just now
  systemd.services.backup-pauls-repo = {
    startAt = "daily";
    serviceConfig.ExecStart = "${pkgs.rsync}/bin/rsync -ax --delete /scratch/paul/src/broken_deps/ /share/paul/broken_deps";
  };
}
