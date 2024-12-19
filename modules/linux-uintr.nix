{ pkgs, lib, ... }:
let
    linux_uintr = pkgs.callPackage ../pkgs/kernels/linux-uintr.nix { };
    linuxPackages_uintr = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_uintr);
in
{
    boot.kernelPackages = lib.mkForce linuxPackages_uintr;
    boot.kernelParams = ["isolcpus=0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,126" "nohz_full=0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,126" "intel_iommu=off" "nopat" "watchdog_thresh=0"];
}
