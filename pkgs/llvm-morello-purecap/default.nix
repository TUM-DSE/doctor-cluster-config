{
  stdenv,
  zlib,
  fetchurl,
  autoPatchelfHook,
  llvmPackages_14,
}:
stdenv.mkDerivation {
  name = "llvm-morello-purecap";
  src = fetchurl {
    url = "https://git.morello-project.org/morello/llvm-project-releases/-/archive/morello/linux-aarch64-release-1.8/llvm-project-releases-morello-linux-aarch64-release-1.8.tar.gz";
    sha256 = "sha256-6kPG5y6wDFFiI+x/MYzdF6Rh6uSiclCz2nTN8OOQOQw=";
    downloadToTemp = true;
  };

  installPhase = ''
    cp -r ./ $out/
  '';

  buildInputs = [
    zlib
    stdenv.cc.cc
  ];
  nativeBuildInputs = [ autoPatchelfHook ];
  doInstallCheck = true;
  installCheckPhase = ''
    $out/bin/clang --version
    $out/bin/ld.lld --version
  '';
  passthru.isClang = true;
  passthru.hardeningUnsupportedFlagsByTargetPlatform =
    targetPlatform:
    (
      if builtins.hasAttr "hardeningUnsupportedFlagsByTargetPlatform" llvmPackages_14.clang-unwrapped then
        llvmPackages_14.clang-unwrapped.hardeningUnsupportedFlagsByTargetPlatform targetPlatform
      else
        [ ]
    )
    ++ [ "strictoverflow" ];

  meta = {
    description = "Morello build toolchain";
    platforms = [ "aarch64-linux" ];
  };
}

