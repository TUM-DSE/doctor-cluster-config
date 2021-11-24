{ lib, config, pkgs, ... }:
{
  nix = {
    gc.automatic = true;
    gc.dates = "03:15";
    package = pkgs.nix_2_4;

    # should be enough?
    nrBuildUsers = lib.mkDefault 32;

    daemonIOSchedClass = "idle";
    daemonCPUSchedPolicy = "idle";

    # https://github.com/NixOS/nix/issues/719
    extraOptions = ''
      builders-use-substitutes = true
      keep-outputs = true
      keep-derivations = true
      # in zfs we trust
      fsync-metadata = ${lib.boolToString (config.fileSystems."/".fsType != "zfs")}
      experimental-features = nix-command flakes
    '';

    autoOptimiseStore = true;

    binaryCaches = [
      "https://nix-community.cachix.org"
      "https://mic92.cachix.org"
    ];

    binaryCachePublicKeys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "mic92.cachix.org-1:gi8IhgiT3CYZnJsaW7fxznzTkMUOn1RY4GmXdT/nXYQ="
    ];
  };

  systemd.services.update-prefetch = {
    wantedBy = [ "multi-user.target" ];
    path = [ config.nix.package pkgs.nettools ];
    script = ''
      nix build \
       --out-link /run/next-system \
       github:Mic92/doctor-cluster-config/last-build#nixosConfigurations.$(hostname).config.system.build.toplevel
    '';
    startAt = "daily";
  };

  imports = [ ./builder.nix ];

  nixpkgs.config.allowUnfree = true;
}
