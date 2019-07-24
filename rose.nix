{
  networking.hostName = "rose";
  networking.retiolum = {
    ipv4 = "10.243.29.178";
    ipv6 = "42:0:3c46:a5a1:618d:663a:f0f1:ec88";
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /home/ 129.215.165.53(rw,nohide,insecure,no_subtree_check,no_root_squash) 129.215.165.54(rw,nohide,insecure,no_subtree_check,no_root_squash)
  '';

  # for nfs
  networking.firewall.enable = false;

  fileSystems."/home" = {
    device = "zroot/root/home";
    fsType = "zfs";
  };
}
