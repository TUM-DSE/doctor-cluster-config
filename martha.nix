{
  imports = [
    ./modules/nfs-home.nix
    ./modules/sgx/graphene.nix
  ];


  # TODO migrate to actual /home
  harshanavkis = let
    harshanavkisKeys = ''
      ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFsPBOH3MrVwF8L9OdPbab6jj3dtGp8KORonKr/qnia6HTqZKLAi7p4xWz2iXFNJvzbjxXJpg58XLCptxMBEYhlFdBy9OgKfrFCwz5svwq3J9qy/zE/tij20UTK2kgGn+QeaTWRxgf9XpJjtjTDdxaLXi4JH38wXHrqDQe+w9ixyaqb+xIm4UcZMWlzOwsHP7Sn2AOeZdfL2n3VlVKPPFMfA69rv1v02JZI0PsKwE5J/qc/AF4Sq3oBCW0IVdZyVe7iOOB6P2BMdb3gd32Lj9w/o2M2PSxDUsGwqcj1A5aBw5xFbtPcRhtWswn2j2i5zFyMoX8sC/3SWu55KMh73Ix hvub@hack-haven
    '';
  in {
    isNormalUser = true;
    home = "/scratch/harshanavkis";
    extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" ];
    shell = "/run/current-system/sw/bin/zsh";
    uid = 1005;
    openssh.authorizedKeys.keys = [ harshanavkisKeys ];
  };


  networking.hostName = "martha";
  networking.retiolum = {
    ipv4 = "10.243.29.179";
    ipv6 = "42:0:3c46:5466:7dbe:f27a:673f:ea64";
  };
}
