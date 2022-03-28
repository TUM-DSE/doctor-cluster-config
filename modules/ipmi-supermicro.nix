{pkgs, ...}: {
  # supermicro uses ttyS1 for SOL
  boot.kernelParams = [
    "console=ttyS1,115200n8"
    "console=tty1"
  ];

  environment.systemPackages = [pkgs.ipmitool];
}
