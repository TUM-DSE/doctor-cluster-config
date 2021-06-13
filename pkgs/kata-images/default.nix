{ fetchzip }:

let
  version = "2.2.0-alpha0";
in fetchzip {
  url = "https://github.com/kata-containers/kata-containers/releases/download/${version}/kata-static-${version}-x86_64.tar.xz";
  sha256 = "sha256-lL8tKS0FSuFLqrhpwFar/y08wjgrjJ6Tucw7v2uZp/M=";
  # remove unrelated files
  extraPostFetch = ''
    mv $out/kata/share/kata-containers kata-containers
    rm -r $out
    mkdir -p $out/share
    mv kata-containers $out/share/kata-containers
  '';
}
