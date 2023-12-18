{ stdenv
, lib
, fetchFromGitHub
, cmake
, libdrm
, pkg-config
, opencl-headers
, ocl-icd
, git
, boost
, ncurses
, openssl
, protobuf
, util-linux
, doxygen
, valgrind
, python3Packages
, curl
, opencl-clhpp
, fetchurl
, libyaml
, udev
, dpkg
, rapidjson
, libxcrypt
}:
let
  suffix = "2.16.204";
  version = "202320.${suffix}";
  xrtBin = fetchurl {
    url = "https://www.xilinx.com/bin/public/openDownload?filename=xrt_${version}_22.04-amd64-xrt.deb";
    sha256 = "sha256-FEhzx2KlIYpunXmTSBjtyAtblbuz5tkvnt2qp21gUho=";
  };
in
stdenv.mkDerivation rec {
  pname = "xrt";
  inherit version;
  src = fetchFromGitHub {
    owner = "Xilinx";
    repo = "XRT";
    rev = version;
    fetchSubmodules = true;
    sha256 = "sha256-j6BE6Vx+FzztnPY9m+GQK1sUwf2areNp6oTzas/ITks=";
  };

  enableParallelBuilding = true;

  # we take the matter in our own hand
  dontFixCmake = true;

  buildInputs = [
    libdrm
    opencl-clhpp
    opencl-headers
    ocl-icd
    boost
    ncurses
    openssl
    util-linux
    doxygen
    curl
    valgrind
    python3Packages.sphinx
    python3Packages.pybind11
    libyaml
    udev
    rapidjson
    protobuf
    libxcrypt
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
    git
    dpkg
  ];

  NIX_CFLAGS_COMPILE = [ "-Wno-error" ];

  preConfigure = ''
    dpkg-deb -x ${xrtBin} root
    export XRT_FIRMWARE_DIR=$(pwd)/root/lib/firmware/xilinx
    if [ ! -d $XRT_FIRMWARE_DIR ]; then
      echo "NO xrt firmware found in binary release"
      false
    fi
    # Fake git info: https://github.com/Xilinx/XRT/blob/f0f31af48d4545bc9fe77a64ded241db0f564deb/src/CMake/version.cmake#L33C29-L33C50

    export GIT_AUTHOR_NAME="John Doe"
    export GIT_AUTHOR_EMAIL=john@example.com
    export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
    export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
    git init .
    git add .
    git commit -m 'fake commit'
    git checkout -b origin/master

    cd src

    find . -type f -print0 | \
      xargs -0 sed -i -e "s!/opt/xilinx!$out/opt/xilinx!;s!/lib/firmware!$out/lib/firmware!"

    substituteInPlace CMakeLists.txt \
      --replace "/usr" "$out/opt/xilinx"

    find . -type f \( -iname "*.cmake" -o -iname CMakeLists.txt -o -iname "postinst.in" \) -print0 | \
      xargs -0 --verbose sed -i -e "s!/usr/local/bin!$out/bin!;s!/usr/src/!$out/src/!;s!/etc/OpenCL!$out/etc/OpenCL!;s!/usr/share/pkgconfig!$out/lib/pkgconfig!"
  '';

  postInstall = ''
    ln -s $out/opt/xilinx/xrt/include $out/include
    ln -s $out/opt/xilinx/xrt $out/include/xrt
    ln -s $out/opt/xilinx/xrt/lib/* $out/lib
    ln -s /opt/xilinx/firmware $out/opt/xilinx/firmware
    ln -s $out/lib/firmware/xilinx $out/opt/xilinx/xrt/share/fw
  '';

  meta = with lib; {
    description = "xilinx runtime library";
    homepage = "https://www.xilinx.com/products/boards-and-kits/alveo/u50.html#gettingStarted";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
