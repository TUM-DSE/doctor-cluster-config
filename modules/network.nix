{ config, lib, ... }:
with lib;
{
  options = {
    networking.doctor-bridge.enable = mkEnableOption "Use a linux bridge for networking by default to fully expose VMs to our network";
  };

  config =
    let
      doctor-bridge = config.networking.doctor-bridge;
    in
    {
      # use networkd
      networking.dhcpcd.enable = false;
      systemd.network.enable = true;

      # add an entry to /etc/hosts for each host
      networking.extraHosts = lib.concatStringsSep "\n" (
        lib.mapAttrsToList (name: host: ''
          ${host.ipv4} ${name}
          ${lib.optionalString (host.ipv6 != null) "${host.ipv6} ${name}"}
        '') config.networking.doctorwho.hosts
      );

      systemd.network.netdevs = optionalAttrs doctor-bridge.enable {
        "05-bridge".netdevConfig = {
          Name = "doctor-bridge";
          Kind = "bridge";
          MACAddress = config.networking.doctorwho.currentHost.mac;
        };
      };

      boot.initrd.systemd.network.networks."10-ethernet" = config.systemd.network.networks."10-ethernet";

      systemd.network.networks =
        {
          # leave container interfaces alone
          "05-veth".extraConfig = ''
            [Match]
            Driver = veth

            [Link]
            Unmanaged = yes
          '';
          # leave libvirt interfaces alone
          "05-vnet".extraConfig = ''
            [Match]
            Name = vnet*
            [Link]
            Unmanaged = yes
          '';
        }
        // optionalAttrs doctor-bridge.enable {
          # TODO use mac instead of port
          "06-bind".extraConfig = ''
            [Match]
            MACAddress = ${config.networking.doctorwho.currentHost.mac}
            Type = ether
            [Network]
            Bridge=doctor-bridge
          '';
        }
        // optionalAttrs doctor-bridge.enable {
          "07-bridge-dhcp".extraConfig = ''
            [Network]

            [Match]
            Name=doctor-bridge

            [Network]
            DNSSEC = no
            DHCP = yes
            LLMNR = yes
            EmitLLDP = true
            MulticastDNS = yes
            LinkLocalAddressing = yes
            LLDP = yes
            IPv6AcceptRA = yes
            IPForward = yes

            [DHCP]
            UseHostname = no
            RouteMetric = 1024
          '';
        }
        // {
          "10-ethernet".extraConfig = ''
            [Match]
            Type = ether

            [Network]
            DNSSEC = no
            DHCP = yes
            LLMNR = yes
            EmitLLDP = true
            MulticastDNS = yes
            LinkLocalAddressing = yes
            LLDP = yes
            IPv6AcceptRA = yes
            IPForward = yes

            [DHCP]
            UseHostname = no
            RouteMetric = 1024
          '';
        };

      # In TUM the university already firewall us, servers are only accessible from
      # the chair network. The firewall.service also made trouble when reloading
      # rules. It was also an issue when working with kubernetes as their internal
      # firewall is insane. In Edinburgh it might become an issue, but than we
      # don't really run any public services on their except for ssh and k3s, which
      # are safe to run without a firewall. On mickey we still have an NFS share however
      # this one has our nodes whitelisted, which should make it an non issue as well.
      networking.firewall.enable = lib.mkForce false;
    };
}
