{ lib, self, ... }:
{
  # doctor only has admin accounts; take the citLogin mapping from a host
  # that imports the full user set.
  options.monitoring.citLogins = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    readOnly = true;
    default = lib.pipe self.nixosConfigurations.graham.config.users.users [
      (lib.filterAttrs (_: u: u.isNormalUser && u.citLogin != null))
      (lib.mapAttrsToList (_: u: u.citLogin))
      lib.naturalSort
    ];
    description = "RBG/CIT uids allowed to log into grafana/authelia (users.users.<name>.citLogin)";
  };
}
