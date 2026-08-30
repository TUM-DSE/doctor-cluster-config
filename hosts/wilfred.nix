{
  imports = [
    ../modules/hardware/supermicro-x12spw-tf.nix
    ../modules/nfs/client.nix
    ../modules/ci.nix
    ../modules/vfio/iommu-intel.nix
    ../modules/dpdk.nix
  ];

  boot.hugepages1GB.number = 8;
  boot.hugepages2MB.number = let
    gb = 30;
  in gb * 1024 / 2;

  boot.initrd.availableKernelModules = [ "nvme" ];

  networking.hostName = "wilfred";

  simd.arch = "icelake-server";

  system.stateVersion = "21.11";

  networking.doctor-bridge.enable = true;

  # Onboard X550 (eno1/eno2) tx-hang loop panics the kernel (#1798). Keep ixgbe off it.
  boot.initrd.services.udev.rules = ''
    ACTION=="add", SUBSYSTEM=="pci", KERNEL=="0000:01:00.[01]", ATTR{vendor}=="0x8086", ATTR{driver_override}="pci-stub"
  '';
}
