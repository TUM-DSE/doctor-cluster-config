{ stdenv
, fetchurl
, libndctl
, systemd
, cmake
, python3
, pkg-config
, asciidoctor
, asciidoc
, lib
, rpmextract
}:

stdenv.mkDerivation rec {
  pname = "ipmctl";
  version = "03.00.00.0485";
  src = fetchurl {
    url = "https://github.com/intel/ipmctl/releases/download/v${version}-2/ipmctl-${version}-1.fc27.src.rpm";
    sha256 = "sha256-mtKe9iTxavmM17NISwysnPWaFvA5mj6TZwNtBrx8s9U=";
  };
  buildInputs = [ libndctl systemd ];
  unpackPhase = ''
    rpmextract $src
    tar -xf ipmctl-${version}.tar.gz
    cd ipmctl-${version}
  '';
  NIX_CFLAGS_COMPILE = "-Wno-error";
  nativeBuildInputs = [ cmake python3 pkg-config asciidoctor asciidoc rpmextract ];
  cmakeFlags = [
    "-DBUILDNUM=1"
    "-DLINUX_PRODUCT_NAME=ipmctl"
    "-DRELEASE=ON"
  ];

  meta = with lib; {
    description = "Utility for configuring and managing Intel Optane Persistent Memory modules";
    homepage = "https://github.com/intel/ipmctl";
    license = licenses.mit;
    maintainers = with maintainers; [ mic92 ];
    platforms = platforms.unix;
  };
}
