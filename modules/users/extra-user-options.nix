{ config, lib, pkgs, ... }:
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
      type = lib.types.attrsOf (lib.types.submodule ({ config, ... }: {
        options.allowedHosts = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          description = "List of hosts the user is allowed to login. If empty all hosts are allowed";
        };
        config = lib.mkIf (config.allowedHosts != [ ] && !(builtins.elem globalConfig.networking.hostName config.allowedHosts)) {
          shell = lib.mkForce "/run/current-system/sw/bin/nologin";
        };
      }));
    };
  };
}
