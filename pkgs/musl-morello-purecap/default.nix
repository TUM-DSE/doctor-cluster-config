{
  stdenv,
  clang-morello,
  fetchgit,
}:
stdenv.mkDerivation {
  name = "musl-morello-purecap";
  src = fetchgit {
    url = "https://git.morello-project.org/morello/musl-libc.git";
    rev = "e379080e966573c79096f80d89e5b42f469ac8d1";
    sha256 = "sha256-BCF6mFWoAPIuTe4CTDp1C2zn5oLy6h4haOA5ZSi0F9c=";
  };
  buildInputs = [
    clang-morello
  ];
  configurePhase = ''
    CFLAGS="-march=morello -mabi=purecap" CC=${clang-morello}/bin/clang ./configure --disable-shared --enable-morello --enable-wrapper=clang --prefix=$out --target=aarch64-linux-musl_purecap
  '';

  patchPhase = "";
  enableParallelBuilding = true;

  meta = {
    description = "Morello musl libc";
    platforms = [ "aarch64-linux" ];
  };
}
