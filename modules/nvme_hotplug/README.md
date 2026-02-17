# NVMe Hotplug fixes

Kernel patches for PCI/NVMe hotplug debugging.

## Patches

- `pci-fix-register-fields.patch` — Fix wrong reading of register fields in `pcie_failed_link_retrain()`
  - https://lore.kernel.org/all/tencent_753C9F9DFEC140A750F2778E6879E1049406@qq.com/
- `pci-fix-pcie-bridge-gen1-hotplug.patch` — Fix PCIe bridge decreasing to Gen 1 during hotplug
  - https://lore.kernel.org/all/tencent_B9290375427BDF73A2DC855F50397CC9FA08@qq.com/

# Alternatives


- https://lore.kernel.org/all/alpine.DEB.2.21.2511290245460.36486@angie.orcam.me.uk/
