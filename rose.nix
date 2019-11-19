{
  networking.hostName = "rose";
  networking.retiolum = {
    ipv4 = "10.243.29.178";
    ipv6 = "42:0:3c46:a5a1:618d:663a:f0f1:ec88";
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = let
    opts = "rw,nohide,insecure,no_subtree_check,no_root_squash";
  in ''
    /home/ 129.215.165.53(${opts}) 129.215.165.54(${opts}) 129.215.165.57(${opts}) 129.215.165.58(${opts})
  '';

  # for nfs
  networking.firewall.enable = false;

  fileSystems."/home" = {
    device = "zroot/root/home";
    fsType = "zfs";
  };
}
