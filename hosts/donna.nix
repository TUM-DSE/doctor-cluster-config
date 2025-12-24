{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  # Extend pkgs with the asahi overlay without adding it to nixpkgs.overlays
  # (which would cause slow re-evaluation of the entire pkgs set)
  asahiPkgs = pkgs.extend inputs.nixos-apple-silicon.overlays.default;
in
{
  imports = [
    ../modules/hardware/macmini-m1.nix
    ../modules/nfs/client.nix
    inputs.nixos-apple-silicon.nixosModules.default
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "donna";

  hardware.asahi.enable = true;

  # Prevent the module from adding its overlay to nixpkgs.overlays
  nixpkgs.overlays = lib.mkForce [ ];

  # Provide the asahi packages directly without using the overlay mechanism
  hardware.asahi.pkgs = lib.mkForce asahiPkgs;

  # Override latest-zfs kernel with linux-asahi
  boot.kernelPackages = lib.mkForce (
    asahiPkgs.linux-asahi.override {
      _kernelPatches = config.boot.kernelPatches;
    }
  );

  hardware.asahi.peripheralFirmwareDirectory = builtins.toString (
    pkgs.runCommand "all_firmware" { } ''
      mkdir -p $out
      cp ${
        (pkgs.fetchurl {
          url = "https://github.com/TUM-DSE/doctor-cluster-config/releases/download/firmware/all_firmware.tar.gz";
          sha256 = "sha256-rLxgPlxtByDD6D+sBp5ShTIcvtle7hf2C+pmsBfZIW4=";
        })
      } $out/all_firmware.tar.gz
      cp ${
        (pkgs.fetchurl {
          url = "https://github.com/TUM-DSE/doctor-cluster-config/releases/download/firmware/kernelcache.release.mac13g.gz";
          sha256 = "sha256-J0jbUp3p47GGHXwTvBiSMD5HzJXIjDR05VeJpnYIzSg=";
        })
      } $out/kernelcache.release.mac13g.gz
      gzip -d $out/kernelcache.release.mac13g.gz
    ''
  );

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  #networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.end0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0f0.useDHCP = lib.mkDefault true;

  system.stateVersion = "23.05";

}
