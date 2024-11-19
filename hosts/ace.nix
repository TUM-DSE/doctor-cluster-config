{ lib, ...}: {
  imports = [
    ../modules/hardware/morello.nix
    ../modules/nfs/client.nix
    ../modules/disko-zfs.nix
  ];

  networking.hostName = "ace";

  disko.rootDisk = "/dev/disk/by-id/ata-HFS480G3H2X069N_ESC3N5648I3603P2Y";

  system.stateVersion = "24.05";

  boot.loader.efi.canTouchEfiVariables = lib.mkForce true;
  boot.loader.systemd-boot.enable = true;
}
