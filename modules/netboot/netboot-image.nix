# mkdir /var/lib/netboot
# cp -rv $(nix-build netboot-image.nix)/* /var/lib/netboot
let
  sources = import ../../nix/sources.nix {};
  pkgs = import sources.nixpkgs {};
  lib = pkgs.lib;
  nixos = import (sources.nixpkgs + "/nixos") {
    configuration = { config, pkgs, lib, ... }: with lib; {
      nixpkgs.config.packageOverrides = pkgs: {
        nur = import sources.nur { inherit pkgs; };
      };
      imports = [
        <nixpkgs/nixos/modules/profiles/minimal.nix>
        <nixpkgs/nixos/modules/profiles/all-hardware.nix>
        <nixpkgs/nixos/modules/installer/netboot/netboot.nix>
        ../sshd.nix
        ../users.nix
        ../irc-announce.nix
        ../watchdog.nix
      ];
    };
  };
  rpiAddress = "129.215.165.108";

  customIpxe = pkgs.ipxe.override {
    embedScript = pkgs.writeText "ipxe.script" ''
      #!ipxe

      dhcp
      chain http://${rpiAddress}/boot.ipxe
    '';
  };

  ipxeBootRescue = pkgs.writeText "boot-rescue.ipxe" ''
    #!ipxe

    dhcp
    kernel http://${rpiAddress}/bzImage init=${build.toplevel}/init ${lib.concatStringsSep " " nixos.config.boot.kernelParams} initrd=initrd
    initrd http://${rpiAddress}/initrd
    boot
  '';
   
  ipxeBootLocal = pkgs.writeText "boot-local.ipxe" ''
    #!ipxe

    sanboot --no-describe --drive 0x80
  '';

  build = nixos.config.system.build;
in pkgs.stdenv.mkDerivation {
  name = "netboot";
  dontUnpack = true;
  dontBuild = true;
  installPhase = ''
    install -D ${build.kernel}/bzImage $out/bzImage
    install -D "${toString build.netbootRamdisk}/initrd" $out/initrd
    # DHCP will set filename to load via TFP
    install -D "${customIpxe}/ipxe.efi" $out/nixos.img

    # different boot configurations
    install -D ${ipxeBootRescue} $out/boot-rescue.ipxe
    install -D ${ipxeBootLocal} $out/boot-local.ipxe

    # make a symlink to allow switching between local and rescue boot
    ln -s boot-local.ipxe $out/boot.ipxe
  '';
}
