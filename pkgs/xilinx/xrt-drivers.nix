{ stdenv, kernel, xrt, lib }:
let
  KERNELDIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
stdenv.mkDerivation rec {
  name = "xrt-drivers";
  dontUnpack = true;
  buildPhase = ''
    export INSTALL_MOD_PATH="$out"

    cp -r ${xrt}/* .
    chmod -R +w .
    cd src/xrt-*/driver/xocl

    pushd mgmtpf
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)
    popd

    pushd userpf
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)
    popd
  '';

  installPhase = ''
    pushd mgmtpf
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd) modules_install
    popd

    pushd userpf
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd) modules_install
    popd
  '';

  meta = with lib; {
    description = "kernel drivers for xrt runtime";
    platforms = platforms.linux;
  };
}
