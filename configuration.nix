# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./host-configuration.nix
    ./modules/dpdk.nix
    #./modules/fck-spectr.nix
    ./modules/sgx/graphene.nix
    ./modules/scone.nix
    ./modules/packages.nix
    ./modules/nix-daemon.nix
    ./retiolum/modules/retiolum
    ./modules/sgx
    ./modules/scratch-space.nix
    ./modules/secrets.nix
    ./modules/tracing.nix
    ./modules/tor-ssh.nix
    ./modules/users.nix
    ./modules/zfs.nix
    ./modules/hosts.nix
    ./modules/network.nix
    ./modules/docker.nix
    ./modules/nix-serve.nix
    ./modules/watchdog.nix
    ./modules/mosh.nix
  ];

  boot.loader.systemd-boot.enable = true;
  # Enable this when you install NixOS on a new machine!
  boot.loader.efi.canTouchEfiVariables = false;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
