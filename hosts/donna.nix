{ config, pkgs, ... }:

{
  imports =
    [ 
      ../modules/hardware/hardware-configuration.nix
      ../modules/apple-silicon-support
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "donna";
  


  system.stateVersion = "23.05";

}