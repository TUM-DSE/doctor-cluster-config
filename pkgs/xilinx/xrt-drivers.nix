{ stdenv, kernel, xrt, lib }:
let
  KERNELDIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
stdenv.mkDerivation {
  name = "xrt-drivers";
  dontUnpack = true;
  buildPhase = ''
    export INSTALL_MOD_PATH="$out"

    cp -r ${xrt.src}/* .
    chmod -R +w .
    cd src/runtime_src/core/pcie/driver/linux/xocl/

    cp ${xrt}/src/xrt-*/driver/include/version.h .

    pushd mgmtpf
    cp ${xrt}/src/xrt-*/driver/include/version.h .
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)
    popd

    pushd userpf
    cp ${xrt}/src/xrt-*/driver/include/version.h .
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

  passthru = { inherit xrt; };

  meta = with lib; {
    description = "kernel drivers for xrt runtime";
    platforms = platforms.linux;
  };
}
