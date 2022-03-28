{pkgs, ...}: {
  boot.kernelParams = [
    "console=ttyS0,115200n8"
    "console=tty0"

    "console=ttyS1,115200n8"
    "console=tty1"
  ];

  environment.systemPackages = [pkgs.ipmitool];
}
