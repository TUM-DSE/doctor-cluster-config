{ pkgs, ... }: {
  # we don't have a pre-built database for this platform
  programs.nix-index.enable = pkgs.stdenv.system != "riscv64-linux";
}
