let
  cgoPixel8Keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOPHHU+BO8E/+Mn98QFbkbz9mYm5wNUTBYGOO8EMGg7o pixel8"
  ];
in
{
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # Pixel 8 connects to graham and sets up port forwarding to allow access for reviewers 
    cgoPixel8 = {
      isNormalUser = true;
      home = "/home/cgoPixel8";
      shell = "/run/current-system/sw/bin/bash";
      uid = 4005;
      allowedHosts = [ "graham" ];
      openssh.authorizedKeys.keys = cgoPixel8Keys;
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
