{ pkgs, lib, ... }: {
  imports = [
    ./modules/nfs-home.nix
    ./modules/ci.nix
  ];

  networking.hostName = "martha";
  networking.retiolum = {
    ipv4 = "10.243.29.179";
    ipv6 = "42:0:3c46:5466:7dbe:f27a:673f:ea64";
  };

  users.extraUsers.joerg.home = lib.mkForce "/scratch/joerg";

  services.borgbackup.jobs.joerg-martha = {
    paths = [
      "/scratch/joerg"
    ];
    doInit = true;
    repo = "borg@eve.thalheim.io:.";
    preHook = ''
      eval $(ssh-agent)
      ssh-add /etc/nixos/secrets/borgbackup-ssh-key
    '';
    postHook = ''
      cat > /var/log/telegraf/borgbackup-martha <<EOF
      task,frequency=daily last_run=$(date +%s)i,state="$([[ $exitStatus == 0 ]] && echo ok || echo fail)"
      EOF
    '';
    extraArgs = "--lock-wait 900";
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
  systemd.services.borgbackup-job-joerg-martha.serviceConfig.ReadWritePaths = [
    "/var/log/telegraf"
  ];

  system.stateVersion = "19.09";
}
