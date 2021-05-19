{
  networking.firewall.allowedTCPPorts = [ 3389 ];
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "xfce4-session";
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  users.extraUsers.xrdp = {
    extraGroups = [ "wheel" "docker" "plugdev" "input" ];
    # /etc/nixos/secrets/xrdp-password
    hashedPassword = "$6$JVnp0RXTKpCfSc.$A4mp4WmFzVFnwHUPYEjqMQmhlL/9o5tbKKv2y/nY3oojp/aLnWjUzTMspxCadcn4L9b7WyTFHt2VNVkZ6q9Y30";
  };
}
