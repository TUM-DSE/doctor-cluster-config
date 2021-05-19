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
    hashedPassword = "$6$RnQ9vDL2.$3yRErXemfCGqxFgH7vLT9Nm7zftQLmY2yuJ79XED1W/4vKksLeXeqEVhq8jDkq5MFtFxdGvDdLMjKa61jze.l1";
  };
}
