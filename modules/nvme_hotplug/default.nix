{

  boot.kernelPatches = [
      {
        name = "pci_debugging";
        patch = null;
        extraConfig = ''
          PCI_DEBUG  y
        '';
      }
      {
        name = "pci-fix-register-fields";
        patch = ./patches/pci-fix-register-fields.patch;
      }
      {
        name = "pci-fix-pcie-bridge-gen1-hotplug";
        patch = ./patches/pci-fix-pcie-bridge-gen1-hotplug.patch;
      }
  ]; 
}
