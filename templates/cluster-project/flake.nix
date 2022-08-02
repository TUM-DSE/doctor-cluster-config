{
  description = "A very basic flake project";

  # update flake.lock to latest nixos-22.05: `nix flake update`
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-22.05;
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
      default = self.devShells.${system}.pinnedcc;

      # is updated to the latest gcc on `nix flake update`
      # doc: https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-mkShell
      rollingcc = pkgs.mkShell {
        depsBuildHost = with pkgs; [ # also called nativeBuildInputs
          gnumake
        ];
        depsHostTarget = with pkgs; [ # also called buildInputs
          zlib # whatever libraries and runtime apps your application needs
        ];
        SOME_ENV_VAR = "bar";
      };

      # remain on gcc10 even after `nix flake update`
      pinnedcc = pkgs.mkShell.override {stdenv = pkgs.gcc10Stdenv; } {
        depsBuildHost = with pkgs; [
          gnumake
        ];
        depsHostTarget = with pkgs; [
          zlib
        ];
      };
    };

  };
}
