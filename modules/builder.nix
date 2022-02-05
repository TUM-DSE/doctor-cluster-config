{
  users.extraUsers.nix = {
    isNormalUser = true;
    home = "/home/nix";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF48CsASF4l2oVA9GNNi0LCd4ONOtf0zkQx1tUbhSW3S joerg@turingmachine"
    ];
    uid = 5001;
  };
  nix.trustedUsers = [ "nix" ];
}
