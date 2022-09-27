{config, ...}: let
  risottoKeys = [
    # FIXME: add more keys here
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN86RJ37+RmP8Kh9Va2yHPxqryiTHBBmG7kTUszaJ7Oz asplos23ae"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCd8+GGUwNV5SAikEEucPFuCufCIjexQhuBTNglyzK7yYYnb1dbkBxoWet3bHfwrkkdcbMbyVa19mVGawCJr84/J8imaJGcQjuLtJvUyioJ0+/GbataEviOTk0Ibq58SYemAHk5vx9xFSpA0yR2zWTTrTJ9DQpahTPrLOXmXoC6NOKud9WTwDsZqyjL1iYT0ointt5XlsoYJcpu6DZYgAdGfgWFUp9WCrTnhHc/FndL1PRvGIC1nDF1yMPt9uvKv/+bO8PkNa3Oza0XIk73WmhkYJMAlLvPyF5BK5Rv2GvGKnG9J/SwSbgdhfJKgFeB9kdcZ/GNo2TL8wxJRmXl2KAB asplos23ae"
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
