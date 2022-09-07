{ config, lib, pkgs, ... }:
let
  package = pkgs.python3Packages.buildbot-worker;
  python = package.pythonModule;
  home = "/var/lib/buildbot-worker";
  buildbotDir = "${home}/worker";
in
{
  users.users.buildbot-worker = {
    description = "Buildbot Worker User.";
    isSystemUser = true;
    createHome = true;
    home = "/var/lib/buildbot-worker";
    group = "buildbot-worker";
    useDefaultShell = true;
  };

  imports = [
    ./hostfile.nix
  ];
  users.groups.buildbot-worker = { };
  sops.secrets.buildbot-builder-ssh-key = {};
  sops.secrets.buildbot-nix-worker-password.owner = "buildbot-worker";
  users.groups.buildbot-worker = { };

  nix.distributedBuilds = true;
  nix.buildMachines = [
    {
      hostName = "yasmin.dse.in.tum.de";
      maxJobs = 96;
      sshKey = config.sops.secrets.buildbot-builder-ssh-key.path;
      sshUser = "ssh-ng://buildbot-worker";
      system = "aarch64-linux";
      supportedFeatures = [
        "big-parallel"
        "kvm"
        "nixos-test"
      ];
    }
  ];

  systemd.services.buildbot-worker = {
    description = "Buildbot Worker.";
    after = [ "network.target" "buildbot-master.service" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.git pkgs.nix pkgs.cachix pkgs.gh ];
    environment.PYTHONPATH = "${python.withPackages (p: [ package ])}/${python.sitePackages}";
    environment.MASTER_URL = ''tcp:host=2a09\:80c0\:102\:\:1:port=9989'';
    environment.BUILDBOT_DIR = buildbotDir;
    #environment.WORKER_PASSWORD_FILE = "%d/buildbot-nix-worker-password";
    environment.WORKER_PASSWORD_FILE = "${config.sops.secrets.buildbot-nix-worker-password.path}";

    serviceConfig = {
      Type = "simple";
      User = "buildbot-worker";
      Group = "buildbot-worker";
      WorkingDirectory = home;

      ExecStart = "${python.pkgs.twisted}/bin/twistd --nodaemon --pidfile= --logfile - --python ${./worker.py}";

      #LoadCredential = [
      #  "buildbot-nix-worker-password:${config.sops.secrets.buildbot-nix-worker-password.path}"
      #];
    };
  };
}
