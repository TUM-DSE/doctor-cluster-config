{ pkgs, ... }:
{
  # Assuming this is installed on top of the disk image.
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/NIXOS_BOOT";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };
  boot.loader.grub.enable = false;
  boot.loader.raspberryPi.enable = true;
  boot.loader.raspberryPi.version = 4;
  # get more log messages from bootloader over uart console
  boot.loader.raspberryPi.firmwareConfig = ''
    uart_2ndstage=1
  '';

  # Mainline doesn't work yet
  boot.kernelPackages = pkgs.linuxPackages_rpi4;

  # ttyAMA0 is the serial console broken out to the GPIO
  boot.kernelParams = [
    "earlycon=uart8250,mmio32,0xfe215040"
    "console=ttyAMA0,115200"
    "console=tty1"
  ];

  services.mingetty.serialSpeed = [ 115200 ];

  # Required for the Wireless firmware
  hardware.enableRedistributableFirmware = true;
}
