{
  description = "A generic development shell";

  # To update flake.lock to the latest nixpkgs: `nix flake update`
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  # output format guide https://nixos.wiki/wiki/Flakes#Output_schema
  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {
        # is updated to the latest gcc on `nix flake update`
        # doc: https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-mkShell
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            # sometimes called `depsBuildHost`
            cmake
            pkg-config
          ];
          buildInputs = with pkgs; [
            # sometimes called `depsHostTarget`
            # if you dont know where to put a required package, put it here
            # Find more packages on https://search.nixos.org/packages
            zlib
          ];

          # All assignments become environments variable in the development shell.
          SOME_ENV_VAR = "bar";
        };

        # Pinned gcc: remain on gcc10 even after `nix flake update`
        #default = pkgs.mkShell.override { stdenv = pkgs.gcc10Stdenv; } {
        #  depsBuildHost = with pkgs; [
        #    cmake pkg-config
        #  ];
        #  depsHostTarget = with pkgs; [
        #    zlib
        #  ];
        #};

        # Clang example:
        #default = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
        #  depsBuildHost = with pkgs; [
        #    cmake pkg-config
        #  ];
        #  depsHostTarget = with pkgs; [
        #    zlib
        #  ];
        #};
      };
    };
}
