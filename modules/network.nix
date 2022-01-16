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
    '')
    config.networking.doctorwho.hosts);

  # leave container interfaces alone
  systemd.network.networks."05-veth".extraConfig = ''
    [Match]
    Driver = veth

    [Link]
    Unmanaged = yes
  '';

  systemd.network.networks."10-ethernet".extraConfig = ''
    [Match]
    Type = ether

    [Network]
    DNSSEC = no
    DHCP = yes
    LLMNR = yes
    LinkLocalAddressing = yes
    LLDP = yes
    IPv6AcceptRA = yes
    IPForward = yes

    [DHCP]
    UseHostname = no
    RouteMetric = 1024
  '';

  # In TUM the university already firewall us, servers are only accessible from
  # the chair network. The firewall.service also made trouble when reloading
  # rules. It was also an issue when working with kubernetes as their internal
  # firewall is insane. In Edinburgh it might become an issue, but than we
  # don't really run any public services on their except for ssh and k3s, which
  # are safe to run without a firewall. On amy we still have an NFS share however
  # this one has our nodes whitelisted, which should make it an non issue as well.
  networking.firewall.enable = false;
}
