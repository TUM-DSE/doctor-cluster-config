# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, modulesPath, lib, ... }:

{
  # Include the results of the hardware scan.
  imports = [
    ../modules/nfs/client.nix
    ../modules/riscv-unleashed
    # less libraries to cross compile
    "${modulesPath}/profiles/minimal.nix"
  ];

  networking.hostName = "ruby";
  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  # we cross-compile so we cannot auto upgrade
  system.autoUpgrade.enable = false;

  environment.systemPackages = with pkgs; [
    vim
    lm_sensors
  ];

  services.openssh.enable = true;

  system.stateVersion = "22.05";
}
