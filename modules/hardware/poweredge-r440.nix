{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["ahci" "xhci_pci" "nvme" "megaraid_sas"];
  boot.kernelModules = ["kvm-intel"];

  fileSystems."/" = {
    device = "zroot/root/nixos";
    fsType = "zfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS_BOOT";
    fsType = "vfat";
    options = ["nofail"];
  };

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
