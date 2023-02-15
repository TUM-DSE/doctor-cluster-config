{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
    ../modules/nfs/client.nix
  ];

  networking.hostName = "clara";

  simd.arch = "znver3";
  system.stateVersion = "22.11";
}
