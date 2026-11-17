{ pkgs, ... }:
{
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/compiler-hw-lab
    ../modules/dpdk.nix
    ../modules/vfio/iommu-intel.nix
    ../modules/lowlatency-vm-host.nix
    ../modules/monitoring/fpga-dashboard/switch-collector.nix
  ];

  boot.hugepages1GB.number = 8;
  boot.hugepages2MB.number =
    let
      gb = 30;
    in
    gb * 1024 / 2;

  systemd.network.ignorePci = [
    "0000:00:1c.0"
    "0000:00:1c.1"
  ];

  boot.initrd.availableKernelModules = [ "nvme" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu_full;
  };
  environment.systemPackages = [ pkgs.libvirt ];

  networking.doctor-bridge.enable = true;

  # eno1 is a direct low-latency link into VMs: bridge without STP/forward
  # delay, no IP config, and libvirt-created lltap* left alone by networkd.
  systemd.network.netdevs."04-lowlat-bridge" = {
    netdevConfig = {
      Name = "lowlat-bridge";
      Kind = "bridge";
    };
    bridgeConfig = {
      STP = false;
      ForwardDelaySec = 0;
      MulticastSnooping = false;
    };
  };

  systemd.network.networks."04-lowlat-eno1" = {
    matchConfig.Name = "eno1";
    networkConfig = {
      Bridge = "lowlat-bridge";
      DHCP = "no";
      LinkLocalAddressing = "no";
      IPv6AcceptRA = false;
    };
    linkConfig.RequiredForOnline = "enslaved";
  };

  systemd.network.networks."04-lowlat-bridge" = {
    matchConfig.Name = "lowlat-bridge";
    networkConfig = {
      DHCP = "no";
      LinkLocalAddressing = "no";
      IPv6AcceptRA = false;
    };
    linkConfig.RequiredForOnline = "no";
  };

  systemd.network.networks."04-lowlat-lltap" = {
    matchConfig.Name = "lltap*";
    linkConfig.Unmanaged = true;
  };

  networking.hostName = "christina";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";
}
