let
  nsdiRev1 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINU+AjLumxWb8dVrVMxwUzegWcZENOO4de886yTOHJc7 ae"
  ];
  nsdiRev3 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPpnTnb57xp2tCDZMe5oONyUxysBm7SP3/0zqRpu6Y3N aec"
  ];
  nsdiRev2 = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHsNlrRA1w0oT2zL8fmd+6exWxFsvDchnZO6pECI93Yc reviewer2@nsdi2025-AEC"
  ];
  extraGroups = [ "wheel" "docker" "input" ];

in {
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # NSDI AE reviwer 1
    nsdiRev1 = {
      isNormalUser = true;
      home = "/home/nsdiRev1";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4200;
      allowedHosts = [ "ryan" "graham" ];
      openssh.authorizedKeys.keys = nsdiRev1;
    };
    # NSDI AE reviwer 1
    nsdiRev2 = {
      isNormalUser = true;
      home = "/home/nsdiRev2";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4201;
      allowedHosts = [ "ryan" "graham" ];
      openssh.authorizedKeys.keys = nsdiRev2;
    };
    # NSDI AE reviwer 1
    nsdiRev3 = {
      isNormalUser = true;
      home = "/home/nsdiRev3";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4202;
      allowedHosts = [ "ryan" "graham" ];
      openssh.authorizedKeys.keys = nsdiRev3;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "risotto"
    "sppRev1"
    "sppRev2"
    "sppRev3"
    "atcRev1"
    "atcRev2"
    "atcRev3"
    "cgo25Rev"
    "cgoPixel8"
  ];
}
