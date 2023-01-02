{ stdenv, kernel, lib, fetchurl, dpkg }:
let
  KERNELDIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
stdenv.mkDerivation rec {
  name = "sfc-drivers";
  version = "5.3.11.1000";
  src = fetchurl {
    url = "https://archive.org/download/sfc-dkms_${version}_all/sfc-dkms_${version}_all.deb";
    hash = "sha256-yEDKmR4+R9qHFWB0tpY8RnGldG/+InAimPCxu0cc64M=";
  };
  nativeBuildInputs = [ dpkg ];
  unpackPhase = ''
    mkdir sfc-dkms
    dpkg-deb -x $src sfc-dkms
    cd sfc-dkms
    chmod -R +w .
  '';

  patches = [
    ./0001-port-to-linux-5.15.patch
  ];

  buildPhase = ''
    export INSTALL_MOD_PATH=$out
    cd usr/src/sfc-${version}
    patchShebangs .
    make -C "${KERNELDIR}" M=$(pwd)/drivers/bus -j$NIX_BUILD_CORES
    make -C "${KERNELDIR}" M=$(pwd)/drivers/net/ethernet/sfc -j$NIX_BUILD_CORES
  '';
  makeFlags = [];

  installPhase = ''
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)/drivers/bus modules_install
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)/drivers/net/ethernet/sfc modules_install
  '';

  meta = with lib; {
    description = "SFC kernel drivers";
    platforms = platforms.linux;
  };
}
