{ fetchzip }:

let
  version = "2.1.1";
  #version = "2.2.0-alpha0";
in fetchzip {
  name = "kata-images-${version}";
  url = "https://github.com/kata-containers/kata-containers/releases/download/${version}/kata-static-${version}-x86_64.tar.xz";
  sha256 = "sha256-Tee7JW1j6fcUanrun3LS+B1a4/gUSw7FAJ5ARPmV6O8=";
  # remove unrelated files
  extraPostFetch = ''
    mv $out/kata/share/kata-containers kata-containers
    rm -r $out
    mkdir -p $out/share
    mv kata-containers $out/share/kata-containers
  '';
}
