{
  pkgs,
  lib,
  self,
  ...
}:
let
  linuxPackages =
    (pkgs.linuxPackagesFor self.packages.${pkgs.stdenv.hostPlatform.system}.linux-morello).extend
      (final: prev: { perf = pkgs.perf; });
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
