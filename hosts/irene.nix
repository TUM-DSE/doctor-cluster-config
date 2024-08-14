{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-2015CS.nix
    ../modules/nfs/client.nix
    ../modules/vfio/iommu-amd.nix
    ../modules/dpdk.nix
    ../modules/elasticsearch.nix
  ];

  networking.hostName = "irene";
  # Use the Samsung SSD for the system
  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNE0T804198";
  # Use the PCI 5.0 SSD for the experiments. This lines binds it automatically to vfio
  #virtualisation.vfio.devices = [ "1e0f:0013" ]; 
  boot.kernel.sysctl = { "vm.overcommit_memory" = 1; };

  system.stateVersion = "22.11";
  simd.arch = "znver4";
}
