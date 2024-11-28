{
  stdenv,
  zlib,
  fetchzip,
  autoPatchelfHook,
}:
stdenv.mkDerivation {
  name = "morello-clang";
  src = fetchzip {
    url = "https://github.com/TUM-DSE/doctor-cluster-config/releases/download/morello/artifacts.zip";
    sha256 = "sha256-4D7Psufm80nb1CdN637FWcl7/djBGkWoHM8Kzg8tlaA=";
    stripRoot = false;
  };
  installPhase = ''
    tar -xf llvm-morello-linux-aarch64-clang.tar.gz
    mv llvm-morello-linux-aarch64/ $out
  '';
  buildInputs = [
    zlib
    stdenv.cc.cc
  ];
  nativeBuildInputs = [ autoPatchelfHook ];
  doInstallCheck = true;
  installCheckPhase = ''
    $out/bin/clang --version
  '';
  meta = {
    description = "Morello build toolchain";
    platforms = [ "aarch64-linux" ];
  };
}
