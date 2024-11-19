{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "ahci"
    "xhci_pci"
    "nvme"
    "megaraid_sas"
  ];
  boot.kernelModules = [ "kvm-intel" ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
