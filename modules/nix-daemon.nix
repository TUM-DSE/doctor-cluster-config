{ lib, config, pkgs, self, ... }:

let
  gcc-system-features =
    arch:
    lib.optionals (arch != null) (
      [ "gccarch-${arch}" ] ++ map (x: "gccarch-${x}") lib.systems.architectures.inferiors.${arch}
    );
in
{
  options = {
    simd.arch = lib.mkOption {
      type = with lib.types; nullOr str;
      default = null;
      description = ''
        Microarchitecture string for nixpkgs.hostPlatform.gcc.march and to generate system-features.
        Can be determined with: gcc -march=native -Q --help=target | grep march
      '';
    };
  };

  imports = [ ./builder.nix ];

  config = {
    nix = {
      package = lib.mkIf (!pkgs.stdenv.hostPlatform.isRiscV)
        self.inputs.nix-1.packages.${pkgs.stdenv.hostPlatform.system}.nix;
      gc.automatic = true;
      gc.dates = "03:15";
      gc.options = "--delete-older-than 14d";

      # https://github.com/NixOS/nix/issues/719

      settings = {
        keep-outputs = true;
        keep-derivations = true;
        # in zfs we trust
        fsync-metadata = lib.boolToString (
          !config.boot.isContainer or config.fileSystems."/".fsType != "zfs"
        );
        substituters = [
          "https://nix-community.cachix.org"
          "https://cache.dos.cit.tum.de"
        ];
        system-features = [
          "benchmark"
          "big-parallel"
          "kvm"
          "nixos-test"
        ] ++ gcc-system-features config.simd.arch;
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg="
        ];
      };
    };
  };
}
