{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShellNoCC {
  buildInputs = [
    qemu_kvm
    dhcp
  ];
  # to test efi netboot
  OVMF = OVMF.fd;
}
