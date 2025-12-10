{ pkgs, lib, ... }:
{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-2015CS.nix
    ../modules/nfs/client.nix
    ../modules/dpdk.nix
    ../modules/elasticsearch.nix
    ../modules/amd_sev_snp-vanilla.nix
  ];

  networking.hostName = "irene";
  # Use the Samsung SSD for the system
  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNE0T804198";
  # Use the PCI 5.0 SSD for the experiments. This lines binds it automatically to vfio
  #virtualisation.vfio.devices = [ "1e0f:0013" ];
  boot.kernel.sysctl = {
    "vm.overcommit_memory" = 1;
  };
  powerManagement.cpuFreqGovernor = "performance";

  # IOMMU disabled, using unsafe no-IOMMU mode for VFIO
  boot.kernelParams = [
    "amd_iommu=off"
    "pcie_aspm.policy=performance"
  ];

  # Load VFIO modules with specific parameters
  boot.kernelModules = [
    "vfio"
    "vfio-pci"
  ];

  boot.extraModprobeConfig = ''
    options vfio enable_unsafe_noiommu_mode=1
    options vfio-pci disable_idle_d3=1
  '';

  # Blacklist vmd module
  boot.blacklistedKernelModules = [ "vmd" ];

  system.stateVersion = "22.11";
  simd.arch = "znver4";
  services.envfs.enable = true;
}
