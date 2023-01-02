{
  ...
}: {
  imports = [
    ../modules/k3s/agent.nix
    ../modules/hardware/poweredge-r440.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "mickey";

  simd.arch = "cascadelake";

  system.stateVersion = "21.11";
}
