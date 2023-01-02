{ config
, lib
, pkgs
, ...
}: {
  options = {
    doctorwho.pmem.devices = lib.mkOption {
      description = "List of pmem devices to mount";
      type = lib.types.listOf lib.types.str;
      default = [ "pmem0" ];
    };
  };
  # This is used for persistent memory
  config = {
    # To create/configure pmem devices
    environment.systemPackages = [ (pkgs.callPackage ../pkgs/ipmctl.nix { }) ];

    # enable dax option for fs
    boot.kernelPatches = [
      {
        name = "daxfs-config";
        patch = null;
        extraConfig = ''
          FS_DAX y
        '';
      }
    ];
    # Create a directory for every user on every device
    systemd.tmpfiles.rules =
      let
        loginUsers = lib.filterAttrs (_n: v: v.isNormalUser) config.users.users;
        forDevice = device:
          (lib.mapAttrsToList (n: _v: "d /mnt/${device}/${n} 0755 ${n} users -") loginUsers)
          ++ (builtins.map (n: "R /mnt/${device}/${n} - - - - -") config.users.deletedUsers);
      in
      lib.flatten (builtins.map forDevice config.doctorwho.pmem.devices);

    # Create a mountpoint for every pmem device.
    fileSystems =
      let
        devices = lib.genAttrs config.doctorwho.pmem.devices (name: name);
      in
      lib.mapAttrs'
        (
          dev: _:
            lib.nameValuePair "/mnt/${dev}" {
              device = "/dev/${dev}";
              fsType = "ext4";
              autoFormat = true;
              options = [ "nofail" "dax" ];
            }
        )
        devices;
  };
}
