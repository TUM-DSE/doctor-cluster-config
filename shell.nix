with import <nixpkgs> {};
mkShell {
  nativeBuildInputs = [
    bashInteractive
    niv
  ];
}
