{
  pkgs,
  lib,
  self,
  ...
}:
let
  linuxPackages =
    (pkgs.linuxPackagesFor self.packages.${pkgs.hostPlatform.system}.linux-morello).extend
      (final: prev: { perf = pkgs.linuxPackages.perf; });
in
{
  boot.kernelPackages = lib.mkForce linuxPackages;
  boot.initrd.includeDefaultModules = false;
  boot.initrd.availableKernelModules = [
    "usb-storage"
    "usbhid"
    "hid_generic"
  ];
}
