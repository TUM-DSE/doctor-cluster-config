# lawful-access (aka: global backdoor)
#
# Requirement: 
# Some experiments need to involve multiple hosts which need to be orchestrated via ssh. 
# If they experiments are long-running, the orchestration should happen on a control-server in close proximity to the experiment hosts. 
# Solution: 
# We assume christina to be a trusted host. 
# We place an private ssh key on christina which is added as an authorized key to all users on all hosts. 
# Additionally we should filter this key from giving access to the ssh jumphost.
# Note:
# Since functions cannot be exposed to other nixos modules via config options, modules have to import the "apply" function from a seperate file.

{ config, lib, ... }:
let
  publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJtsBHQzyMp517/Mkf69oYmW+qh/Q3HcLRrjv7bWgrcz lawful_access@all";
  # don't authorize lawful access to these hosts (untested)
  excludeHosts = [ "jumphost" ];
  localhost_is_excluded = lib.elem config.networking.hostName excludeHosts;
in
{

  options = {
    services.openssh.lawful-access.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enable lawful access";
    };

    services.openssh.lawful-access.publicKey = lib.mkOption {
      type = lib.types.str;
      default = if (config.services.openssh.lawful-access.enable == true) then publicKey else "";
      description = "public key to be added to all users on all hosts or emptystring if not enabled";
    };

    services.openssh.lawful-access.controlHost = lib.mkOption {
      type = lib.types.str;
      default = "christina";
      description = "host containing the private key to log in to all other hosts";
    };

    users.users = lib.mkOption {
      # what kind of black magic it this? But is merges keys from other modules with this default one.
      type = lib.types.attrsOf (
        lib.types.submodule {
          config.openssh.authorizedKeys.keys = (lib.optionals (!localhost_is_excluded) [ config.services.openssh.lawful-access.publicKey ]);
        }
      );
    };

  };

  config = lib.mkIf config.services.openssh.lawful-access.enable {

    # defined in hosts/christina.yml
    sops.secrets.lawful-access-key =
      lib.mkIf (config.networking.hostName == config.services.openssh.lawful-access.controlHost)
        {
          mode = "0600";
          owner = "root";
          group = "root";
          path = "/root/.ssh/lawful_access";
        };
  };

}
