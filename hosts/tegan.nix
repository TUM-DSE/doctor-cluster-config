{
  imports = [
    ../modules/disko-ext4.nix
    ../modules/nfs/client.nix
  ];

  boot.loader.systemd-boot.enable = true;

  disko.devices.disk.main.device = "/dev/disk/by-id/nvme-uuid.d03c809b-833e-1c48-a652-06cd6b722f1a";

  networking.hostName = "tegan";

  system.stateVersion = "24.05";
}
