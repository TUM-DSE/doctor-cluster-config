{ lib, config, ... }: {
  # create scratch space per user.
  systemd.tmpfiles.rules =
    let
      loginUsers = lib.filterAttrs (n: v: v.isNormalUser) config.users.users;
    in
    lib.mapAttrsToList (n: v: "d /scratch/${n} 0755 ${n} users -") loginUsers;
}
