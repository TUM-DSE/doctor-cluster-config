{ pkgs, ... }:
{
  imports = [
    ../modules/disko-ext4.nix
    ../modules/nfs/client.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.kernelParams = [ "isolcpus=56-63" ];

  disko.rootDisk = "/dev/disk/by-id/nvme-uuid.d03c809b-833e-1c48-a652-06cd6b722f1a";

  networking.hostName = "tegan";

  system.stateVersion = "24.05";

  environment.systemPackages = [ pkgs.tio ];
}
