{ config, lib, pkgs, ... }:

{
  # use networkd
  networking.dhcpcd.enable = false;
  systemd.network.enable = true;

  # often hangs
  systemd.services.systemd-networkd-wait-online.enable = false;
  # sometimes cannot be restarted -> breaks system upgrade
  systemd.services.systemd-networkd.restartIfChanged = false;
  # fails to delete some chain on upgrade...
  systemd.services.firewall.restartIfChanged = false;

  # add an entry to /etc/hosts for each host
  networking.extraHosts = lib.concatStringsSep "\n" (lib.mapAttrsToList
    (name: host: ''
      ${host.ipv4} ${name}
      ${lib.optionalString (host.ipv6 != null) "${host.ipv6} ${name}"}
      ${host.linklocal} ${name}.u
    '')
    config.networking.doctorwho.hosts);

  systemd.network.networks."ethernet".extraConfig = ''
    [Match]
    Type = ether

    [Network]
    DNSSEC = no
    DHCP = yes
    LLMNR = true
    LinkLocalAddressing = yes
    LLDP = true
    IPv6AcceptRA = yes
    Address = ${config.networking.doctorwho.hosts.${config.networking.hostName}.linklocal}/64
    IPForward = yes
  '';

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
  networking.firewall.extraCommands = lib.concatMapStringsSep "\n"
    (host: ''
      iptables -A INPUT -s ${host.ipv4} -j nixos-fw-accept
    '')
    (lib.attrValues config.networking.doctorwho.hosts);

  # allow all traffic from internal 40GbE network
  networking.firewall.trustedInterfaces = [
    "enp1s0f0"
    "enp1s0f1"
    "enp2s0f0"
    "enp2s0f1"
  ];

  # breaks docker and fails to reload after nixpkgs upgrades
  systemd.services.firewall.reloadIfChanged = lib.mkForce false;
}
