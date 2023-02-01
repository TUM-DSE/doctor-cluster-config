{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-foo.nix
  ];

  networking.hostName = "amy";

  #simd.arch = "skylake";
  system.stateVersion = "22.11";
}
