{ lib
, stdenv
, fetchFromGitHub
, kernel
, nvidiaOpenSrc
, breakpointHook
, enableDebug ? false
}:

stdenv.mkDerivation rec {
  pname = "nvidia-fs";
  version = "2.29.4";

  src = fetchFromGitHub {
    owner = "NVIDIA";
    repo = "gds-nvidia-fs";
    rev = "v${version}";
    hash = "sha256-XuyO2uEQ3IbE7L5eHo32ePSmPgvtUU01MJysXyCR8YA=";
  };

  nativeBuildInputs = kernel.moduleBuildDependencies
    ++ lib.optionals enableDebug [ breakpointHook ];

  postPatch = ''
    # The configure script hardcodes KDIR from /lib/modules which doesn't exist
    # in the Nix build sandbox — allow it to be overridden from the environment.
    substituteInPlace src/configure \
      --replace-fail 'export MODULES_DIR=/lib/modules/$KVER' \
                     'export MODULES_DIR=''${MODULES_DIR:-/lib/modules/$KVER}' \
      --replace-fail 'export KDIR=$MODULES_DIR/build' \
                     'export KDIR=''${KDIR:-$MODULES_DIR/build}'
    substituteInPlace src/Makefile \
      --replace-fail 'KDIR := $(MODULES_DIR)/build' \
                     'KDIR ?= $(MODULES_DIR)/build'
  '';

  buildPhase = ''
    runHook preBuild
    cd src

    # nvidia_p2p_* symbol versioning is skipped without the running nvidia.ko;
    # insmod will warn but the module loads fine.
    touch nv.symvers

    export KDIR="${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    export KVER="${kernel.modDirVersion}"

    # Detect kernel API variants — generates config-host.h
    bash ./configure "$KVER"

    gds_version="$(cat GDS_VERSION)"
    KCPPFLAGS="-DCONFIG_NVFS_STATS=y -DGDS_VERSION=$gds_version -DNVFS_BATCH_SUPPORT=y" \
    make -j"$NIX_BUILD_CORES" -C "$KDIR" \
      M="$(pwd)" \
      NVIDIA_SRC_DIR="${nvidiaOpenSrc}/kernel-open/nvidia" \
      CONFIG_NVFS_STATS=y \
      CONFIG_NVFS_BATCH_SUPPORT=y \
      "KBUILD_EXTRA_SYMBOLS=$(pwd)/nv.symvers" \
      KBUILD_MODPOST_WARN=1 \
      modules

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -D "nvidia-fs.ko" \
      "$out/lib/modules/${kernel.modDirVersion}/kernel/fs/nvidia-fs/nvidia-fs.ko"
    runHook postInstall
  '';

  meta = with lib; {
    description = "NVIDIA GPUDirect Storage kernel module (nvidia-fs)";
    homepage = "https://github.com/NVIDIA/gds-nvidia-fs";
    license = licenses.gpl2Plus;
    platforms = [ "x86_64-linux" ];
  };
}
