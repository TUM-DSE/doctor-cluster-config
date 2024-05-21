let
  atcRev1Keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbZSdnpG8qR8brKRl44z4YbxeivsgAYermfGzSwscfg atc-artifact"
  ];

  extraGroups = [ "wheel" "docker" "input" ];
in
{
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # ATC AE reviewer 1
    atcRev1 = {
      isNormalUser = true;
      home = "/home/sppRev1";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4002;
      allowedHosts = [ "amy" "clara" ];
      openssh.authorizedKeys.keys = atcRev1Keys;
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
  ];
}
