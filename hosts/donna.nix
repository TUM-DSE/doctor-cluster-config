{ config, pkgs, lib, ... }:
{
  imports = [
    ../modules/hardware/macmini-m1.nix
    ../modules/apple-silicon-support
    ../modules/nfs/client.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # apple-silicon-support tries to patch systemd, but those patches are upstream already.
  systemd.package = lib.mkForce pkgs.systemd;
  networking.hostName = "donna";

  hardware.asahi.enable = true;

  # overrides latest-zfs kernel with kernel also set in modules/apple-silicon-support/modules/kernel/default.nix
  boot.kernelPackages = lib.mkForce (let
    pkgs' = config.hardware.asahi.pkgs;
  in
    pkgs'.linux-asahi.override {
      _kernelPatches = config.boot.kernelPatches;
      withRust = config.hardware.asahi.withRust;
    });
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
  # get rid of internal overlay
  hardware.asahi.pkgs = lib.mkForce (
    import ../modules/apple-silicon-support/packages/overlay.nix pkgs pkgs
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
