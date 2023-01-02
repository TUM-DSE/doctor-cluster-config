{ config, lib, ... }:
{
  # Instructions to add a new password:
  # Run:
  # $ inv generate-password --user <USER>
  # Send the password in `<USER>-password` to the student
  # and store <USER>-password-hash in `./hosts/ryan.yml` by doing:
  # $ sops ./hosts/ryan.yml
  # Than add the user to the `users.xrdpUsers` list

  options = {
    users.xrdpUsers = lib.mkOption {
      type = with lib.types; listOf str;
      description = "Setup xrdp access for these users. This assumes that there is a password hash present in ./modules/secrets.yml";
    };
  };
  config = {
    sops.secrets = lib.listToAttrs (map
      (user: lib.nameValuePair "${user}-password-hash" {
        neededForUsers = true;
      })
      config.users.xrdpUsers);

    users.users = lib.listToAttrs (map
      (user: lib.nameValuePair user {
        passwordFile = config.sops.secrets."${user}-password-hash".path;
      })
      config.users.xrdpUsers);

    # add all users here that should have xrdp access.
    users.xrdpUsers = [
      "yihe" # TODO comment needed. He is not part of sys-lab
      "joerg"
    ];
  };
}
