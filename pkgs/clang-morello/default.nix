{
  stdenv,
  zlib,
  fetchzip,
  autoPatchelfHook,
  llvmPackages_14,
}:
stdenv.mkDerivation {
  name = "morello-clang";
  src = fetchzip {
    url = "https://github.com/TUM-DSE/doctor-cluster-config/releases/download/morello/artifacts.zip";
    sha256 = "sha256-4D7Psufm80nb1CdN637FWcl7/djBGkWoHM8Kzg8tlaA=";
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
