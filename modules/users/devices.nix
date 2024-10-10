let
  pixel8Keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOPHHU+BO8E/+Mn98QFbkbz9mYm5wNUTBYGOO8EMGg7o pixel8"
  ];
in
{
  # Please use a uid in the range between 5000-6000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # Pixel 8 connects to graham and sets up port forwarding to allow remote access. 
    # The account cannot log in, just connect and setup port forwarding. This is configured in `hosts/graham.nix`
    pixel8 = {
      isNormalUser = true;
      shell = "/run/current-system/sw/bin/bash";
      uid = 5000;
      allowedHosts = ["graham"];
      openssh.authorizedKeys.keys = pixel8Keys;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
  ];
}
