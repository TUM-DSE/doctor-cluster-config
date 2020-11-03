{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    qemu_kvm
    dhcp
  ];
  # to test efi netboot
  OVMF = OVMF.fd;
}
