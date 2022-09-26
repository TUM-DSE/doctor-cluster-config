{config, ...}: let
  risottoKeys = [
    # FIXME: add more keys here
  ] ++ config.users.users.redha.openssh.authorizedKeys.keys
    ++ config.users.users.joerg.openssh.authorizedKeys.keys;
in {
  # Please use a uid in the range between 4000-5000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # Reviewers for the Risotto paper (ASPLOS'23)
    risotto = {
      isNormalUser = true;
      home = "/home/risotto";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4001;
      allowedHosts = ["yasmin"];
      openssh.authorizedKeys.keys = risottoKeys;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
  ];
}
