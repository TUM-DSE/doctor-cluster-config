{ config, lib, ... }: {
  imports = [
    ../modules/podman.nix
  ];

  # tpm-tis does not exists;
  boot.initrd.systemd.tpm2.enable = false;

  hardware.nvidia-jetpack.enable = true;
  hardware.nvidia-jetpack.som = "orin-agx";
  hardware.nvidia-jetpack.carrierBoard = "devkit";

  services.xserver.displayManager.lightdm.enable = true;

  # x11 requires modesetting to be disabled
  hardware.nvidia-jetpack.modesetting.enable = false;

  # This is how to start a container to mount nvidia gpu into the container. However the listed pytorch module seems to be not compatible with the host cuda driver.
  # $ sudo podman run -ti --rm --device=nvidia.com/gpu=all --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix nvcr.io/nvidia/l4t-pytorch:r35.1.0-pth1.11-py3
  virtualisation.podman.enableNvidia = true;

  environment.systemPackages = [
    # > nvidia-ctk cdi list
    # nvidia.com/gpu=0
    # nvidia.com/gpu=all

    config.hardware.nvidia-jetpack.devicePkgs.nvidia-ctk
  ];

  # overrides latest-zfs kernel with kernel also set in modules/apple-silicon-support/modules/kernel/default.nix
  boot.kernelPackages = lib.mkForce config.hardware.nvidia-jetpack.devicePkgs.kernelPackages;
}
