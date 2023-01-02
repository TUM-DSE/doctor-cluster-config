{ stdenv, fetchurl, dpkg, autoPatchelfHook }:

let
  firmware = fetchurl {
    url = "https://archive.org/download/firmware-sn1000_1.1.1.1021-1_all/firmware-sn1000_1.1.1.1021-1_all.deb";
    hash = "sha256-KobdUPGJXVaZI1aX+ICR1Ns0Ut05HSRBEpz+C20VzlA=";
  };
  firmwareConfig = fetchurl {
    url = "https://archive.org/download/firmware-sn1000_1.1.1.1021-1_all/firmware-sn1000-config_1.1.0.1-1_all.deb";
    hash = "sha256-eR+Q70RIJ5zFt9zN0IFZEg85NDN3f3Q1sOq9bQrXy7k=";
  };
in
stdenv.mkDerivation {
  pname = "firmware-sn1000";
  version = "1.1.0.1-1";

  nativeBuildInputs = [ dpkg ];
  dontPatchelf = true;
  dontStrip = true;
  unpackPhase = ''
    mkdir firmware firmware-config
    dpkg-deb -x ${firmware} firmware
    dpkg-deb -x ${firmwareConfig} firmware-config
    chmod -R +w .
  '';

  installPhase = ''
    mkdir -p $out/lib
    cp -r firmware-config/lib/* $out/lib
    cp -r firmware/lib/* $out/lib
  '';

  meta = {
    description = "SmartNIC firmware and firmware configuration";
    platforms = [ "x86_64-linux" ];
  };
}
