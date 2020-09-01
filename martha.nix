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
    repo = "borgbackup@eddie.thalheim.io:rose";
    preHook = ''
      eval $(ssh-agent)
      ssh-add /etc/nixos/secrets/borgbackup-ssh-key
    '';
    postHook = ''
      if [[ "$exitStatus" == "0" ]]; then
        ${pkgs.curl}/bin/curl -XPOST -fsS --retry 3 https://hc-ping.com/8fdc97f7-1c32-4829-9dd2-f78e01086f41
      else
        ${pkgs.curl}/bin/curl -XPOST -fsS --retry 3 https://hc-ping.com/8fdc97f7-1c32-4829-9dd2-f78e01086f41/fail
      fi
    '';
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
