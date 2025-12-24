{
  stdenv,
  zlib,
  fetchzip,
  autoPatchelfHook,
  llvmPackages_18,
}:
stdenv.mkDerivation {
  name = "morello-clang";
  src = fetchzip {
    url = "https://github.com/TUM-DSE/doctor-cluster-config/releases/download/morello/artifacts.zip";
    sha256 = "sha256-wKPXKmCP2aNeToTa4goey1uiNcG87o/x3Vt50ukCkgg";
    stripRoot = false;
  };
  installPhase = ''
    tar -xf llvm-morello-linux-aarch64-clang.tar.gz
    mv llvm-morello-linux-aarch64/ $out
  '';
  buildInputs = [
    zlib
    stdenv.cc.cc
  ];
  nativeBuildInputs = [ autoPatchelfHook ];
  doInstallCheck = true;
  installCheckPhase = ''
    $out/bin/clang --version
  '';
  passthru.isClang = true;
  passthru.hardeningUnsupportedFlagsByTargetPlatform =
    targetPlatform:
    (
      if builtins.hasAttr "hardeningUnsupportedFlagsByTargetPlatform" llvmPackages_18.clang-unwrapped then
        llvmPackages_18.clang-unwrapped.hardeningUnsupportedFlagsByTargetPlatform targetPlatform
      else
        [ ]
    )
    ++ [ "strictoverflow" "stackclashprotection" ];

  meta = {
    description = "Morello build toolchain";
    platforms = [ "aarch64-linux" ];
  };
}
