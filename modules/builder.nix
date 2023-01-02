{
  users.extraUsers.nix = {
    isNormalUser = true;
    home = "/home/nix";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF48CsASF4l2oVA9GNNi0LCd4ONOtf0zkQx1tUbhSW3S joerg@turingmachine"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPS4sLGbDPZ4UDT3Rhy8uAz5vduRUAr0uEvdnUBP0cm4 nix@eve"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKs8JnEt7KgZBND3bHURoaxfDy3l0sMb0S07O165ySv2 doctorBuilder:peter@aenderpad"
    ];
    uid = 5001;
  };
  nix.settings.trusted-users = [ "nix" ];
}
