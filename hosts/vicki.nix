# this is the mifcom tower pc
{ pkgs, ... }:
{
  imports = [
    ../modules/hardware/mifcom-tower.nix
    ../modules/disko-zfs-ubuntu.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-Samsung_SSD_990_PRO_1TB_S6Z1NF0WC13969B";

  # everyone with physical access:
  users.users."ls1.internet" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "plugdev"
      "vboxusers"
      "adbusers"
      "input"
      "admin"
    ];
    password = "ls1.internet";
  };

  # gui
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # disable pulseaudio because it conflicts with our common server config
  hardware.pulseaudio.enable = false;

  # gui packages
  environment.systemPackages = with pkgs; [
    # fprintd # seems to brick the login screen on ThinkPad E14 amd
    pkgs.gnome-terminal
    gedit
    remmina # rdp/vnc client
    alacritty
    wezterm
    firefox
  ];

  networking.hostName = "vicki";

  system.stateVersion = "22.11";
}
