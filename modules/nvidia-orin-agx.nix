{ config, lib, ... }: {
  imports = [
    ../modules/podman.nix
  ];

  # tpm-tis does not exists;
  boot.initrd.systemd.tpm2.enable = false;

  boot.initrd.systemd.emergencyAccess = "$6$ezQIHzACzYp4zwHi$IAsJI6zHUXYuhv0NVlk5CiRj1B8DT/yGzjSFev2ZjovvSHkY4/YJ2/c9gnJvc7T7nF/0jt9icihJXpAuvsciS.";
  boot.initrd.availableKernelModules = [ "nvme" "usbhid" "usb_storage" "sdhci_tegra" ];

  hardware.nvidia-jetpack.enable = true;
  hardware.nvidia-jetpack.som = "orin-agx";
  hardware.nvidia-jetpack.carrierBoard = "devkit";

  services.xserver.displayManager.lightdm.enable = true;

  # x11 requires modesetting to be disabled
  hardware.nvidia-jetpack.modesetting.enable = false;

  # Enable Docker with NVIDIA GPU support
  virtualisation.docker.enable = true;
  virtualisation.docker.enableNvidia = true;

  # Example: run container with GPU access
  # $ docker run --rm --device=nvidia.com/gpu=all nvcr.io/nvidia/l4t-pytorch:r35.1.0-pth1.11-py3
}
