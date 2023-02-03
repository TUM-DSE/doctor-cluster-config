{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-418G.nix
  ];

  networking.hostName = "amy";

  #simd.arch = "skylake";
  system.stateVersion = "22.11";
}
