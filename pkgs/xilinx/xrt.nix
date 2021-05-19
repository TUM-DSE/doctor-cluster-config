{ stdenv
, fetchFromGitHub
, linuxPackages_5_4
, cmake
, mesa
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
, protobuf3_6
, valgrind
, python3Packages
, curl
, opencl-clhpp
, fetchurl
, libyaml
, udev
, dpkg
}:
let
  suffix = "2.9.317";
  version = "202020.${suffix}";
  xrtBin = fetchurl {
    url = "https://www.xilinx.com/bin/public/openDownload?filename=xrt_${version}_20.04-amd64-xrt.deb";
    sha256 = "sha256-NTKjhOtTCFsjNweHOkH8CrM1ZloLM/+36NfM0w14l2Y=";
  };
in stdenv.mkDerivation rec {
  pname = "xrt";
  inherit version;
  src = fetchFromGitHub {
    owner = "Xilinx";
    repo = "XRT";
    rev = version;
    sha256 = "sha256-h9zpNHpm9Ys99wG2xdiXPHkzLkRgmM3Qk1PmQwiQv4c=";
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
    protobuf3_6
    util-linux
    doxygen
    curl
    valgrind
    python3Packages.sphinx
    libyaml
    udev
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
    cd src

    find . -type f -print0 | \
      xargs -0 sed -i -e "s!/opt/xilinx!$out/opt/xilinx!;s!/lib/firmware!$out/lib/firmware!"

    substituteInPlace CMakeLists.txt \
      --replace "/usr" "$out/opt/xilinx"

    find . -type f -iname "*.cmake" -print0 | \
      xargs -0 sed -i -e "s!/usr/src/!$out/src/!;s!/etc/OpenCL!$out/etc/OpenCL!;s!/usr/share/pkgconfig!$out/lib/pkgconfig!"
  '';

  postInstall = ''
    ln -s $out/opt/xilinx/xrt/include $out/include
    ln -s $out/opt/xilinx/xrt $out/include/xrt
    ln -s $out/opt/xilinx/xrt/lib/* $out/lib
  '';

  meta = with stdenv.lib; {
    description = "xilinx runtime library";
    homepage = "https://www.xilinx.com/products/boards-and-kits/alveo/u50.html#gettingStarted";
    license = licenses.mit;
    maintainers = with maintainers; [ mic92 ];
    platforms = [ "x86_64-linux" ];
  };
}
