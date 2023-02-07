{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
  ];

  networking.hostName = "rose";

  #simd.arch = "skylake";
  system.stateVersion = "22.11";
}
