{ pkgs, ... }:
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    #../modules/amd_sev_snp.nix
    #../modules/amd_sev_snp-vanilla.nix
    # restored below master 3c88c9d9 ("drop unclaimed custom
    # kernels"): jamie runs the veritas SVSM host kernel (6.11-vc)
    ../modules/amd_sev_svsm.nix
    #../modules/amd_sev_svsm_wallet.nix
    #../modules/nvidia
    ../modules/vfio/iommu-amd.nix

    ../modules/kata-container
    ../modules/tribuchet
  ];

  # H100 runs in Confidential Compute mode for SEV-SNP passthrough; the host
  # driver cannot initialize it, so CDI generation fails and breaks activation.
  hardware.nvidia-container-toolkit.enable = false;

  simd.arch = "znver4";

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNJ0X815786";

  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };

  networking.hostName = "jamie";

  system.stateVersion = "23.05";

  # temporarily disable auto-reboot until the memsafedb eval has finished running                                                                                             
  systemd.timers.auto-reboot.enable = false;                                                                                                                                  
  systemd.services.auto-reboot.enable = false;                                                                                                                                
  systemd.services.auto-upgrade.enable = false;
}
