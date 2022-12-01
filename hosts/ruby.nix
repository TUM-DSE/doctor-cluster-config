# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, modulesPath, ... }:

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

  environment.systemPackages = with pkgs; [
    vim
    lm_sensors
  ];

  services.openssh.enable = true;

  system.stateVersion = "22.05";

  # TODO: publish the mac address to the admins
  systemd.network.links."00-docking-station".extraConfig = ''
    [Match]
    MACAddress = 70:b3:d5:92:f7:f8

    [Link]
    MACAddress = f4:6b:8c:4a:7d:82
    Name = eth0
  '';

}
