# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, modulesPath, ... }:

{
  # Include the results of the hardware scan.
  imports = [
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

  #hardware.fancontrol.enable = true;
  #hardware.fancontrol.config = ''
  #  # Helios4 PWM Fan Control Configuration
  #  # Temp source : /dev/thermal-cpu
  #  INTERVAL=10
  #  FCTEMPS/dev/fan-j10/pwm1=/dev/thermal-cpu/temp1_input /dev/fan-j17/pwm1=/dev/thermal-cpu/temp1_input
  #  MINTEMP=/dev/fan-j10/pwm1=40 /dev/fan-j17/pwm1=40
  #  MAXTEMP=/dev/fan-j10/pwm1=80 /dev/fan-j17/pwm1=80
  #  MINSTART=/dev/fan-j10/pwm1=20 /dev/fan-j17/pwm1=20
  #  MINSTOP=/dev/fan-j10/pwm1=29 /dev/fan-j17/pwm1=29
  #  MINPWM=0
  #'';

  services.openssh.enable = true;

  system.stateVersion = "22.05";

  nixpkgs.crossSystem = {
    config = "riscv64-unknown-linux-gnu";
    system = "riscv64-linux";
  };

  # TODO: publish the mac address to the admins
  systemd.network.links."00-docking-station".extraConfig = ''
    [Match]
    MACAddress = 70:b3:d5:92:f7:f8

    [Link]
    MACAddress = f4:6b:8c:4a:7d:82
    Name = eth0
  '';

}
