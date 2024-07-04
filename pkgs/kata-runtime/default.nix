{ stdenv, lib, fetchzip, openssl, zlib, autoPatchelfHook }:
let version = "3.6.0";
in stdenv.mkDerivation rec {
  pname = "kata";
  version = "3.6.0";

  src = fetchzip {
    name = "kata-images-${version}";
    url =
      "https://github.com/kata-containers/kata-containers/releases/download/${version}/kata-static-${version}-amd64.tar.xz";
    hash = "sha256-ynMzMoJ90BzKuE6ih6DmbM2zWTDxsMwkAKsI8pbO3sg=";
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
