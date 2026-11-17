# R     /dir/to/remove/recursively               -    -    -     -           -
{ lib, config, ... }:
{
  options.scratchSpace.mode = lib.mkOption {
    type = lib.types.str;
    default = "0755";
    description = "Permissions of the per-user directories in /scratch and /scratch2.";
  };

  # Create scratch space per user.
  # The scratch space is not backed up!
  # /scratch is stored on the local rootfs (usually zfs) instead of NFS
  # /scratch2 is meant for dedicated storage devices. We usually use a faster
  #           more common fileystem i.e. ext4. Use this for
  #           benchmarks/evaluation if present. This block device might be more
  #           of re-formatted in order to have consistent measurement results
  config.systemd.tmpfiles.rules =
    let
      loginUsers = lib.filterAttrs (_n: v: v.isNormalUser || v.name == "root") config.users.users;
    in
    (lib.mapAttrsToList (n: _v: "d /scratch/${n} ${config.scratchSpace.mode} ${n} users -") loginUsers)
    ++ (builtins.map (n: "R /scratch/${n} - - - - -") config.users.deletedUsers)
    ++ (lib.optionals (config.fileSystems ? "/scratch2") (
      (lib.mapAttrsToList (n: _v: "d /scratch2/${n} ${config.scratchSpace.mode} ${n} users -") loginUsers)
      ++ (builtins.map (n: "R /scratch/${n} - - - - -") config.users.deletedUsers)
    ));
}
