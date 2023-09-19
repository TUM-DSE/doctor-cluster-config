
{
  imports = [
    ../modules/hardware/poweredge7625.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_1TB_S4EWNX0R410276D";

  networking.hostName = "vislor";

  system.stateVersion = "22.11";
}
