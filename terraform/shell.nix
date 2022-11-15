with import (builtins.getFlake (toString ../.)).inputs.nixpkgs-unstable {};
  mkShellNoCC {
    nativeBuildInputs = [
      bashInteractive
      sops
      gnupg
      (pkgs.terraform.withPlugins (
        p: [
          p.github
          (pkgs.callPackage ./gitlab.nix {})
          p.sops
        ]
      ))
    ];
  }
