{ pkgs, inputs, ... }: {

  imports = [
    inputs.nix-index-database.nixosModules.nix-index
  ];
  # we don't have a pre-built database for this platform
  programs.nix-index.enable = pkgs.stdenv.system != "riscv64-linux";
  programs.nix-index-database.comma.enable = pkgs.stdenv.system != "riscv64-linux";
}
