{
  imports = [
    ../modules/k3s/agent.nix
    ../modules/hardware/poweredge-r440.nix
    ../modules/filesystems-r440.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "dan";

  simd.arch = "cascadelake";

  system.stateVersion = "21.11";
}
