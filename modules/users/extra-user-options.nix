{ config, lib, ... }:
let
  globalConfig = config;
in
{
  options = {
    users.withSops = lib.mkOption {
      type = lib.types.bool;
      description = ''
        Wether to use sops to populate user secrets
      '';
      default = true;
    };
    users.deletedUsers = lib.mkOption {
      type = with lib.types; listOf str;
      description = "List of user names whose home directories, scratchspaces, and shares are to be deleted. Make sure you have backups before using this option!";
    };

    # whitelist users only for selected hosts
    users.users = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule (
          { config, ... }:
          {
            options.xrdpAccess = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = ''
                Whether the user is allowed to login via xrdp.
                Requires user to also have a password set.
              '';
            };
            options.allowedHosts = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              # for students and reviewers, we have an explicit list of allowed hosts
              default =
                if
                  config.isNormalUser
                  && (builtins.elem "student" config.extraGroups || builtins.elem "reviewer" config.extraGroups)
                then
                  [ ]
                else
                  [ "all" ];
              description = ''
                List of hosts the user is allowed to login. If "all", all hosts are allowed
              '';
            };
            config = {
              shell = lib.mkIf (
                !(builtins.elem "all" config.allowedHosts)
                && !(builtins.elem globalConfig.networking.hostName config.allowedHosts)
              ) (lib.mkForce "/run/current-system/sw/bin/nologin");
              hashedPasswordFile =
                lib.mkIf (globalConfig.services.xrdp.enable && config.xrdpAccess)
                  globalConfig.sops.secrets."${config.name}-password-hash".path;
            };
          }
        )
      );
    };
  };
  config = {
    assertions = lib.flatten (
      lib.mapAttrsToList (name: user: {
        assertion = user.isSystemUser || user.allowedHosts != [ ];
        message = ''
          User ${name} has no allowedHosts option set.
          Please add at least one host to the list.
        '';
      }) config.users.users
    );

    sops.secrets = lib.mkIf config.services.xrdp.enable (
      lib.mapAttrs' (
        name: user:
        lib.nameValuePair "${name}-password-hash" {
          neededForUsers = true;
          sopsFile = ./xrdp-passwords.yml;
        }
      ) (lib.filterAttrs (_: v: v.xrdpAccess) config.users.users)
    );
  };
}
