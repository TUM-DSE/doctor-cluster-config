{
  imports = [
    ../modules/yasmin-hardware.nix
    ../modules/nfs/client.nix
    ../modules/nfs/client.nix
    ../modules/buildbot/builder.nix
    # TODO this no longer builds with the new kernel.
    #../modules/uprobes.nix
  ];

  networking.hostName = "yasmin";

  boot.kernelParams = [
    "console=ttyS0,115200n8"
    "console=ttyAMA0,115200n8"
    "console=tty0"
  ];

  system.stateVersion = "20.09";

  nix.settings.system-features = [
    "benchmark"
    "big-parallel"
    "kvm"
    "nixos-test"
    "armv8.1-a"
  ];
}
