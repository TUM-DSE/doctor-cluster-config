{
  stdenv,
  zlib,
  fetchurl,
  autoPatchelfHook,
  llvmPackages_17,
}:
stdenv.mkDerivation {
  name = "llvm-morello-purecap";
  src = fetchurl {
    url = "https://git.morello-project.org/morello/llvm-project-releases/-/archive/morello/linux-aarch64-release-1.9/llvm-project-releases-morello-linux-aarch64-release-1.9.tar.gz";
    sha256 = "sha256-lcmWWi7HsPZ6Ohy3jDCFzvN758PzyttAu/Q1D11PQ1k=";
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
      if builtins.hasAttr "hardeningUnsupportedFlagsByTargetPlatform" llvmPackages_17.clang-unwrapped then
        llvmPackages_17.clang-unwrapped.hardeningUnsupportedFlagsByTargetPlatform targetPlatform
      else
        [ ]
    )
    ++ [ "strictoverflow" ];

  meta = {
    description = "Morello build toolchain";
    platforms = [ "aarch64-linux" ];
  };
}
