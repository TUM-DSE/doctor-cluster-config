{pkgs, ...}: {
  environment.systemPackages = [pkgs.ipmitool];
}
