with import (builtins.getFlake (toString ../.)).inputs.nixpkgs { };
mkShellNoCC {
  nativeBuildInputs = [
    bashInteractive
    sops
    gnupg
    (pkgs.terraform.withPlugins (
      p: [
        p.gitlab
        p.github
        p.sops
      ]
    ))
  ];
}
