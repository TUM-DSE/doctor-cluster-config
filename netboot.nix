# nix-build netboot.nix
with import <nixpkgs> {};
let
  sources = import ./nix/sources.nix {};
  nixos = import <nixpkgs/nixos> {
    configuration = { config, pkgs, lib, ... }: with lib; {
      nixpkgs.config.packageOverrides = pkgs: {
        nur = import sources.nur { inherit pkgs; };
      };
      imports = [
        <nixpkgs/nixos/modules/profiles/minimal.nix>
        <nixpkgs/nixos/modules/profiles/all-hardware.nix>
        <nixpkgs/nixos/modules/installer/netboot/netboot.nix>
        ./modules/sshd.nix
        ./modules/users.nix
        ./modules/irc-announce.nix
      ];
    };
  };
  build = nixos.config.system.build;
in stdenv.mkDerivation {
  name = "pxeboot";
  dontUnpack = true;
  dontBuild = true;
  installPhase = ''
    install -D ${build.kernel}/bzImage $out/bzImage
    install -D "${toString build.netbootRamdisk}/initrd" $out/initrd
    echo "init=${build.toplevel}/init ${lib.concatStringsSep " " nixos.config.boot.kernelParams}" > $out/cmdline
  '';
}
