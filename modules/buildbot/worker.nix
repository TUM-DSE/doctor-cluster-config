{ config, inputs, ... }:
{
  imports = [
    ./hostfile.nix
    inputs.buildbot-nix.nixosModules.buildbot-worker
  ];

  sops.secrets.buildbot-builder-ssh-key = { };
  sops.secrets.buildbot-nix-worker-password.owner = "buildbot-worker";

  nix.distributedBuilds = true;
  nix.buildMachines = [
    {
      hostName = "yasmin.dos.cit.tum.de";
      maxJobs = 96;
      sshKey = config.sops.secrets.buildbot-builder-ssh-key.path;
      sshUser = "buildbot-worker";
      protocol = "ssh-ng";
      system = "aarch64-linux";
      supportedFeatures = [
        "big-parallel"
        "kvm"
        "nixos-test"
      ];
    }
  ];
  # for working around cross-compiling quirks when building ruby
  boot.binfmt.emulatedSystems = [ "riscv64-linux" ];

  services.buildbot-nix.worker = {
    enable = true;
    masterUrl = ''tcp:host=2a09\:80c0\:102\:\:11:port=9989'';
    workerPasswordFile = config.sops.secrets.buildbot-nix-worker-password.path;
  };
}
