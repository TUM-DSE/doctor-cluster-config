{ lib, config, ... }:
{
  imports = [
    # people working at our chair
    ./chair-members.nix
    # we put all bachelor/master students here
    ./students.nix
    # when we need to give external reviewers access for paper evaluation
    ./reviewers.nix
    # devices that just connect and do port forwarding to allow for remote access
    ./devices.nix
    # admins also have access to the monitoring / backup infrastructure
    ./admins.nix

    ./extra-user-options.nix
  ];

  config = {
    # only used by jasper atm
    programs.fish.enable = true;

    services.userborn.enable = true;

    # we cannot use this since we no longer have the database
    programs.command-not-found.enable = false;

    assertions =
      let
        # sops age keys in pubkeys.json must belong to an existing account so
        # that removing a user also revokes their access to secrets.
        sopsUsers = builtins.attrNames (lib.importJSON ../../pubkeys.json).users;
        # extra keys of existing users (e.g. second machine)
        aliases = {
          joerg-mac = "joerg";
        };
        stale = builtins.filter (n: !(config.users.users ? ${aliases.${n} or n})) sopsUsers;
      in
      [
        {
          assertion = stale == [ ];
          message = "pubkeys.json contains sops keys for users without an account: ${toString stale}";
        }
      ]
      ++ lib.flatten (
        lib.mapAttrsToList (name: user: {
          assertion =
            user.isSystemUser
            || lib.all (
              group: group != "student" || group != "staff" || group != "admin" || group != "reviewer"
            ) user.extraGroups;
          message = ''
            User ${name} is not in the student, staff, reviewer or admin group.
            Please add them to the correct group.
          '';
        }) config.users.users
      );
  };
}
