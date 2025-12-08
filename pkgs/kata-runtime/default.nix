{ stdenv, lib, fetchzip, openssl, zlib, zstd, autoPatchelfHook }:
let version = "3.23.0";
in stdenv.mkDerivation rec {
  pname = "kata";
  inherit version;

  src = fetchzip {
    name = "kata-images-${version}";
    url =
      "https://github.com/kata-containers/kata-containers/releases/download/${version}/kata-static-${version}-amd64.tar.zst";
    hash = "sha256-h7+VXUq1leCIJEqTbDxr1qw1U7XFpiwjC7/sFHd3qFY=";
    nativeBuildInputs = [ zstd ];
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [ openssl zlib ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    cp -r $src/kata $out
    runHook postInstall
  '';

}
