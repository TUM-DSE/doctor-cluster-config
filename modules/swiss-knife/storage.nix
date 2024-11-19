{ config, lib, ... }:
{
  # also create an lvm with space for each team!
  # This is where teams can mount stuff to.
  systemd.tmpfiles.rules =
    let
      loginUsers = lib.filterAttrs (
        _n: v: v.isNormalUser && lib.hasPrefix "team" v.name
      ) config.users.users;
    in
    (lib.mapAttrsToList (n: _v: "d /mnt/swissknife/${n} 0755 ${n} users -") loginUsers);
}
