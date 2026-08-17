{ config, lib, ... }: {
  imports = [
    ../modules/podman.nix
  ];

  # tpm-tis does not exists;
  boot.initrd.systemd.tpm2.enable = false;

  # Passwordless: the emergency shell is only reachable via the local debug
  # UART, and it is our recovery path of last resort (the previous password
  # hash had no known plaintext, locking us out during recovery).
  boot.initrd.systemd.emergencyAccess = true;
  boot.initrd.availableKernelModules = [ "nvme" "usbhid" "usb_storage" "sdhci_tegra" ];

  hardware.nvidia-jetpack.enable = true;
  hardware.nvidia-jetpack.som = "orin-agx";
  hardware.nvidia-jetpack.carrierBoard = "devkit";

  services.xserver.displayManager.lightdm.enable = true;

  # x11 requires modesetting to be disabled
  hardware.nvidia-jetpack.modesetting.enable = false;

  # Enable NVIDIA GPU support in containers (podman/docker via CDI)
  hardware.nvidia-container-toolkit.enable = true;

  # Example: run container with GPU access
  # $ podman run --rm --device=nvidia.com/gpu=all nvcr.io/nvidia/l4t-pytorch:r35.1.0-pth1.11-py3
}
