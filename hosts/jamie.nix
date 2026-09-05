{ pkgs, ... }:
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    # Native-GPU window (patrick, 2026-09-04): the veritas SVSM host
    # kernel (6.11-vc, amd_sev_svsm.nix) breaks native CUDA (cuInit=3),
    # so jamie runs the default kernel with the nvidia host driver for
    # now. Swap amd_sev_svsm.nix back in for veritas work.
    ../modules/amd_sev_snp.nix
    #../modules/amd_sev_svsm.nix
    ../modules/nvidia
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

  # Teofil (6f783a9e, 2026-09-02): no auto-reboot while veritas
  # experiments run on jamie.
  systemd.timers.auto-reboot.enable = false;
  systemd.services.auto-reboot.enable = false;
}
