{ stdenv, fetchurl, dpkg }:
# probably needs an update https://packages.xilinx.com/ui/native/debian-packages/pool/
stdenv.mkDerivation rec {
  pname = "xilinx-firmware";
  version = "201920_3-3";
  src = fetchurl {
    url = "https://www.xilinx.com/bin/public/openDownload?filename=xilinx-u50-gen3x16-xdma-${version}_all.deb.tar.gz";
    sha256 = "sha256-yYl6/p7/mCJInlKyyn3DnHqX1qG3ar+Zk/GbpvWntAs=";
  };
  nativeBuildInputs = [ dpkg ];
  dontUnpack = true;
  installPhase = ''
    tar -vxf ${src} 
    for p in *.deb; do
      dpkg-deb -x $p root
    done

    mkdir -p control $out/share/xilinx-firmware
    pushd control
    for p in ../*.deb; do
      name=$(basename "$p" .deb)
      dpkg-deb -e $p "$name"
      mv $name/postinst $out/share/xilinx-firmware/$name
    done
    popd

    cp -r root/{opt,lib} $out
  '';
}

