
{
  imports = [
    # ../modules/hardware/placeholder.nix
    ../modules/disko-zfs-ubuntu.nix
  ];

  disko.rootDisk = "/dev/sdc";

  networking.hostName = "vicki";

  system.stateVersion = "22.11";
}
