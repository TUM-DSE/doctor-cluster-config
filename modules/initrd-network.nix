{
  boot.initrd.network = {
    enable = true;
    ssh = {
      enable = true;
      port = 2222;
      hostKeys = [ "/etc/ssh/ssh_host_ed25519_key" ];
    };
  };
}
