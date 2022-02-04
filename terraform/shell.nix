with import (builtins.getFlake (toString ../.)).inputs.nixpkgs-unstable {};
mkShell {
  nativeBuildInputs = [
    bashInteractive
    sops
    gnupg
    (pkgs.terraform.withPlugins (
      p: [
        p.gitlab
        p.github
        p.sops
        p.null
      ]
    ))
  ];
}
