{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  nix = {
    gc.automatic = true;
    gc.dates = "03:15";
    gc.options = "--delete-older-than 14d";

    # should be enough?
    nrBuildUsers = lib.mkDefault 32;

    daemonIOSchedClass = "idle";
    daemonCPUSchedPolicy = "idle";

    # https://github.com/NixOS/nix/issues/719

    settings = {
      # https://github.com/NixOS/nix/issues/719
      builders-use-substitutes = true;
      keep-outputs = true;
      keep-derivations = true;
      # in zfs we trust
      fsync-metadata = lib.boolToString (!config.boot.isContainer or config.fileSystems."/".fsType != "zfs");
      experimental-features = "nix-command flakes";
      substituters = [
        "https://nix-community.cachix.org"
        "https://tum-dse.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "tum-dse.cachix.org-1:v67rK18oLwgO0Z4b69l30SrV1yRtqxKpiHodG4YxhNM="
      ];
    };
  };

  # inputs == flake inputs in configurations.nix
  environment.etc = let
    inputsWithDate = lib.filterAttrs (_: input: input ? lastModified) inputs;
    flakeAttrs = input: (lib.mapAttrsToList (n: v: ''${n}="${v}"'')
      (lib.filterAttrs (n: v: (builtins.typeOf v) == "string") input));
    lastModified = name: input: ''
      flake_input_last_modified{input="${name}",${lib.concatStringsSep "," (flakeAttrs input)}} ${toString input.lastModified}'';
  in {
    "flake-inputs.prom" = {
      mode = "0555";
      text = ''
        # HELP flake_registry_last_modified Last modification date of flake input in unixtime
        # TYPE flake_input_last_modified gauge
        ${lib.concatStringsSep "\n" (lib.mapAttrsToList lastModified inputsWithDate)}
      '';
    };
  };
  services.telegraf.extraConfig.inputs.file = [
    {
      data_format = "prometheus";
      files = ["/etc/flake-inputs.prom"];
    }
  ];

  imports = [./builder.nix];

  nixpkgs.config.allowUnfree = true;
}
