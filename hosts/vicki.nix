
{
  imports = [
    ../modules/hardware/mifcom-tower.nix
    ../modules/disko-zfs-ubuntu.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-Samsung_SSD_990_PRO_1TB_S6Z1NF0WC13969B";

  users.users."ls1.internet" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" "admin" ];
    password = "ls1.internet";
  };

  networking.hostName = "vicki";

  system.stateVersion = "22.11";
}
