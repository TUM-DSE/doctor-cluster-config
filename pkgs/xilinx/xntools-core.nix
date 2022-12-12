{ stdenv, callPackage, lib, fetchurl, dpkg, autoPatchelfHook }:
stdenv.mkDerivation rec {
  pname = "xntools-core";
  version = "1.0.0.0-2";
  src = fetchurl {
    url = "https://archive.org/download/firmware-sn1000_1.1.1.1021-1_all/xntools-core_${version}_amd64.deb";
    hash = "sha256-wavu6XYTV8XiaoQT1qDwFEa76Es0hBegfhZFnTG/+NY=";
  };
  nativeBuildInputs = [ dpkg autoPatchelfHook ];
  unpackPhase = ''
    mkdir xntools
    dpkg-deb -x $src xntools
    cd xntools
    chmod -R +w .
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp usr/bin/* $out/bin
  '';

  meta = with lib; {
    description = "SmartNIC utilities package";
    platforms = [ "x86_64-linux" ];
  };
}
