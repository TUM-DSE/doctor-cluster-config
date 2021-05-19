{ stdenv, kernel, callPackage }:
let
  xrt = callPackage ./xrt.nix {};
  KERNELDIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
stdenv.mkDerivation rec {
  pname = "xrt-drivers";
  dontUnpack = true;
  buildPhase = ''
    export INSTALL_MOD_PATH="$out"

    modDir=$(echo ${xrt}/src/xrt-*/driver/xocl)
    cp -r "$modDir" xocl
    chmod -R +w xocl

    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)/mgmtpf
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)/userpf
  '';
  installPhase = ''
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)/mgmtpf modules_install
    make -C "${KERNELDIR}" -j$NIX_BUILD_CORES M=$(pwd)/userpf modules_install
  '';
}
