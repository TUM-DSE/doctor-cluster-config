{
  description = "A generic development shell";

  # update flake.lock to latest nixos: `nix flake update`
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  # output format guide https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = { self, nixpkgs }: let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {

    packages.${system} = {
      hello = pkgs.hello;
      default = self.packages.${system}.hello;
    };

    devShells.${system} = {
      default = self.devShells.${system}.pinned-gcc;

      # is updated to the latest gcc on `nix flake update`
      # doc: https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-mkShell
      rolling-gcc = pkgs.mkShell {
        depsBuildHost = with pkgs; [ # also called `nativeBuildInputs`
          cmake pkg-config
        ];
        depsHostTarget = with pkgs; [ # also called `buildInputs`
          zlib # whatever libraries and runtime apps your application needs
          # Find more packages on https://search.nixos.org/packages
        ];
        SOME_ENV_VAR = "bar";
      };

      # remain on gcc10 even after `nix flake update`
      pinned-gcc = pkgs.mkShell.override { stdenv = pkgs.gcc10Stdenv; } {
        depsBuildHost = with pkgs; [
          cmake pkg-config
        ];
        depsHostTarget = with pkgs; [
          zlib
        ];
      };

      clang = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
        depsBuildHost = with pkgs; [
          cmake pkg-config
        ];
        depsHostTarget = with pkgs; [
          zlib
        ];
      };
    };

  };
}
