{
  config,
  lib,
  ...
}: let
  cfg = config.networking.doctowho.bonding;

  concatAttrs = attrList: lib.fold (x: y: x // y) {} attrList;

  slaveLinks = concatAttrs (lib.imap0 (num: mac: {
      "05-slave${toString num}".extraConfig = ''
        [Match]
        MACAddress = ${mac}
        Type = ether

        [Link]
        Name = slave${toString num}
      '';
    })
    cfg.macs);

  slaveNetworks = concatAttrs (lib.imap0 (num: _mac: {
      "05-slave${toString num}".extraConfig = ''
        [Match]
        Name = slave${toString num}

        [Network]
        Bond = bond1
      '';
    })
    cfg.macs);

  carrier = lib.imap0 (num: _mac: "slave${toString num}") cfg.macs;
in {
  options = {
    networking.doctowho.bonding.macs = lib.mkOption {
      type = with lib.types; listOf str;
      description = ''
        Mac address of the slave interfaces used in the bond.  The first mac
        address is used for the mac address of the bond interface.
      '';
    };
  };
  config = {
    systemd.network.links = slaveLinks;

    systemd.network.netdevs = {
      "05-bond1" = {
        netdevConfig = {
          Name = "bond1";
          Kind = "bond";
        };
        extraConfig = ''
          [Bond]
          Mode=802.3ad
          TransmitHashPolicy=layer3+4
          MIIMonitorSec=1s
          LACPTransmitRate=fast

          [NetDev]
          MACAddress=${lib.head cfg.macs}
        '';
      };
    };

    systemd.network.networks =
      slaveNetworks
      // {
        "05-bond1".extraConfig = ''
          [Match]
          Name = bond1

          [Network]
          DNSSEC = no
          DHCP = yes
          LLMNR = true
          EmitLLDP = true
          MulticastDNS = yes
          LinkLocalAddressing = yes
          LLDP = true
          IPv6AcceptRA = yes
          IPForward = yes
          BindCarrier = ${toString carrier}

          [DHCP]
          RouteMetric = 512
        '';
      };
  };
}
