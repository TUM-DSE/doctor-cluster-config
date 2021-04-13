{ stdenv, fetchurl, bash, autoPatchelfHook }:

stdenv.mkDerivation rec {
  pname = "kata-containers";
  version = "2.0.3";
  src = fetchurl {
    url = "https://github.com/kata-containers/kata-containers/releases/download/${version}/kata-static-${version}-x86_64.tar.xz";
    sha256 = "sha256-PJmbgZ8rumj7pLmwmackL1vIzck46+tiKt8qhHm23EI=";
  };
  buildInputs = [ bash autoPatchelfHook ];
  installPhase = ''
    mkdir -p $out/opt
    cp -r . $out/opt
    for f in $(grep -I -r -l '/opt' $out); do
      echo $f
      substituteInPlace "$f" \
        --replace "/opt" "$out/opt"
    done
    patchShebangs $out/opt/kata/bin
  '';
}
