# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./host-configuration.nix
      ./modules/builder.nix
      ./modules/packages.nix
      ./modules/tracing.nix
      ./modules/users.nix
      ./modules/zfs.nix
      ./modules/tor-ssh.nix
      ./modules/retiolum.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  services.openssh.extraConfig = ''
    # unlink forwarded gnupg agent socket after disconnected
    StreamLocalBindUnlink yes
  '';


  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

  services.resolved.enable = false;
  networking.nameservers = [ "8.8.8.8" ];
}
