{ config, ... }: {
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    ../modules/ci.nix
    ../modules/dax.nix # just to disable PM as RAM
    ../modules/vfio/iommu-intel.nix
    ../modules/dpdk.nix
  ];

  boot.hugepages.size = "1GB";
  boot.hugepages.number = 8;

  networking.hostName = "wilfred";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";

  
  # Don't manage vnet interface with systemd-networkd
  systemd.network.netdevs."05-bridge".netdevConfig = {
    Name = "pebr0";
    Kind = "bridge";
    MACAddress = config.networking.doctorwho.currentHost.mac;
  };

  systemd.network.networks."06-bind".extraConfig = ''
    [Match]
    Name=enp24s0f0
    [Network]
    Bridge=pebr0
  '';

  systemd.network.networks."07-bridge-dhcp".extraConfig = ''
    [Network]

    [Match]
    Name=pebr0

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

  # 10-ethernet defines DHCP for all ethernet devices

}
