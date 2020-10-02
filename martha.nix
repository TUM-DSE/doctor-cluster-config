{ pkgs, ... }: {
  imports = [
    ./modules/nfs-home.nix
  ];

  networking.hostName = "martha";
  networking.retiolum = {
    ipv4 = "10.243.29.179";
    ipv6 = "42:0:3c46:5466:7dbe:f27a:673f:ea64";
  };

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
      if [[ "$exitStatus" == "0" ]]; then
        ${pkgs.curl}/bin/curl -XPOST -fsS --retry 3 https://hc-ping.com/2a4c8809-7adb-4ed4-b463-3bb46703a4dd
      else
        ${pkgs.curl}/bin/curl -XPOST -fsS --retry 3 https://hc-ping.com/2a4c8809-7adb-4ed4-b463-3bb46703a4dd/fail
      fi
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

  services.openssh.extraConfig = "HostCertificate ${./secrets/certs/martha-cert.pub}";
}
