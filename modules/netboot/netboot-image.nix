# mkdir /var/lib/netboot
# cp -rv $(nix-build netboot-image.nix)/* /var/lib/netboot
let
  flake = builtins.getFlake (toString ../..);
  pkgs = flake.inputs.nixpkgs.legacyPackages.x86_64-linux;
  lib = pkgs.lib;
  nixos = import (pkgs.path + "/nixos") {
    configuration = {
      config,
      pkgs,
      lib,
      modulesPath,
      ...
    }:
      with lib; {
        networking.hostName = "netboot";
        services.openssh.hostKeys = [
          {
            bits = 4096;
            path = ../../secrets/netboot_host_rsa_key;
            type = "rsa";
          }
          {
            path = ../../secrets/netboot_host_ed25519_key;
            type = "ed25519";
          }
        ];

        nixpkgs.overlays = [flake.inputs.nur.overlay];
        imports = [
          "${modulesPath}/profiles/minimal.nix"
          "${modulesPath}/profiles/all-hardware.nix"
          "${modulesPath}/installer/netboot/netboot.nix"
          ../sshd
          (import ../users.nix true)
          ../irc-announce.nix
          ../tor-ssh.nix
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

    kernel http://${rpiAddress}/bzImage init=${build.toplevel}/init ${lib.concatStringsSep " " nixos.config.boot.kernelParams} initrd=initrd
    initrd http://${rpiAddress}/initrd
    boot
  '';

  ipxeBootLocal = pkgs.writeText "boot-local.ipxe" ''
    #!ipxe

    sanboot --no-describe --drive 0x80
  '';

  build = nixos.config.system.build;
in
  pkgs.stdenv.mkDerivation {
    name = "netboot";
    dontUnpack = true;
    dontBuild = true;
    installPhase = ''
      install -D ${build.kernel}/bzImage $out/bzImage
      install -D "${toString build.netbootRamdisk}/initrd" $out/initrd
      # DHCP will set filename to load via TFP
      install -D "${customIpxe}/ipxe.efi" $out/nixos.img
      install -D "${customIpxe}/ipxe-efi.usb" $out/nixos-usb.img
      install -D "${customIpxe}/undionly.kpxe" $out/nixos-bios.img
      install -D "${customIpxe}/ipxe.usb" $out/nixos-bios-usb.img

      # different boot configurations
      install -D ${ipxeBootRescue} $out/boot-rescue.ipxe
      install -D ${ipxeBootLocal} $out/boot-local.ipxe

      # make a symlink to allow switching between local and rescue boot
      ln -s boot-local.ipxe $out/boot.ipxe
    '';
  }
