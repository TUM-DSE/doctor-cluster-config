{
  perSystem = {system, self', pkgs, ...}: {
    devShells.ansible = pkgs.mkShellNoCC {
      buildInputs = [
        pkgs.bashInteractive
        pkgs.ansible
      ];
    };
  };
}
