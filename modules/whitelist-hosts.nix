{ lib
, config
, ...
}:
let
  globalConfig = config;
in
{
  options = {
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
