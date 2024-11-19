{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 3389 ];
  services.xrdp.enable = true;
  # FIXME: this is actually ignored with the latest xrdp
  services.xrdp.defaultWindowManager = "${pkgs.xfce.xfce4-session}/bin/xfce4-session";
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    xkb.layout = "us";
    xkb.variant = "altgr-intl";
  };
  fonts.enableDefaultPackages = true;

  environment.etc."xrdp/startwm.sh" = {
    text = ''
      ${pkgs.runtimeShell}
      . /etc/profile
      ${pkgs.xfce.xfce4-session}/bin/xfce4-session
    '';
    mode = "755";
  };
}
