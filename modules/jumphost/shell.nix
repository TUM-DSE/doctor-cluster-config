with import <nixpkgs> {};
mkShellNoCC {
  nativeBuildInputs = [
    bashInteractive
    ansible
  ];
}
