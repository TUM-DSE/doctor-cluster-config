{
  lib,
  stdenv,
  kernel,
  src,
  coyotePlatform ? "ultrascale_plus",
}:

let
  kernelDir = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
stdenv.mkDerivation {
  pname = "coyote-driver";
  version = "0-unstable-${src.shortRev or "dirty"}-${kernel.version}";

  inherit src;
  dontUnpack = true;

  nativeBuildInputs = kernel.moduleBuildDependencies;
  hardeningDisable = [ "pic" ];
  enableParallelBuilding = true;

  buildPhase = ''
    runHook preBuild
    cp -r ${src}/driver ./driver
    chmod -R u+w ./driver
    cd ./driver
    make -j"$NIX_BUILD_CORES" \
      KERNELDIR="${kernelDir}" \
      TARGET_PLATFORM="${coyotePlatform}"
    cd ..
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm444 driver/build/coyote_driver.ko \
      "$out/lib/modules/${kernel.modDirVersion}/extra/coyote_driver.ko"
    runHook postInstall
  '';

  passthru = { inherit coyotePlatform kernel; };

  meta = {
    description = "Coyote FPGA Linux kernel driver";
    homepage = "https://github.com/fpgasystems/Coyote";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux;
  };
}
