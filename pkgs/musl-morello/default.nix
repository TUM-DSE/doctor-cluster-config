{
  stdenv,
  llvm-morello,
  fetchgit,
}:
stdenv.mkDerivation {
  name = "musl-morello";
  src = fetchgit {
    url = "https://git.morello-project.org/morello/musl-libc.git";
    rev = "64ae92a5460476c13c8b73919fdbc3a1f7bbaeb8";
    sha256 = "sha256-mz9CZR7UvN9A+IRaaloGFVLSa/X2e7VqCXG5s5BpKSg=";
  };
  buildInputs = [
    llvm-morello
  ];
  configurePhase = ''
    CC=${llvm-morello}/bin/clang ./configure --disable-shared --enable-morello --disable-libshim --prefix=$out --target=aarch64-linux-musl_purecap
  '';

  patchPhase = "";

  meta = {
    description = "Morello musl libc";
    platforms = [ "aarch64-linux" ];
  };
}
