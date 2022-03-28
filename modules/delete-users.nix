{
  lib,
  config,
  ...
}: {
  options = {
    users.deletedUsers = lib.mkOption {
      type = with lib.types; listOf str;
      description = "List of user names whose home directories, scratchspaces, and shares are to be deleted. Make sure you have backups before using this option!";
    };
  };
  config = {
    systemd.tmpfiles.rules = builtins.map (n: "R /home/${n} - - - - -") config.users.deletedUsers;
  };
}
