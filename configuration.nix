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
    ./modules/scone.nix
    ./modules/packages.nix
    ./modules/nix-daemon.nix
    ./modules/retiolum.nix
    ./modules/sgx
    ./modules/scratch-space.nix
    ./modules/secrets.nix
    ./modules/tracing.nix
    ./modules/tor-ssh.nix
    ./modules/users.nix
    ./modules/zfs.nix
    ./modules/hosts.nix
    ./modules/nix-serve.nix
  ];

  # add an entry to /etc/hosts for each host
  networking.extraHosts = ''
   ${lib.concatStringsSep "\n" (lib.mapAttrsToList
     (name: host: "${host.ipv4} ${name}")
     config.networking.doctorwho.hosts)}
  '';

  boot.loader.systemd-boot.enable = true;
  # Enable this when you install NixOS on a new machine!
  boot.loader.efi.canTouchEfiVariables = false;

  networking.firewall.allowedTCPPorts = [
    # iperf2
    5001
    # iperf3
    5201
  ];


  networking.firewall.allowedUDPPorts = [
    # iperf2
    5001
    # iperf3
    5201
  ];

  # allow incomming traffic from all our hosts
  networking.firewall.extraCommands = lib.concatMapStringsSep "\n" (host: ''
    iptables -A INPUT -s ${host.ipv4} -j nixos-fw-accept
  '') (lib.attrValues config.networking.doctorwho.hosts);

  # allow all traffic from internal 40GbE network
  networking.firewall.trustedInterfaces = [
    "enp1s0f0"
    "enp1s0f1"
    "enp2s0f0"
    "enp2s0f1"
  ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

  services.resolved.enable = false;
  networking.nameservers = [ "8.8.8.8" ];

  # For docker
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "zfs";
    extraOptions = "--userland-proxy=false --ip-masq=true --storage-opt=zfs.fsname=zroot/docker";
  };

  systemd.watchdog.rebootTime = "10m";
  systemd.watchdog.runtimeTime = "30s";

  # Since we can't manually respond to a panic, just reboot.
  boot.kernelParams = [ "panic=1" "boot.panic_on_fail" ];

  programs.mosh.enable = true;
}
