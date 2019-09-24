{ config, pkgs, ... }: {
  boot.kernelParams = [
    # spdk/dpdk hugepages
    "default_hugepagesz=1G" "hugepagesz=1G" "hugepages=16"
  ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.dpdk.kmod
  ];
  boot.kernelModules = [ "igb_uio" ];

  # From the output of udevadm info -a -p /sys/bus/pci/devices/0000:03:00.0,
  # where 0000:03:00.0 is our NVME device
  services.udev.extraRules = ''
    # Intel Corporation Express Flash NVMe P4500/P4600
    ATTR{vendor}=="0x8086" ATTR{device}=="0x0a54", RUN+="${pkgs.coreutils}/bin/chmod 666 /sys/bus/pci/devices/$kernel/resource0"

    # Intel Corporation Ethernet Controller XL710 for 40GbE QSFP+
    ATTR{vendor}=="0x8086" ATTR{device}=="0x1583", RUN+="${pkgs.coreutils}/bin/chmod 666 /sys/bus/pci/devices/$kernel/resource0"
    ATTR{vendor}=="0x8086" ATTR{device}=="0x1583", RUN+="${pkgs.coreutils}/bin/chmod 666 /sys/bus/pci/devices/$kernel/resource3"
  '';
}
